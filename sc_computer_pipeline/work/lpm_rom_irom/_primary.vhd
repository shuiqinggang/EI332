library verilog;
use verilog.vl_types.all;
entity lpm_rom_irom is
    port(
        address         : in     vl_logic_vector(5 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end lpm_rom_irom;
