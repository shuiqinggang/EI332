/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////



module sc_computer ( resetn, mem_clk,  pc,  inst,aluout, in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,io_read_data);

input [3:0]  in_port0, in_port1;
input in_port_sub;
output [31:0] 	out_port0, out_port1, out_port2,aluout;
output wire [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
// 定义顶层模块sc_computer，作为工程文件的顶层入口，如图1-1建立工程时指定。
input resetn,mem_clk;
// 定义整个计算机module和外界交互的输入信号，包括复位信号resetn、时钟信号clock、
// 以及一个频率是clock两倍的mem_clk信号。注：resetn 是低电平（neg）有效信号。
// 这些信号都可以用作仿真验证时的输出观察信号。
output [31:0] pc, inst,io_read_data;
// 模块用于仿真输出的观察信号。缺省为wire型。

//模块用于仿真输出的观察信号, 用于观察验证指令ROM和数据RAM的读写时序。
wire [31:0] data,aluout,memout; // 模块间互联传递数据或控制信息的信号线。

wire wmem,clock; // 模块间互联传递数据或控制信息的信号线。
sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data); // CPU module.
// 实例化了一个CPU模块，其内部又包含运算器ALU模块、控制器CU模块等。
// 在CPU模块的原型定义sc_cpu模块中，可看到其内部的各模块构成。
sc_instmem imem (pc,inst,clock,mem_clk,imem_clk); // instruction memory.
// 实例化指令ROM存储器imem模块。模块原型由sc_instmem定义。
//
// 由于Altera的Cyclone系列FPGA只能支持同步的ROM和RAM，读取操作需要时钟信号。
// 示例代码中是采用Altera公司quartus提供的ROM宏模块lpm_rom实现的，需要读取时钟，
// 该imem_clk读取时钟由clock信号和mem_clk信号组合而成，具体时序可参考模块内的
// 相应代码。为什么这样设计，详细设计原理参见本节【问题2】解答。
// 同时，imem_clk信号作为模块输出信号供仿真器进行观察。
// 宏模块lpm_rom的时序要求参见其时序图。
//  sc_datamem dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk); // data memory.
// 数据RAM存储器dmem模块。模块原型由sc_datamem定义。
// 由于Altera的Cyclone系列FPGA只能支持同步的ROM和RAM，读取操作需要时钟信号。
// 示例代码中是采用Altera公司quartus提供的RAM宏模块lpm_ram_dq实现的，需要读写时钟，
// 该dmem_clk读写时钟由clock信号和mem_clk信号组合而成，具体时序可参考模块内的
// 相应代码。为什么这样设计，详细设计原理参见本节【问题2】解答。
// 同时，该dmem_clk信号作为模块输出信号供仿真器进行观察。
// 宏模块lpm_ram_dq的时序要求参见其时序图。
wire [3:0] op_0_ge,op_1_ge,op_2_ge,op_0_shi,op_1_shi,op_2_shi;
assign op_0_ge=out_port0%10;
assign op_0_shi=out_port0/10;
assign op_1_ge=out_port1%10;
assign op_1_shi=out_port1/10;
assign op_2_ge=out_port22%10;
assign op_2_shi=out_port22/10;
reg [31:0] out_port22;

always@(*)
begin
if(out_port2[31]==1)
	out_port22=~out_port2+1;
else
	out_port22=out_port2;
end


half_frequency hf(resetn,mem_clk,clock);
sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk,resetn,in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,io_read_data); // data memory.

	sevenseg s0(op_2_ge,HEX4);
	sevenseg s1(op_2_shi,HEX5);

	sevenseg s2(op_1_ge,HEX2);
	sevenseg s3(op_1_shi,HEX3);
	
	sevenseg s4(op_0_ge,HEX0);
	sevenseg s5(op_0_shi,HEX1);

endmodule



module sevenseg ( data, ledsegments);
input [3:0] data;
output ledsegments;
reg [6:0] ledsegments;
always @ (*)
case(data)
// gfe_dcba // 7段LED数码管的位段编号
// 654_3210 // DE1-SOC板上的信号位编号
0: ledsegments = 7'b100_0000; // DE1-SOC板上的数码管为共阳极接法。
1: ledsegments = 7'b111_1001;
2: ledsegments = 7'b010_0100;
3: ledsegments = 7'b011_0000;
4: ledsegments = 7'b001_1001;
5: ledsegments = 7'b001_0010;
6: ledsegments = 7'b000_0010;
7: ledsegments = 7'b111_1000;
8: ledsegments = 7'b000_0000;
9: ledsegments = 7'b001_0000;
default: ledsegments = 7'b111_1111; // 其它值时全灭。
endcase
endmodule


module half_frequency(resetn,mem_clk,clock);
	input resetn,mem_clk;
	output clock;
	reg clock;
	initial
	begin
		clock = 0;
	end
	always @(posedge mem_clk)
	begin
		if(~resetn)
			clock <= 0;
		clock <= ~clock;
	end
endmodule
