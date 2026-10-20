#include "kernel/celltypes.h"
#include "kernel/log.h"
#include "kernel/register.h"
#include "kernel/rtlil.h"

using namespace std;
/* Constants for device name */
constexpr const char *SOFA_HD_DNAME = "sofa-hd";
constexpr const char *QLSOFA_HD_DNAME = "qlsofa-hd";
constexpr const char *SOFA_PLUS_HD_DNAME = "sofa-plus-hd";

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

#define XSTR(val) #val
#define STR(val) XSTR(val)

#ifndef PASS_NAME
#define PASS_NAME synth_sofa
#endif

struct SynthSofaPass : public ScriptPass {

  SynthSofaPass()
      : ScriptPass(STR(PASS_NAME), "Synthesis for Sofa FPGAs") {}

  void help() override {
    log("\n");
    log("   %s [options]\n", STR(PASS_NAME));
    log("This command runs synthesis for Sofa FPGAs\n");
    log("\n");
    log("    -top <module>\n");
    log("         use the specified module as top module\n");
    log("\n");
    log("    -family <family>\n");
    log("        run synthesis for the specified Sofa architecture\n");
    log("        generate the synthesis netlist for the specified family.\n");
    log("        supported values:\n");
    log("          " + string(SOFA_HD_DNAME) + "\n");
    log("          " + string(QLSOFA_HD_DNAME) + "\n");
    log("          " + string(SOFA_PLUS_HD_DNAME) + "\n");
    log("\n");
    log("    -blif <file>\n");
    log("        write the design to the specified BLIF file. Writing of an "
        "output file\n");
    log("        is omitted if this parameter is not specified.\n");
    log("\n");
    log("    -verilog <file>\n");
    log("        write the design to the specified verilog file. Writing of an "
        "output\n");
    log("        file is omitted if this parameter is not specified.\n");
    log("\n");
    log("    -no_adder\n");
    log("        By default use adder cells in output netlist.\n");
    log("        Specifying this switch turns it off.\n");
    log("\n");
    log("    -K <int>\n");
    log("        Specify the input size of LUT when running optimization. If "
        "not specified, a default value will be applied. Please do not modify "
        "this parameter except architecture exploration\n");
    help_script();
  }

  std::string top_opt, blif_file, family, verilog_file,
      lib_path;
  bool no_opt;
  bool abc9;
  bool inferAdder;
  bool inferDsp;
  bool show_help;
  size_t DEFAULT_K = 4;
  size_t MIN_K = 4;
  size_t MAX_K = 6;
  size_t max_lut_size = DEFAULT_K;

  void clear_flags() override {
    top_opt = "-auto-top";
    blif_file = "";
    verilog_file = "";
    family = SOFA_DNAME;
    inferAdder = true;
    inferDsp = true;
    no_opt = false;
    abc9 = false;
    lib_path = "+/yosuf/";
    show_help = false;
    max_lut_size = DEFAULT_K;
  }

  void execute(std::vector<std::string> args, RTLIL::Design *design) override {
    string run_from, run_to;
    clear_flags();
    lib_path = design->scratchpad_get_string("sofa.lib_path", lib_path);
    size_t argidx;
    for (argidx = 1; argidx < args.size(); argidx++) {
      if (args[argidx] == "-run" && argidx + 1 < args.size()) {
        size_t pos = args[argidx + 1].find(':');
        if (pos == std::string::npos) {
          run_from = args[++argidx];
          run_to = args[argidx];
        } else {
          run_from = args[++argidx].substr(0, pos);
          run_to = args[argidx].substr(pos + 1);
        }
        continue;
      }
      if (args[argidx] == "-top" && argidx + 1 < args.size()) {
        top_opt = "-top " + args[++argidx];
        continue;
      }
      if (args[argidx] == "-family" && argidx + 1 < args.size()) {
        family = args[++argidx];
        continue;
      }
      if (args[argidx] == "-blif" && argidx + 1 < args.size()) {
        blif_file = args[++argidx];
        continue;
      }
      if (args[argidx] == "-verilog" && argidx + 1 < args.size()) {
        verilog_file = args[++argidx];
        continue;
      }
      if (args[argidx] == "-K" && argidx + 1 < args.size()) {
        max_lut_size = std::stoi(args[++argidx]);
        continue;
      }
      if (args[argidx] == "-no_adder") {
        inferAdder = false;
        continue;
      }
      if (args[argidx] == "-no_dsp") {
        inferDsp = false;
        continue;
      }
      if (args[argidx] == "-no_opt") {
        no_opt = false;
        continue;
      }
      if (args[argidx] == "-help") {
        show_help = true;
        continue;
      }
      break;
    }
    extra_args(args, argidx, design);

    if (show_help) {
      help();
      return;
    }

    if (!design->full_selection()) {
      log_cmd_error("This command only operates on fully selected designs!\n");
    }
    /* Pre-check on family name and confirm on selection*/
    if (family != SOFA_HD_DNAME && family != QLSOFA_HD_DNAME  && family != SOFA_PLUS_HD_DNAME) {
      log_cmd_error("Invalid family specified: '%s'\n", family.c_str());
    }
    log("Selected device family: %s\n", family.c_str());
    if (family == SOFA_HD_DNAME) {
      inferAdder = false;
      inferDsp = false;
    } else if (family == QLSOFA_HD_DNAME) {
      inferAdder = true;
      inferDsp = false;
    }
    /* By default, no opt should be enabled. Throw a warning if not */
    if (no_opt) {
      log_warning("Force to disable any optimization, which may cast an "
                  "negative impact on QoR\n");
    }
    if (abc9 && design->scratchpad_get_int("abc9.D", 0) == 0) {
      log_warning("Delay target has not been set via SDC or scratchpad; "
                  "Assuming 1GHz clock.\n");
      design->scratchpad_set_int("abc9.W",
                                 1000); // set interconnet delay as 1ns
    }
    /* Sanity checks on max lut size */
    if (max_lut_size < MIN_K || max_lut_size > MAX_K) {
      log_cmd_error(
          "The provided K=%ld is out of the acceptable range [%ld, %ld]!\n",
          max_lut_size, MIN_K, MAX_K);
      return;
    }

    log_header(design, "Executing SYNTH_SOFA pass.\n");
    log_push();

    run_script(design, run_from, run_to);
    log_pop();
  }

  void script() override {
    if (help_mode) {
      family = "<family>";
    }

    if (check_label("begin")) {
      std::string family_path = " " + lib_path + family;
      std::string read_vlog_args;

      // Read simulation library
      read_vlog_args = family_path + "/cell_sim.v";

      // Use -nomem2reg here to prevent Yosys from complaining about
      // some block ram cell models. After all the only part of the cells
      // library required here is cell port definitions plus specify blocks.
      run("read_verilog -lib -specify -nomem2reg " + read_vlog_args);
      run("logger -werror \"multiple conflicting drivers\"");
      run("check");
      run(stringf("hierarchy -check %s",
                  help_mode ? "-top <top>" : top_opt.c_str()));
      run("stat");
    }

    if (check_label("prepare")) {
      run("proc");
      run("flatten");
      if (help_mode) {
        run("tribuf -logic");
      }
      if (!no_opt) {
        run("opt_expr");
        run("opt_clean");
      }
      run("deminout");
      if (!no_opt) {
        run("opt -nodffe");
      }

      run("check");
      if (!no_opt) {
        run("opt -nodffe");
        run("fsm");
        run("opt -nodffe");
        run("wreduce -keepdc");
        run("peepopt");
        run("pmuxtree");
        run("opt_clean");
        run("share");
      }
    }

    if (check_label("coarse")) {
      run("techmap -map +/cmp2lut.v -D LUT_WIDTH=" + std::to_string(max_lut_size));
      if (!no_opt) {
        run("opt_expr");
        run("opt_clean");
      }
      run("alumacc");
      run("pmuxtree");
      if (!no_opt) {
        run("opt -nodffe");
      }
      run("memory -nomap");
      if (!no_opt) {
        run("opt_clean");
      }
    }

    if (check_label("map_gates")) {
      if (help_mode ||
          (inferAdder && (family == SOFA_DNAME))) {
        run("techmap -map +/techmap.v -map " + lib_path + family +
                "/arith_map.v",
            "(unless -no_adder)");
      } else {
        run("techmap");
      }
      if (!no_opt) {
        run("opt -fast -nodffe");
        run("opt_expr");
        run("opt_merge");
        run("opt_clean");
        run("opt -nodffe");
      }
    }

    if (check_label("map_ffs")) {
      run("memory");
      /* TODO: Support shift-register mapping */
      /* Run 2 times dff mapping incase anything missing */
      /* Only support DFF triggered at rising edge and initialized to 0 */
      run("dfflegalize -cell $_DFF_PP0_ 0 ");
      run("techmap -map " + lib_path + family + "/dff_map.v");
      run("dfflegalize -cell $_DFF_PP0_ 0);
      run("techmap -map " + lib_path + family + "/dff_map.v");
      run("opt_expr -mux_undef");
      run("simplemap");
      run("opt_expr");
      if (!no_opt) {
        run("opt_merge");
        run("opt_dff -nodffe");
        run("opt_clean");
        run("opt -nodffe");
      }
    }

    if (check_label("map_luts")) {
      run("abc -lut " + std::to_string(max_lut_size));
      /* Map dff and adder again since ABC may generate new gates */
      run("techmap -map " + lib_path + family + "/dff_map.v");
      run("techmap -map " + lib_path + family + "/arith_map.v");
    }

    if (check_label("check")) {
      run("autoname");
      run("hierarchy -check");
      run("stat");
      run("check -noinit");
    }

    if (check_label("finalize")) {
      if (!no_opt) {
        run("opt_clean -purge");
      }
      run("check");
    }

    if (check_label("blif", "(if -blif)")) {
      if (help_mode || !blif_file.empty()) {
        run(stringf("write_blif -param %s ",
                    help_mode ? "<file-name>" : blif_file.c_str()));
      }
    }

    if (check_label("verilog", "(if -verilog)")) {
      if (help_mode || !verilog_file.empty()) {
        run("write_verilog -noattr -nohex " +
            (help_mode ? "<file-name>" : verilog_file));
      }
    }

    if (check_label("save_block_diagram", "(if -save_block_diagram)")) {
      if (!block_diagram_file.empty()) {
        run(stringf("show -format svg -prefix %s", block_diagram_file.c_str()));
      }
    }
  }

} SynthSofaPass;

PRIVATE_NAMESPACE_END
