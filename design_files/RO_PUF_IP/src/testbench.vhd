library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture bhv of testbench is

component RO_PUF is
    Generic (
        number_of_INVs : natural := 9;
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
end component;

signal clk : std_logic := '1';
signal rstn : std_logic := '1';
 
-- AXI input interface
signal in_ready :  std_logic;
signal in_valid :  std_logic := '0';
signal in_data :  std_logic_vector(31 downto 0) := x"00000000";
signal in_last :  std_logic := '0'; 
-- AXI output interface
signal out_last :  std_logic; 
signal out_ready :  std_logic := '0';
signal out_valid :  std_logic;
signal out_data :  std_logic_vector(31 downto 0);

begin

RO_PUF_fin: RO_PUF
generic map (
    number_of_INVs => 5,
    number_of_ROs => 256,
    wait_ns => 1000
)
port map(
    clk => clk,
    rstn => rstn,
    in_ready => in_ready,
    in_valid => in_valid,
    in_data => in_data,
    in_last => in_last,
    out_last => out_last,
    out_ready => out_ready,
    out_valid => out_valid,
    out_data => out_data
);

clk <= not clk after 5 ns;

stimulus: process
begin
    wait for 200 ns;
    in_data <= x"11110000"; in_valid <= '1'; wait for 10 ns;
    in_valid <= '0'; wait for 2100 ns;
    out_ready <= '1'; wait for 40 ns;
    out_ready <= '0';
    in_data <= x"11110101"; in_valid <= '1'; wait for 10 ns;
    in_valid <= '0'; wait for 2100 ns;
    out_ready <= '1'; wait for 40 ns;
    out_ready <= '0';
    wait;
end process;    

end bhv;
