module pipemem( resetn,mwmem, malu, mb, clock, mem_clock, mmo,in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,LEDR4 );
	input          mwmem, clock,resetn;
	input  [31:0]  malu, mb;
	input         mem_clock,in_port_sub;
	input [3:0] in_port0,in_port1;
	output LEDR4;
	output [31:0]  mmo,out_port0,out_port1,out_port2;
	sc_datamem dmem( resetn,malu, mb, mmo, mwmem, mem_clock,in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,LEDR4);

endmodule

