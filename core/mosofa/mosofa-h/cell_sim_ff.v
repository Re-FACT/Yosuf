//-----------------------------
// Rising-edge D-type flip-flop
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dff(
    output reg Q,
    input D,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                Q <= D;
          1'b1:
            always @(negedge C)
                Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffs(
    output reg Q,
    input D,
    input S,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffsn(
    output reg Q,
    input D,
    input SN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffs(
    output reg Q,
    input D,
    input S,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffsn(
    output reg Q,
    input D,
    input SN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffn(
    output reg Q,
    input D,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                Q <= D;
          1'b1:
            always @(negedge C)
                Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffns(
    output reg Q,
    input D,
    input S,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnsn(
    output reg Q,
    input D,
    input SN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffns(
    output reg Q,
    input D,
    input S,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnsn(
    output reg Q,
    input D,
    input SN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffe(
    output reg Q,
    input D,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffer(
    output reg Q,
    input D,
    input R,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffes(
    output reg Q,
    input D,
    input S,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffern(
    output reg Q,
    input D,
    input RN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffesn(
    output reg Q,
    input D,
    input SN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffer(
    output reg Q,
    input D,
    input R,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffes(
    output reg Q,
    input D,
    input S,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffern(
    output reg Q,
    input D,
    input RN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-high enable and active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffesn(
    output reg Q,
    input D,
    input SN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffen(
    output reg Q,
    input D,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffenr(
    output reg Q,
    input D,
    input R,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffens(
    output reg Q,
    input D,
    input S,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffenrn(
    output reg Q,
    input D,
    input RN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffensn(
    output reg Q,
    input D,
    input SN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffenr(
    output reg Q,
    input D,
    input R,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffens(
    output reg Q,
    input D,
    input S,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffenrn(
    output reg Q,
    input D,
    input RN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Rising-edge D-type flip-flop with active-low enable and active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffensn(
    output reg Q,
    input D,
    input SN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffne(
    output reg Q,
    input D,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffner(
    output reg Q,
    input D,
    input R,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnes(
    output reg Q,
    input D,
    input S,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnern(
    output reg Q,
    input D,
    input RN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnesn(
    output reg Q,
    input D,
    input SN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffner(
    output reg Q,
    input D,
    input R,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnes(
    output reg Q,
    input D,
    input S,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnern(
    output reg Q,
    input D,
    input RN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-high enable and active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnesn(
    output reg Q,
    input D,
    input SN,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (E == 1'b1)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnen(
    output reg Q,
    input D,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-high asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnenr(
    output reg Q,
    input D,
    input R,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-high asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnens(
    output reg Q,
    input D,
    input S,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or posedge S)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnenrn(
    output reg Q,
    input D,
    input RN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-low asynchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffnensn(
    output reg Q,
    input D,
    input SN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C or negedge SN)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-high synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnenr(
    output reg Q,
    input D,
    input R,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (R == 1'b1)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-high synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnens(
    output reg Q,
    input D,
    input S,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (S == 1'b1)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-low synchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnenrn(
    output reg Q,
    input D,
    input RN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule

//-----------------------------
// Falling-edge D-type flip-flop with active-low enable and active-low synchronous set
//-----------------------------
(* abc9_flop, lib_whitebox *)
module sdffnensn(
    output reg Q,
    input D,
    input SN,
    input EN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b1;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
          1'b1:
            always @(negedge C)
                if (SN == 1'b0)
                        Q <= 1'b1;
                else if (EN == 1'b0)
                        Q <= D;
    endcase
endmodule