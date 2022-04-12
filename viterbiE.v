module viterbiE(
  input         clock,
  input         reset,
  input  [63:0] io_in,
  output [63:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] z0; // @[logic.scala 17:19]
  reg [63:0] z1; // @[logic.scala 18:19]
  reg [63:0] z2; // @[logic.scala 19:19]
  wire [63:0] _T = z0 ^ z1; // @[logic.scala 21:15]
  wire [63:0] x1 = _T ^ z2; // @[logic.scala 21:20]
  wire [63:0] x2 = z0 ^ z2; // @[logic.scala 22:15]
  wire [127:0] _T_1 = {x1,x2}; // @[Cat.scala 30:58]
  assign io_out = _T_1[63:0]; // @[logic.scala 24:10]
  always @(posedge clock) begin
    z0 <= io_in; // @[logic.scala 17:19]
    z1 <= z0; // @[logic.scala 18:19]
    z2 <= z1; // @[logic.scala 19:19]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  z0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  z1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  z2 = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
