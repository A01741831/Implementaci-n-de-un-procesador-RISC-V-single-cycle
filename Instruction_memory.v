module Instruction_memory #(parameter DATA_WIDTH=32 , ADDRESS_WIDTH=32)(
	input A, RD,
	input [ADDRESS_WIDTH-1:0] address,
	output [DATA_WIDTH-1:0] data
);
	
	reg [DATA_WIDTH -1:0] mem[0:(1<<ADDRESS_WIDTH)-1];
	
	initial begin
		$readmemh("C:/Users/anarg/Downloads/instructions.mem", mem);
	end
			
	assign data = (A && RD) ? mem[address] : 32'h00000000;

endmodule