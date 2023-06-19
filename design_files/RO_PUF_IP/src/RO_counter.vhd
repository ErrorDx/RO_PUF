library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RO_counter is
    Port (
        RO_clk : in std_logic;
        output_ctr : out natural;
        clear_ctr : in std_logic );
    attribute dont_touch : string;
    attribute dont_touch of RO_counter : entity is "true";
end RO_counter;

architecture bhv of RO_counter is

signal counter : natural := 0;

begin

output_ctr <= counter;

COUNT : process(RO_clk, clear_ctr)
begin
    if (rising_edge (RO_clk)) then
        counter <= counter + 1;    
        if (counter >= 2**31-1) then 
            counter <= 2**31-1;
        end if;
    end if;   
    if (clear_ctr = '1') then
        counter <= 0;
    end if;  
end process;

end bhv;
