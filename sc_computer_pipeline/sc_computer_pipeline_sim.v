`timescale 1ps/1ps
module sc_computer_pipeline_sim;
	reg clock, resetn;
	reg in_port_sub;
	wire LEDR4;
  	reg    [3:0] in_port0,in_port1;
   wire   [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
   wire   [31:0]  pc ,inst,out_port0 ,out_port1 ,out_port2;
	
	initial
   begin
		clock = 1;
		while (1)
			 #1  clock = ~clock;
	end

	initial
   begin
		resetn= 0; 
		while (1)
			 #5 resetn = 1;
   end

	initial
    begin
        in_port0  = 4'b0000;
        in_port1  = 4'b0000;
        #100;
      while(1)
        begin 
            in_port0  = in_port0+1;
            in_port1  = in_port1+1;
            #100;
        end
    end
			
	initial
    begin
        in_port_sub=0;
      while(1)
        begin 
		  #2000;
           in_port_sub=1- in_port_sub;
        
        end
    end			


	pipelined_computer sc(resetn,clock, pc,inst,in_port0,in_port1,in_port_sub,out_port0,out_port1,out_port2,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR4);


endmodule
