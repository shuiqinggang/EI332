library verilog;
use verilog.vl_types.all;
entity sc_datamem is
    port(
        resetn          : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        datain          : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        we              : in     vl_logic;
        clock           : in     vl_logic;
        in_port0_tmp    : in     vl_logic_vector(3 downto 0);
        in_port1_tmp    : in     vl_logic_vector(3 downto 0);
        in_portsub_tmp  : in     vl_logic;
        out_port0       : out    vl_logic_vector(31 downto 0);
        out_port1       : out    vl_logic_vector(31 downto 0);
        out_port2       : out    vl_logic_vector(31 downto 0);
        LEDR4           : out    vl_logic
    );
end sc_datamem;
