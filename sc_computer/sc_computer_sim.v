//=============================================
//
// 该 Verilog HDL 代码，是用于对设计模块进行仿真时，对输入信号的模拟输入值的设定。
// 否则，待仿真的对象模块，会因为缺少输入信号，而“不知所措”。
// 该文件可设定若干对目标设计功能进行各种情况下测试的输入用例，以判断自己的功能设计是否正确。
//
// 对于CPU设计来说，基本输入量只有：复位信号、时钟信号。
//
// 对于带I/O设计，则需要设定各输入信号值。
//
//
// =============================================


// `timescale 10ns/10ns            // 仿真时间单位/时间精度
`timescale 1ps/1ps            // 仿真时间单位/时间精度

//
// （1）仿真时间单位/时间精度：数字必须为1、10、100
// （2）仿真时间单位：模块仿真时间和延时的基准单位
// （3）仿真时间精度：模块仿真时间和延时的精确程度，必须小于或等于仿真单位时间
//
//      时间单位：s/秒、ms/毫秒、us/微秒、ns/纳秒、ps/皮秒、fs/飞秒（10负15次方）。


module sc_computer_sim ;
reg in_port_sub;

    reg           resetn ;
	reg           mem_clk ;
    reg    [3:0] in_port0 ;
	reg   [3:0] in_port1 ;
    wire   [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
    wire   [31:0]  out_port0 ,out_port1 ,out_port2,io_read_data ;
	wire   [31:0]  pc ,inst ,aluout;
  
    sc_computer  sc ( resetn,  mem_clk,  pc,  inst,aluout, in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,io_read_data);


	initial
    begin
        in_port0  = 4'b0000;
        in_port1  = 4'b0000;
        #32;
      while(1)
        begin 
            in_port0  = in_port0+1;
            in_port1  = in_port1+1;
            #28;
        end
    end
			


	initial
    begin
        in_port_sub=0;
      while(1)
        begin 
		  #40;
           in_port_sub=1- in_port_sub;
        
        end
    end			

	initial
        begin
            mem_clk  = 1;
            while (1)
                #1  mem_clk  = ~ mem_clk ;
        end

		  
	 initial
        begin
            resetn  = 0;            // 低电平持续10个时间单位，后一直为1。
            while (1)
                #5 resetn  = 1;
        end

		  
		  
		  
  
    initial
        begin
		  
          $display($time,"resetn=%b   mem_clk =%b", resetn ,  mem_clk );
			 
        end

endmodule 

