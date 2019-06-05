library verilog;
use verilog.vl_types.all;
entity pipeid is
    port(
        mwreg           : in     vl_logic;
        mrn             : in     vl_logic_vector(4 downto 0);
        ern             : in     vl_logic_vector(4 downto 0);
        ewreg           : in     vl_logic;
        em2reg          : in     vl_logic;
        mm2reg          : in     vl_logic;
        dpc4            : in     vl_logic_vector(31 downto 0);
        inst            : in     vl_logic_vector(31 downto 0);
        wrn             : in     vl_logic_vector(4 downto 0);
        wdi             : in     vl_logic_vector(31 downto 0);
        ealu            : in     vl_logic_vector(31 downto 0);
        malu            : in     vl_logic_vector(31 downto 0);
        mmo             : in     vl_logic_vector(31 downto 0);
        wwreg           : in     vl_logic;
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        bpc             : out    vl_logic_vector(31 downto 0);
        jpc             : out    vl_logic_vector(31 downto 0);
        pcsource        : out    vl_logic_vector(1 downto 0);
        wpcir           : out    vl_logic;
        dwreg           : out    vl_logic;
        dm2reg          : out    vl_logic;
        dwmem           : out    vl_logic;
        daluc           : out    vl_logic_vector(3 downto 0);
        daluimm         : out    vl_logic;
        da              : out    vl_logic_vector(31 downto 0);
        db              : out    vl_logic_vector(31 downto 0);
        dimm            : out    vl_logic_vector(31 downto 0);
        drn             : out    vl_logic_vector(4 downto 0);
        dshift          : out    vl_logic;
        djal            : out    vl_logic
    );
end pipeid;
