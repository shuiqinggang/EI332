library verilog;
use verilog.vl_types.all;
entity sc_cu is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        rsrtequ         : in     vl_logic;
        wmem            : out    vl_logic;
        wreg            : out    vl_logic;
        regrt           : out    vl_logic;
        m2reg           : out    vl_logic;
        aluc            : out    vl_logic_vector(3 downto 0);
        shift           : out    vl_logic;
        aluimm          : out    vl_logic;
        pcsource        : out    vl_logic_vector(1 downto 0);
        jal             : out    vl_logic;
        sext            : out    vl_logic;
        wpcir           : out    vl_logic;
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        mrn             : in     vl_logic_vector(4 downto 0);
        mm2reg          : in     vl_logic;
        mwreg           : in     vl_logic;
        ern             : in     vl_logic_vector(4 downto 0);
        em2reg          : in     vl_logic;
        ewreg           : in     vl_logic;
        fwda            : out    vl_logic_vector(1 downto 0);
        fwdb            : out    vl_logic_vector(1 downto 0)
    );
end sc_cu;
