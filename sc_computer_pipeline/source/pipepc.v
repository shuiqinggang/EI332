module pipepc( npc,wpcir,clock,resetn,pc );
	input  [31:0] npc;
   input         clock,resetn,wpcir;
   output [31:0] pc;
   reg 	 [31:0] pc;
   always @ (negedge resetn or posedge clock)
      if (resetn == 0)   // 清零
		begin
          pc <= -4;
      end 
		else 
		if (wpcir != 0)  
		begin
          pc <= npc;  // 更新
      end
endmodule
