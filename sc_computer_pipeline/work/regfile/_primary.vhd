library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        rna             : in     vl_logic_vector(4 downto 0);
        rnb             : in     vl_logic_vector(4 downto 0);
        d               : in     vl_logic_vector(31 downto 0);
        wn              : in     vl_logic_vector(4 downto 0);
        we              : in     vl_logic;
        clk             : in     vl_logic;
        clrn            : in     vl_logic;
        qa              : out    vl_logic_vector(31 downto 0);
        qb              : out    vl_logic_vector(31 downto 0)
    );
end regfile;
