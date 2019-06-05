library verilog;
use verilog.vl_types.all;
entity io_output_reg is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        datain          : in     vl_logic_vector(31 downto 0);
        write_io_enable : in     vl_logic;
        io_clk          : in     vl_logic;
        clrn            : in     vl_logic;
        out_port0       : out    vl_logic_vector(31 downto 0);
        out_port1       : out    vl_logic_vector(31 downto 0);
        out_port2       : out    vl_logic_vector(31 downto 0);
        LEDR4           : out    vl_logic
    );
end io_output_reg;
