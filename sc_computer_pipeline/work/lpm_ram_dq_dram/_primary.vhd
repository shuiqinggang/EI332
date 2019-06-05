library verilog;
use verilog.vl_types.all;
entity lpm_ram_dq_dram is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end lpm_ram_dq_dram;
