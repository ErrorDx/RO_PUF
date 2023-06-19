library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

library work;
use work.custom_math_package.all;

entity n_to_1_mux is
    Generic ( 
        n : integer := 8 -- log2 of the number of inputs 
    );
    Port ( 
        input : in std_logic_vector(n-1 downto 0);
        output : out std_logic;
        select_input : in std_logic_vector(ceil_log2(n)-1 downto 0)
    );
    attribute dont_touch : string;
    attribute dont_touch of n_to_1_mux : entity is "true";
end n_to_1_mux;

architecture bhv of n_to_1_mux is

signal output_pointer : natural := 0;

begin

output <= input(output_pointer);

UPDATE_output_pointer: process(select_input)
begin
    output_pointer <= to_integer(unsigned(select_input));   
end process; 



end bhv;
