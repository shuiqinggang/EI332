module sc_cpu (clock,resetn,inst,mem,pc,wmem,alu,data);
   input [31:0] inst,mem;
   input clock,resetn;
   output [31:0] pc,alu,data;
   output wmem;
  
   
   wire [31:0]   p4,npc,adr,ra,alua,alub,res,alu_mem;
   wire [3:0]    aluc;
   wire [4:0]    reg_dest,wn;
   wire [1:0]    pcsource;
   wire          zero,wmem,wreg,regrt,m2reg,shift,aluimm,jal,sext;
   wire [31:0]   sa = { 27'b0, inst[10:6] }; // extend to 32 bits from sa for shift instruction
   wire          e = sext & inst[15];          // positive or negative sign at sext signal
   wire [15:0]   imm = {16{e}};               // high 16 sign bit
   wire [31:0]   immediate = {imm,inst[15:0]}; // sign extend to high 16
	wire [31:0]   offset = {imm[13:0],inst[15:0],1'b0,1'b0};   //offset(include sign extend)
   
   dff32 ip (npc,clock,resetn,pc);  // define a D-register for PC
   
   // cla32 pcplus4 (pc,32¡¯h4, 1¡¯b0,p4);
   // cla32 br_adr (p4,offset,1¡¯b0,adr);
   
   assign p4 = pc + 32'h4;       // modified
   assign adr = p4 + offset;     // modified
   
   wire [31:0] jpc = {p4[31:28],inst[25:0],1'b0,1'b0}; // j address 
   
   sc_cu cu (inst[31:26],inst[5:0],zero,wmem,wreg,regrt,m2reg,
                        aluc,shift,aluimm,pcsource,jal,sext);
                        
   //mux: (src1, src2, ctrl, output)
   //NOTE: for sll,... the immediate is encoded in the instruction. rs is 000000!
   mux2x32 alu_b (data,immediate,aluimm,alub);  //ALUSrc==reg or imm?
   mux2x32 alu_a (ra,sa,shift,alua); //shift, from register or imm?
   mux2x32 result(alu,mem,m2reg,alu_mem); //result from ALU or mem?
   mux2x32 link (alu_mem,p4,jal,res); //write register. If jal, write current pc+4; else write result from ALU or memory!
   mux2x5 reg_wn (inst[15:11],inst[20:16],regrt,reg_dest);
   assign wn = reg_dest | {5{jal}}; // jal: r31 <-- p4;      // 31 or reg_dest //{5{jal}}:duplication jal for 5 times
   mux4x32 nextpc(p4,adr,ra,jpc,pcsource,npc);
   //res: final result, wn: write number., wreg: whether to write register, ra: (read)rs, data: (read)rt
   regfile rf (inst[25:21],inst[20:16],res,wn,wreg,clock,resetn,ra,data);
   
   //alu: result, zero:Z
   alu al_unit (alua,alub,aluc,alu,zero);
endmodule