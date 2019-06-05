module pipeexe( ealuc, ealuimm, ea, eb, eimm, eshift, ern0, epc4, ejal, ern, ealu );
	input  [3:0]  ealuc;
	input  [31:0] ea, eb, eimm, epc4;
	input  [4:0]  ern0;
	input  		  ealuimm, eshift, ejal;
	output [31:0] ealu;
	output [4:0]  ern;
	wire   [31:0] a, b, r;
	wire   [31:0] epc8 = epc4 + 4;
	wire   [4:0]  ern = ern0 | {5{ejal}};
	mux2x32 a_mux( ea, eimm, eshift, a );
	mux2x32 b_mux( eb, eimm, ealuimm, b );
	mux2x32 ealu_mux( r, epc8, ejal, ealu );
	alu     al_unit( a, b, ealuc, r );  // alu模块
	
endmodule