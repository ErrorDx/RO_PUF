library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.custom_math_package.all;

entity RO_PUF is
    Generic (
        number_of_INVs : natural := 1;
        number_of_ROs : natural := 256;
        wait_ns : natural := 1000);
    Port (
        clk : in std_logic;
        rstn : in std_logic;
 
        -- AXI input interface
        in_ready : out std_logic;
        in_valid : in std_logic;
        in_data : in std_logic_vector(31 downto 0);
        in_last : in std_logic;
    
        -- AXI output interface
        out_last : out std_logic; 
        out_ready : in std_logic;
        out_valid : out std_logic;
        out_data : out std_logic_vector(31 downto 0) );
end RO_PUF;

architecture bhv of RO_PUF is

component simple_RO_PUF is 
    Generic ( 
        number_of_INVs : natural;
        number_of_ROs : natural; -- positive base of 2
        wait_ns : natural);
    Port (
        challenge : in std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0);
        ctr_out_1 : out natural;
        ctr_out_2 : out natural;
        new_challenge : in std_logic;
        clk : in std_logic;
        PUF_out_valid : out std_logic );    
end component;

component AXIS_input_handler is
    Generic (  
        storage_depth : natural;
        number_of_ROs : natural 
    );
    Port ( 
        clk : in std_logic;
        rstn : in std_logic;
 
        -- AXI input interface
        in_ready : out std_logic;
        in_valid : in std_logic;
        in_data : in std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0);
        in_last : in std_logic;
        
        -- Outputs to RO PUF 
        challenge : out std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0);
        new_challenge : out std_logic;
        
        -- Input from RO PUF
        PUF_out_valid : in std_logic  );
end component;

component AXIS_output_handler is
    Port ( 
        clk : in std_logic;
        rstn : in std_logic;
 
        -- AXI output interface
        out_last : out std_logic; 
        out_ready : in std_logic;
        out_valid : out std_logic;
        out_data : out std_logic_vector(31 downto 0);
        
        -- Input from RO PUF
        PUF_out_valid : in std_logic;
        ctr_out_1 : in natural;
        ctr_out_2 : in natural);
end component;

-- internal
signal challenge : std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0);
signal ctr_out_1 : natural;
signal ctr_out_2 : natural;
signal new_challenge : std_logic;
signal PUF_out_valid : std_logic;

begin

PUF : simple_RO_PUF 
generic map (
    number_of_INVs => number_of_INVs,
    number_of_ROs => number_of_ROs,
    wait_ns => wait_ns
)
port map (
    challenge => challenge,
    ctr_out_1 => ctr_out_1,
    ctr_out_2 => ctr_out_2,
    new_challenge => new_challenge,
    clk => clk,
    PUF_out_valid => PUF_out_valid
);

IN_HANDLER : AXIS_input_handler
generic map (
    storage_depth => 1,
    number_of_ROs => number_of_ROs
)
port map (
    clk => clk,
    rstn => rstn,    
    in_ready => in_ready,
    in_valid => in_valid,
    in_data => in_data(2*ceil_log2(number_of_ROs)-1 downto 0),
    in_last => in_last,
    challenge => challenge,
    new_challenge => new_challenge,
    PUF_out_valid => PUF_out_valid 
);

OUT_HANDLER : AXIS_output_handler
port map (
    clk => clk,
    rstn => rstn,
    out_last => out_last,
    out_ready => out_ready, 
    out_valid => out_valid,
    out_data => out_data,
    PUF_out_valid => PUF_out_valid,
    ctr_out_1 => ctr_out_1,
    ctr_out_2 => ctr_out_2

);

    
end bhv;
