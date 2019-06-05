library verilog;
use verilog.vl_types.all;
entity pipedereg is
    port(
        dwreg           : in     vl_logic;
        dm2reg          : in     vl_logic;
        dwmem           : in     vl_logic;
        daluc           : in     vl_logic_vector(3 downto 0);
        daluimm         : in     vl_logic;
        da              : in     vl_logic_vector(31 downto 0);
        db              : in     vl_logic_vector(31 downto 0);
        dimm            : in     vl_logic_vector(31 downto 0);
        drn             : in     vl_logic_vector(4 downto 0);
        dshift          : in     vl_logic;
        djal            : in     vl_logic;
        dpc4            : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        ewreg           : out    vl_logic;
        em2reg          : out    vl_logic;
        ewmem           : out    vl_logic;
        ealuc           : out    vl_logic_vector(3 downto 0);
        ealuimm         : out    vl_logic;
        ea              : out    vl_logic_vector(31 downto 0);
        eb              : out    vl_logic_vector(31 downto 0);
        eimm            : out    vl_logic_vector(31 downto 0);
        ern0            : out    vl_logic_vector(4 downto 0);
        eshift          : out    vl_logic;
        ejal            : out    vl_logic;
        epc4            : out    vl_logic_vector(31 downto 0)
    );
end pipedereg;
