library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

library work;
use work.custom_math_package.all;

entity RO_enable_decoder is 
    Generic (
        number_of_ROs : natural := 16);
    Port (
        enable_to_ROs : out std_logic_vector(number_of_ROs-1 downto 0);
        challenge : in std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0);
        enable_in : in std_logic);
    attribute dont_touch : string;
    attribute dont_touch of RO_enable_decoder : entity is "true";
end RO_enable_decoder;

architecture bhv of RO_enable_decoder is

signal enable_pointer_h : natural;
signal enable_pointer_l : natural;

begin

UPDATE_enable_pointers : process(challenge) 
begin
    enable_pointer_h <= to_integer(unsigned(challenge(2*ceil_log2(number_of_ROs)-1 downto ceil_log2(number_of_ROs))));
    enable_pointer_l <= to_integer(unsigned(challenge(ceil_log2(number_of_ROs)-1 downto 0)));
end process;

UPDATE_enable_outputs : process(enable_in)
begin
    enable_to_ROs <= (others => '0');
    enable_to_ROs(enable_pointer_h) <= enable_in;
    enable_to_ROs(enable_pointer_l) <= enable_in;
end process;

end bhv;
