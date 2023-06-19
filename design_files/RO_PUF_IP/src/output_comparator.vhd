library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity output_comparator is
    Generic (
        wait_ns : natural := 100);
    Port (
        clk : in std_logic; 
        new_challenge : in std_logic;
        reset_counter : out std_logic; 
        ctr_out_1 : out natural; 
        ctr_out_2 : out natural;     
        ctr_in_1 : in natural; 
        ctr_in_2 : in natural;
        output_valid : out std_logic;
        enable_ROs : out std_logic );
end output_comparator;

architecture bhv of output_comparator is

constant clk_period_ns : natural := 10;
constant wait_n_cycles : natural := wait_ns/clk_period_ns; 
constant static_delay_cycles : natural := 1000;

signal local_counter : natural range 0 to wait_n_cycles := 0;
signal static_delay_counter : natural := 0; 
signal reset_atleast_once : std_logic := '0';

signal ctr_out_1_i : natural;
signal ctr_out_2_i : natural;
signal output_valid_i : std_logic;
signal enable_ROs_i : std_logic := '0';


begin

ctr_out_1 <= ctr_out_1_i;
ctr_out_2 <= ctr_out_2_i;
enable_ROs <= enable_ROs_i;

process(clk,new_challenge)
begin
    if rising_edge(clk) then
        output_valid <= '0';
        if (new_challenge = '1') then
            local_counter <= 0;
            static_delay_counter <= 0;
            reset_atleast_once <= '1';
            enable_ROs_i <= '1';
            reset_counter <= '1';
        else             
            reset_counter <= '1';
            if (reset_atleast_once = '1') then
                enable_ROs_i <= '1';
            else 
                enable_ROs_i <= '0';
            end if; 
            if (static_delay_counter < static_delay_cycles) then
                static_delay_counter <= static_delay_counter + 1;
            elsif (local_counter >= wait_n_cycles) then
                enable_ROs_i <= '0';
                output_valid <= '1';
                ctr_out_1_i <= ctr_in_1;
                ctr_out_2_i <= ctr_in_2;
                reset_counter <= '0';
            else 
                reset_counter <= '0';
                local_counter <= local_counter + 1;
            end if;
        end if; 
    end if;
end process;
    
end bhv;
