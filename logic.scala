



// by Philip Sisa M.
// viterbi aproach from https://www.youtube.com/watch?v=r0hJxzJyIw8

import chisel3._
import chisel3.util._

class viterbiE extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(64.W))
    val out = Output(UInt(64.W))
  })

  val z0 = RegNext(io.in)
  val z1 = RegNext(z0)
  val z2 = RegNext(z1)
  
  val x1 = z0 ^ z1 ^ z2
  val x2 = z0 ^ z2

  io.out := Cat(x1, x2)


}

object myVerilog extends App {

  (new chisel3.stage.ChiselStage).emitVerilog(new viterbiE())
}
