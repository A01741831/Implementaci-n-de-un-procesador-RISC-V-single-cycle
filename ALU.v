module ALU(
	input [31:0] SrcA,SrcB,
	input [2:0] ALUControl,
	output reg [31:0] ALUResult,
	output reg Zero
	);
	
	always @(*)
		begin
			case(ALUControl)
				3'b000: ALUResult = SrcA + SrcB;       // ADD
				3'b001: ALUResult = SrcA - SrcB;       // SUB
				3'b010: ALUResult = SrcA & SrcB;       // AND
				3'b011: ALUResult = SrcA | SrcB;       // OR
				3'b101: ALUResult = (SrcA < SrcB) ? 1 : 0; // SLT
				default: ALUResult = 0;
			endcase
			
			if(ALUResult==0)
				Zero=1;
			else
				Zero=0;
		end
endmodule