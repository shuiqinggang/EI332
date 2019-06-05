library verilog;
use verilog.vl_types.all;
entity pipelined_computer is
    port(
        resetn          : in     vl_logic;
        clock           : in     vl_logic;
        pc              : out    vl_logic_vector(31 downto 0);
        inst            : out    vl_logic_vector(31 downto 0);
        in_port0        : in     vl_logic_vector(3 downto 0);
        in_port1        : in     vl_logic_vector(3 downto 0);
        in_port_sub     : in     vl_logic;
        out_port0       : out    vl_logic_vector(31 downto 0);
        out_port1       : out    vl_logic_vector(31 downto 0);
        out_port2       : out    vl_logic_vector(31 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        LEDR4           : out    vl_logic
    );
end pipelined_computer;
