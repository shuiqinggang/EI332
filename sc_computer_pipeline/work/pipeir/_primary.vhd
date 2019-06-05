library verilog;
use verilog.vl_types.all;
entity pipeir is
    port(
        pc4             : in     vl_logic_vector(31 downto 0);
        ins             : in     vl_logic_vector(31 downto 0);
        wpcir           : in     vl_logic;
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        dpc4            : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0)
    );
end pipeir;
