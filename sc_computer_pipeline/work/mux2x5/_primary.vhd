library verilog;
use verilog.vl_types.all;
entity mux2x5 is
    port(
        a0              : in     vl_logic_vector(4 downto 0);
        a1              : in     vl_logic_vector(4 downto 0);
        s               : in     vl_logic;
        y               : out    vl_logic_vector(4 downto 0)
    );
end mux2x5;
