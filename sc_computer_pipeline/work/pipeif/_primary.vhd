library verilog;
use verilog.vl_types.all;
entity pipeif is
    port(
        pcsource        : in     vl_logic_vector(1 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        bpc             : in     vl_logic_vector(31 downto 0);
        da              : in     vl_logic_vector(31 downto 0);
        jpc             : in     vl_logic_vector(31 downto 0);
        npc             : out    vl_logic_vector(31 downto 0);
        pc4             : out    vl_logic_vector(31 downto 0);
        ins             : out    vl_logic_vector(31 downto 0);
        mem_clock       : in     vl_logic
    );
end pipeif;
