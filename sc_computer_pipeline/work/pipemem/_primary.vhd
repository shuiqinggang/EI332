library verilog;
use verilog.vl_types.all;
entity pipemem is
    port(
        resetn          : in     vl_logic;
        mwmem           : in     vl_logic;
        malu            : in     vl_logic_vector(31 downto 0);
        mb              : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        mem_clock       : in     vl_logic;
        mmo             : out    vl_logic_vector(31 downto 0);
        in_port0        : in     vl_logic_vector(3 downto 0);
        in_port1        : in     vl_logic_vector(3 downto 0);
        in_port_sub     : in     vl_logic;
        out_port0       : out    vl_logic_vector(31 downto 0);
        out_port1       : out    vl_logic_vector(31 downto 0);
        out_port2       : out    vl_logic_vector(31 downto 0);
        LEDR4           : out    vl_logic
    );
end pipemem;
