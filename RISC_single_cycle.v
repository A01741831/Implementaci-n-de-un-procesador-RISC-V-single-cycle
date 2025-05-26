module RISC_single_cycle(
	input clk
);

wire [31:0] PCTarget;
wire [31:0] PCPlus4;

wire[31:0] PCNext=PCSrc?PCTarget:PCPlus4;

reg [31:0] PC;
wire [31:0] Inst;

wire RegWrite;
wire [31:0] Src;
wire [31:0] RD2;

wire ALUSrc;
wire [31:0] ImmExt;
wire [31:0] SrcB=ALUSrc?ImmExt:RD2;

wire[1:0] ImmSrc;

wire [2:0] ALUControl;
wire [31:0] ALUResult;
wire zero=0;

wire MemWrite;
wire [31:0] ReadData;

wire ResultSrc;
wire Branch;

assign result=ResultSrc ?ReadData:ALUResult;
assign PCPlus4=PC+4;
assign PCTarget=PC+ImmExt;
assign PCSrc=Branch&zero;

always @(posedge clk)
	PC<=PCNext;
	
instruction_memory IM(
	.A(PC),
	.RD(Inst)
);

Register_file RF(
	.A1(Inst[19:15]),
	.A2(Inst[24:20]),
	.A3(Inst[11:7]),
	.WD3(Result),
	.WE3(RegWrite),
	.RD1(SrcA),
	.RD2(RD2)
	);

Extend EXT(
	.extend_in(Inst[31:7]),
	.ImmScr(ImmScr),
	.extend_out(ImmExt)
	);
	
ALU A(
	.SrcA(SrcA),
	.SrcB(SrcB),
	.zero(zero),
	.ALUResult(ALUResult),
	.ALUControl(ALUControl)
);

Data_memoty MEM_DATA(
	.A(ALUResult),
	.WD(RD2),
	.clk(clk),
	.WE(MemWrite),
	.RD(ReadData)
);

Control_Unit CONTROL(
	.op(Inst[6:0]),
	.funct3(Inst[14:12]),
	.funct7(Inst[30]),
	.zero(zero),
	.PCSrc(PCSrc),
	.ResultSrc(ResultSrc),
	.MemWrite(MemWrite),
	.ALUControl(ALUControl),
	.ALUSrc(ALUSrc),
	.ImmSrc(ImmSrc),
	.RegWrite(RegWrite)
);

endmodule