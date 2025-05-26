module Data_memory(
	input [31:0] A,WD,
	input clk,WE,
	output reg [31:0] RD
	);
	
	reg [31:0] Data_mem [10000:0];
	
	always @(posedge clk)
		begin
			if(WE==1)
				Data_mem[A]<=WD;
			else
				RD<=Data_mem[A];
		end
endmodule