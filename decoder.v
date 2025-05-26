module decoder(
	input [6:0] op,
	input [3:0] funct3,
	output reg branch, jump, mem_write, alu_src, reg_weite,
	output reg [1:0] result_scr, imm_src
);

wire alu_op;

main_decoder main (
		.op(op),
		.branch(branch), 
		.jump(jump), 
		.mem_write(mem_write),
		.alu_src(alu_src), 
		.result_src(result_src), 
		.imm_src(imm_src), 
		.alu_op(alu_op)
	);
endmodule