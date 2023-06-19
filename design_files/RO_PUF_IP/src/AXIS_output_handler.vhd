library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

library work;
use work.custom_math_package.all;

entity AXIS_output_handler is
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
        ctr_out_1 : in natural range 0 to 2**31-1;
        ctr_out_2 : in natural range 0 to 2**31-1  );
end AXIS_output_handler;

architecture bhv of AXIS_output_handler is

-- The FIFO is full when the RAM contains ram_depth - 1 elements
type ram_type is array (0 to 1) of std_logic_vector(out_data'range);
signal ram : ram_type;

type state_t is (WAIT_FOR_NEW_RESPONSE, TX_FIRST_CTR, TX_SECOND_CTR, WAIT_FOR_NEW_CHALLENGE);
signal state : state_t := WAIT_FOR_NEW_RESPONSE;

signal out_valid_i : std_logic := '0';

begin

out_valid <= out_valid_i;

PROC_STATE : process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then 
            out_valid_i <= '0';
            out_last <= '0';
            state <= WAIT_FOR_NEW_RESPONSE;
        else 
            case state is
                when WAIT_FOR_NEW_RESPONSE =>
                    state <= WAIT_FOR_NEW_RESPONSE;
                    if (PUF_out_valid = '1') then
                        ram(0) <= std_logic_vector(to_unsigned(ctr_out_1,out_data'length));
                        ram(1) <= std_logic_vector(to_unsigned(ctr_out_2,out_data'length));
                        state <= TX_FIRST_CTR;
                    end if;
                when TX_FIRST_CTR =>
                    state <= TX_FIRST_CTR;
                    out_last <= '0';
                    out_data <= ram(0);
                    out_valid_i <= '1';
                    if (out_ready = '1' and out_valid_i = '1') then
                        out_data <= ram(1);
                        out_valid_i <= '1';
                        out_last <= '1';
                        state <= TX_SECOND_CTR;
                    end if;
                when TX_SECOND_CTR =>
                    state <= TX_SECOND_CTR;
                    out_data <= ram(1);
                    out_valid_i <= '1';
                    out_last <= '1';
                    if (out_ready = '1' and out_valid_i = '1') then 
                        out_valid_i <= '0';
                        out_last <= '0';
                        state <= WAIT_FOR_NEW_CHALLENGE;
                    end if;
                when WAIT_FOR_NEW_CHALLENGE =>
                    state <= WAIT_FOR_NEW_CHALLENGE;
                    if (PUF_out_valid = '0') then
                        state <= WAIT_FOR_NEW_RESPONSE;
                    end if;
            end case; 
        end if;
    end if;       
end process;


 
end bhv;
