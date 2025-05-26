module RISC_single_cycle_tb(
);
reg clk;
    
    RISC_single_cycle dut(.clk(clk));
  
    initial clk = 0;
    always #5 clk = ~clk;

    initial #1000 $finish;

endmodule