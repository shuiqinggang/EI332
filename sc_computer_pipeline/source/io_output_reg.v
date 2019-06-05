module io_output_reg(addr,datain,write_io_enable,io_clk,clrn,out_port0,out_port1,out_port2,LEDR4);

	input [31:0] addr, datain;
	input write_io_enable, io_clk;
	input clrn;
	//reset signal. if necessary,can use this signal to reset the output to 0. 
	output [31:0] out_port0, out_port1, out_port2;
	reg out_put2_tmp;

	reg [31:0] out_port0, out_port1, out_port2;
	output LEDR4;
	reg LEDR4;
	always @(posedge io_clk or negedge clrn)
	begin
		if(clrn == 0)
		begin
			out_port0 <= 0;
			out_port1 <= 0;
			out_port2 <= 0;
		end
		else
		begin
			if(write_io_enable == 1)
			case(addr[7:2])
				6'b100000: out_port0 <= datain;//80h
				6'b100001: out_port1 <= datain;//84h
				6'b100010: //88h
					begin 
					 if(datain[31]==1) // 结果为负
						begin 
							LEDR4<=1;  // 负数指示灯亮
							out_port2 <= ~datain+1;  // 取反
						end 
					else 
						begin
							LEDR4<=0;
							out_port2 <= datain;
						end
					end
			endcase
		end
	end
endmodule
	