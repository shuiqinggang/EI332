library verilog;
use verilog.vl_types.all;
entity pipeexe is
    port(
        ealuc           : in     vl_logic_vector(3 downto 0);
        ealuimm         : in     vl_logic;
        ea              : in     vl_logic_vector(31 downto 0);
        eb              : in     vl_logic_vector(31 downto 0);
        eimm            : in     vl_logic_vector(31 downto 0);
        eshift          : in     vl_logic;
        ern0            : in     vl_logic_vector(4 downto 0);
        epc4            : in     vl_logic_vector(31 downto 0);
        ejal            : in     vl_logic;
        ern             : out    vl_logic_vector(4 downto 0);
        ealu            : out    vl_logic_vector(31 downto 0)
    );
end pipeexe;
