library verilog;
use verilog.vl_types.all;
entity mux4x32 is
    port(
        a0              : in     vl_logic_vector(31 downto 0);
        a1              : in     vl_logic_vector(31 downto 0);
        a2              : in     vl_logic_vector(31 downto 0);
        a3              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(31 downto 0)
    );
end mux4x32;
