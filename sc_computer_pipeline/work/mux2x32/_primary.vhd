library verilog;
use verilog.vl_types.all;
entity mux2x32 is
    port(
        a0              : in     vl_logic_vector(31 downto 0);
        a1              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end mux2x32;
