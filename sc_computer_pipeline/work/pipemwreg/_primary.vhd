library verilog;
use verilog.vl_types.all;
entity pipemwreg is
    port(
        mwreg           : in     vl_logic;
        mm2reg          : in     vl_logic;
        mmo             : in     vl_logic_vector(31 downto 0);
        malu            : in     vl_logic_vector(31 downto 0);
        mrn             : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        wwreg           : out    vl_logic;
        wm2reg          : out    vl_logic;
        wmo             : out    vl_logic_vector(31 downto 0);
        walu            : out    vl_logic_vector(31 downto 0);
        wrn             : out    vl_logic_vector(4 downto 0)
    );
end pipemwreg;
