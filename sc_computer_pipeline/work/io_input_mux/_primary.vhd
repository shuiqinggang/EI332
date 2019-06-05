library verilog;
use verilog.vl_types.all;
entity io_input_mux is
    port(
        a0              : in     vl_logic_vector(31 downto 0);
        a1              : in     vl_logic_vector(31 downto 0);
        a2              : in     vl_logic_vector(31 downto 0);
        sel_addr        : in     vl_logic_vector(5 downto 0);
        y               : out    vl_logic_vector(31 downto 0)
    );
end io_input_mux;
