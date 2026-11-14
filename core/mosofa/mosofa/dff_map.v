// Rising edge DFF
module \$_DFF_P_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dff _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
endmodule

// Rising edge DFF with async active-high reset
module \$_DFF_PP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

// Rising edge DFF with async active-high set
module \$_DFF_PP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffs _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
endmodule

// Rising edge DFF with async active-low reset
module \$_DFF_PN0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R));
endmodule

// Rising edge DFF with async active-low set
module \$_DFF_PN1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffsn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R));
endmodule

// Rising edge DFF with sync active-high reset
module \$_SDFF_PP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

// Rising edge DFF with sync active-high set
module \$_SDFF_PP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffs _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
endmodule

// Rising edge DFF with sync active-low reset
module \$_SDFF_PN0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R));
endmodule

// Rising edge DFF with sync active-low set
module \$_SDFF_PN1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffsn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R));
endmodule

// Falling edge DFF
module \$_DFF_N_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
endmodule

// Falling edge DFF with async active-high reset
module \$_DFF_NP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

// Falling edge DFF with async active-high set
module \$_DFF_NP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffns _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
endmodule

// Falling edge DFF with async active-low reset
module \$_DFF_NN0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R));
endmodule

// Falling edge DFF with async active-low set
module \$_DFF_NN1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnsn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R));
endmodule

// Falling edge DFF with sync active-high reset
module \$_SDFF_NP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

// Falling edge DFF with sync active-high set
module \$_SDFF_NP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffns _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
endmodule

// Falling edge DFF with sync active-low reset
module \$_SDFF_NN0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R));
endmodule

// Falling edge DFF with sync active-low set
module \$_SDFF_NN1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnsn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R));
endmodule

// ============================================================
// D flip-flops with enable
// Naming: dff[n] e[n] [r|rn|s|sn]
//   n after dff = falling edge; e = enable, en = active-low enable
//   r/s = reset/set, trailing n = active-low reset/set
// Enable pin: E (active-high) or EN (active-low)
// ============================================================

// Rising edge DFF with active-high enable
module \$_DFFE_PP_ (D, C, E, Q);
    input D;
    input C;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffe _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E));
endmodule

// Rising edge DFF with active-low enable
module \$_DFFE_PN_ (D, C, E, Q);
    input D;
    input C;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffen _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .EN(E));
endmodule

// Falling edge DFF with active-high enable
module \$_DFFE_NP_ (D, C, E, Q);
    input D;
    input C;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffne _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .E(E));
endmodule

// Falling edge DFF with active-low enable
module \$_DFFE_NN_ (D, C, E, Q);
    input D;
    input C;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnen _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .EN(E));
endmodule

// Rising edge DFF with async active-high reset and active-high enable
module \$_DFFE_PP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffer _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .E(E));
endmodule

// Rising edge DFF with async active-high reset and active-low enable
module \$_DFFE_PP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .EN(E));
endmodule

// Rising edge DFF with async active-high set and active-high enable
module \$_DFFE_PP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .E(E));
endmodule

// Rising edge DFF with async active-high set and active-low enable
module \$_DFFE_PP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .EN(E));
endmodule

// Rising edge DFF with async active-low reset and active-high enable
module \$_DFFE_PN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .E(E));
endmodule

// Rising edge DFF with async active-low reset and active-low enable
module \$_DFFE_PN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .EN(E));
endmodule

// Rising edge DFF with async active-low set and active-high enable
module \$_DFFE_PN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .E(E));
endmodule

// Rising edge DFF with async active-low set and active-low enable
module \$_DFFE_PN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .EN(E));
endmodule

// Falling edge DFF with async active-high reset and active-high enable
module \$_DFFE_NP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffner _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .E(E));
endmodule

// Falling edge DFF with async active-high reset and active-low enable
module \$_DFFE_NP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .EN(E));
endmodule

// Falling edge DFF with async active-high set and active-high enable
module \$_DFFE_NP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .E(E));
endmodule

// Falling edge DFF with async active-high set and active-low enable
module \$_DFFE_NP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .EN(E));
endmodule

// Falling edge DFF with async active-low reset and active-high enable
module \$_DFFE_NN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .E(E));
endmodule

// Falling edge DFF with async active-low reset and active-low enable
module \$_DFFE_NN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .EN(E));
endmodule

// Falling edge DFF with async active-low set and active-high enable
module \$_DFFE_NN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .E(E));
endmodule

// Falling edge DFF with async active-low set and active-low enable
module \$_DFFE_NN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffnensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .EN(E));
endmodule

// Rising edge DFF with sync active-high reset, active-high enable (reset has priority over enable)
module \$_SDFFE_PP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffer _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .E(E));
endmodule

// Rising edge DFF with sync active-high reset, active-low enable (reset has priority over enable)
module \$_SDFFE_PP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .EN(E));
endmodule

// Rising edge DFF with sync active-high set, active-high enable (reset has priority over enable)
module \$_SDFFE_PP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .E(E));
endmodule

// Rising edge DFF with sync active-high set, active-low enable (reset has priority over enable)
module \$_SDFFE_PP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .EN(E));
endmodule

// Rising edge DFF with sync active-low reset, active-high enable (reset has priority over enable)
module \$_SDFFE_PN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .E(E));
endmodule

// Rising edge DFF with sync active-low reset, active-low enable (reset has priority over enable)
module \$_SDFFE_PN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .EN(E));
endmodule

// Rising edge DFF with sync active-low set, active-high enable (reset has priority over enable)
module \$_SDFFE_PN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .E(E));
endmodule

// Rising edge DFF with sync active-low set, active-low enable (reset has priority over enable)
module \$_SDFFE_PN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .EN(E));
endmodule

// Falling edge DFF with sync active-high reset, active-high enable (reset has priority over enable)
module \$_SDFFE_NP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffner _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .E(E));
endmodule

// Falling edge DFF with sync active-high reset, active-low enable (reset has priority over enable)
module \$_SDFFE_NP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R), .EN(E));
endmodule

// Falling edge DFF with sync active-high set, active-high enable (reset has priority over enable)
module \$_SDFFE_NP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .E(E));
endmodule

// Falling edge DFF with sync active-high set, active-low enable (reset has priority over enable)
module \$_SDFFE_NP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R), .EN(E));
endmodule

// Falling edge DFF with sync active-low reset, active-high enable (reset has priority over enable)
module \$_SDFFE_NN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .E(E));
endmodule

// Falling edge DFF with sync active-low reset, active-low enable (reset has priority over enable)
module \$_SDFFE_NN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R), .EN(E));
endmodule

// Falling edge DFF with sync active-low set, active-high enable (reset has priority over enable)
module \$_SDFFE_NN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .E(E));
endmodule

// Falling edge DFF with sync active-low set, active-low enable (reset has priority over enable)
module \$_SDFFE_NN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    sdffnensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R), .EN(E));
endmodule

// Rising edge DFF with sync active-high reset, active-high enable (enable has priority over reset)
module \$_SDFFCE_PP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & E;
    sdffer _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R_i), .E(E));
endmodule

// Rising edge DFF with sync active-high reset, active-low enable (enable has priority over reset)
module \$_SDFFCE_PP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & ~E;
    sdffenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R_i), .EN(E));
endmodule

// Rising edge DFF with sync active-high set, active-high enable (enable has priority over reset)
module \$_SDFFCE_PP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & E;
    sdffes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R_i), .E(E));
endmodule

// Rising edge DFF with sync active-high set, active-low enable (enable has priority over reset)
module \$_SDFFCE_PP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & ~E;
    sdffens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R_i), .EN(E));
endmodule

// Rising edge DFF with sync active-low reset, active-high enable (enable has priority over reset)
module \$_SDFFCE_PN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(E);
    sdffern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R_i), .E(E));
endmodule

// Rising edge DFF with sync active-low reset, active-low enable (enable has priority over reset)
module \$_SDFFCE_PN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(~E);
    sdffenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R_i), .EN(E));
endmodule

// Rising edge DFF with sync active-low set, active-high enable (enable has priority over reset)
module \$_SDFFCE_PN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(E);
    sdffesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R_i), .E(E));
endmodule

// Rising edge DFF with sync active-low set, active-low enable (enable has priority over reset)
module \$_SDFFCE_PN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(~E);
    sdffensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R_i), .EN(E));
endmodule

// Falling edge DFF with sync active-high reset, active-high enable (enable has priority over reset)
module \$_SDFFCE_NP0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & E;
    sdffner _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R_i), .E(E));
endmodule

// Falling edge DFF with sync active-high reset, active-low enable (enable has priority over reset)
module \$_SDFFCE_NP0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & ~E;
    sdffnenr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R_i), .EN(E));
endmodule

// Falling edge DFF with sync active-high set, active-high enable (enable has priority over reset)
module \$_SDFFCE_NP1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & E;
    sdffnes _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R_i), .E(E));
endmodule

// Falling edge DFF with sync active-high set, active-low enable (enable has priority over reset)
module \$_SDFFCE_NP1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R & ~E;
    sdffnens _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R_i), .EN(E));
endmodule

// Falling edge DFF with sync active-low reset, active-high enable (enable has priority over reset)
module \$_SDFFCE_NN0P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(E);
    sdffnern _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R_i), .E(E));
endmodule

// Falling edge DFF with sync active-low reset, active-low enable (enable has priority over reset)
module \$_SDFFCE_NN0N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(~E);
    sdffnenrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R_i), .EN(E));
endmodule

// Falling edge DFF with sync active-low set, active-high enable (enable has priority over reset)
module \$_SDFFCE_NN1P_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(E);
    sdffnesn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R_i), .E(E));
endmodule

// Falling edge DFF with sync active-low set, active-low enable (enable has priority over reset)
module \$_SDFFCE_NN1N_ (D, C, R, E, Q);
    input D;
    input C;
    input R;
    input E;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    wire R_i = R | ~(~E);
    sdffnensn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R_i), .EN(E));
endmodule