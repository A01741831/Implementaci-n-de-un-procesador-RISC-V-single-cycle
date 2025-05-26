module Extend(
	input [31:0] Extend_in,
	input [1:0] immSrc,
	output reg [31:0] immExt
);

always @(*) begin
	case(immSrc)
		2'b00: immExt = {{20{Extend_in[31]}}, Extend_in[31:20]}; // I-type
		2'b01: immExt = {{20{Extend_in[31]}}, Extend_in[31:25], Extend_in[11:7]}; // S-type
		2'b10: immExt = {{19{Extend_in[31]}}, Extend_in[31], Extend_in[7], Extend_in[30:25], Extend_in[11:8], 1'b0}; // B-type
		2'b11: immExt = {Extend_in[31:12], 12'b0}; // J-type or U-type
		default: immExt = 32'b0;
	endcase
end

endmodule