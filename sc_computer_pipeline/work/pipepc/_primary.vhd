library verilog;
use verilog.vl_types.all;
entity pipepc is
    port(
        npc             : in     vl_logic_vector(31 downto 0);
        wpcir           : in     vl_logic;
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0)
    );
end pipepc;
