module pipemwreg( mwreg, mm2reg, mmo, malu, mrn, clock, resetn,
	wwreg, wm2reg, wmo, walu, wrn );
	input          mwreg, mm2reg, clock, resetn;
	input  [31:0]  mmo, malu;
	input  [4:0]   mrn;
	output         wwreg, wm2reg;
	output [31:0]  wmo, walu;
	output [4:0]   wrn;
	reg            wwreg, wm2reg;
	reg    [31:0]  wmo, walu;
	reg    [4:0]   wrn;
	always @( posedge clock or negedge resetn)
	begin
		if (resetn == 0 )
		begin
			wwreg <= 0;
			wm2reg <= 0;
			wmo <= 0;
			walu <= 0;
			wrn <= 0;
		end
		else
		begin
			wwreg <= mwreg;
			wm2reg <= mm2reg;
			wmo <= mmo;
			walu <= malu;
			wrn <= mrn;
		end
	end
endmodule