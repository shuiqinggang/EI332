module sc_cu (op, func, rsrtequ, wmem, wreg, regrt, m2reg, aluc, shift,
              aluimm, pcsource, jal, sext, wpcir, rs, rt, mrn, mm2reg, mwreg, ern, em2reg, ewreg, fwda, fwdb);
   input  [5:0] op,func;
   input        rsrtequ, mwreg, ewreg, mm2reg, em2reg;
	input  [4:0] rs, rt, mrn, ern;
   output       wreg, regrt, jal, m2reg, shift, aluimm, sext, wmem, wpcir;
   output [3:0] aluc;
   output [1:0] pcsource, fwda, fwdb;
	reg [1:0] fwda, fwdb;
   wire r_type = ~|op;  // 是否是R型指令
	
	//该R型指令是否出现 
   wire i_add = r_type & func[5] & ~func[4] & ~func[3] &  ~func[2] & ~func[1] & ~func[0];		//100000	 
   wire i_sub = r_type & func[5] & ~func[4] & ~func[3] &~func[2] &  func[1] & ~func[0];      //100010
   wire i_and = r_type & func[5] & ~func[4] & ~func[3] &func[2] & ~func[1] & ~func[0];       //100100
   wire i_or  = r_type & func[5] & ~func[4] & ~func[3] &func[2] & ~func[1] &  func[0];       //100101
   wire i_xor = r_type & func[5] & ~func[4] & ~func[3] &func[2] &  func[1] & ~func[0];       //100110
   wire i_sll = r_type & ~func[5] & ~func[4] & ~func[3] &~func[2] & ~func[1] & ~func[0];     //000000
   wire i_srl = r_type & ~func[5] & ~func[4] & ~func[3] &~func[2] &  func[1] & ~func[0];     //000010
   wire i_sra = r_type & ~func[5] & ~func[4] & ~func[3] &~func[2] &  func[1] &  func[0];     //000011
   wire i_jr  = r_type & ~func[5] & ~func[4] &  func[3] &~func[2] & ~func[1] & ~func[0];     //001000
	
	
	//该I型指令是否出现
   wire i_addi = ~op[5] & ~op[4] &  op[3] & ~op[2] & ~op[1] & ~op[0]; //001000
   wire i_andi = ~op[5] & ~op[4] &  op[3] &  op[2] & ~op[1] & ~op[0]; //001100
   wire i_ori  = ~op[5] & ~op[4] &  op[3] &  op[2] & ~op[1] &  op[0]; //001101
   wire i_xori = ~op[5] & ~op[4] &  op[3] &  op[2] &  op[1] & ~op[0]; //001110  
   wire i_lw   =  op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] &  op[0]; //100011
   wire i_sw   =  op[5] & ~op[4] &  op[3] & ~op[2] &  op[1] &  op[0]; //101011
   wire i_beq  = ~op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] & ~op[0]; //000100
   wire i_bne  = ~op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] &  op[0]; //000101
   wire i_lui  = ~op[5] & ~op[4] &  op[3] &  op[2] &  op[1] &  op[0]; //001111
   wire i_j    = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] & ~op[0]; //000010
   wire i_jal  = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] &  op[0]; //000011
   
  
	assign wpcir = ~(em2reg & ( ern == rs | ern == rt ));  //lw的数据冒险  可能需要停顿 
	
	// 如果wpcir为0 那么插入气泡停顿 将所有的控制信号置0
   assign pcsource[1] = i_jr | i_j | i_jal;
   assign pcsource[0] = ( i_beq & rsrtequ ) | (i_bne & ~rsrtequ) | i_j | i_jal ;
   
   assign wreg = wpcir & (i_add | i_sub | i_and | i_or   | i_xor  |
                 i_sll | i_srl | i_sra | i_addi | i_andi |
                 i_ori | i_xori | i_lw | i_lui  | i_jal);
   
   assign aluc[3] = wpcir & i_sra;
   assign aluc[2] = wpcir & (i_sub | i_or | i_lui | i_srl | i_sra | i_ori);
   assign aluc[1] = wpcir & (i_xor | i_lui | i_sll | i_srl | i_sra | i_xori);
   assign aluc[0] = wpcir & (i_and | i_or | i_sll | i_srl | i_sra | i_andi | i_ori);
   assign shift   = wpcir & (i_sll | i_srl | i_sra);

   assign aluimm  = wpcir & (i_addi | i_andi | i_ori | i_xori | i_lw | i_sw);
   assign sext    = wpcir & (i_addi | i_lw | i_sw | i_beq | i_bne);
   assign wmem    = wpcir & i_sw;
   assign m2reg   = wpcir & i_lw;
   assign regrt   = wpcir & (i_addi | i_andi | i_ori | i_xori | i_lw | i_lui);
   assign jal     = wpcir & i_jal;
	

   	
// fwda和fwda的设置
   always @(*)
   begin
	if(ewreg & ~ em2reg & (ern != 0) & (ern == rs) )  //将上一条指令的alu结果直通 如果上一条指令是lw的话 那么会停顿一个时钟周期 所以误直通了也无所谓
         fwda<=2'b01;
      else 
		if (mwreg & ~ mm2reg & (mrn != 0) & (mrn == rs) ) //将前两条指令的alu结果直通
            fwda<=2'b10;
         else  
            if  (mwreg & mm2reg & (mrn != 0) & (mrn == rs) )  // 将前两条指令的数据RAM的输出直通
               fwda<=2'b11;
            else 
               fwda<=2'b00;  // 无需直通 
   end


   always @(*)
   begin
      if(ewreg & ~ em2reg &(ern != 0) & (ern == rt) ) //将上一条指令的alu结果直通
         fwdb<=2'b01;
      else  
         if (mwreg & ~ mm2reg & (mrn != 0) & (mrn == rt) )  //将前两条指令的alu结果直通
            fwdb<=2'b10;
         else 
            if  (mwreg & mm2reg & (mrn != 0) & (mrn == rt) )   // 将前两条指令的数据RAM的输出直通
               fwdb<=2'b11;
            else 
               fwdb<=2'b00; // 无需直通 

   end
	
	/*

	wire [1:0] fwda, fwdb;
	assign fwda[1] = ~(ewreg & (ern != 0) & (ern == rs) & ~em2reg) & (mwreg & (mrn != 0) & (mrn == rs));
	assign fwda[0] = (ewreg & (ern != 0) & (ern == rs) & ~em2reg) | (mwreg & (mrn != 0) & (mrn == rs) & mm2reg);
	
	assign fwdb[1] = ~(ewreg & (ern != 0) & (ern == rt) & ~em2reg) & (mwreg & (mrn != 0) & (mrn == rt));
	assign fwdb[0] = (ewreg & (ern != 0) & (ern == rt) & ~em2reg) | (mwreg & (mrn != 0) & (mrn == rt) & mm2reg);
*/
	
endmodule