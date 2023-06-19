library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.custom_math_package.all;

entity AXIS_input_handler is
    Generic (  
        storage_depth : natural := 1;
        number_of_ROs : natural := 16 
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
end AXIS_input_handler;

architecture bhv of AXIS_input_handler is

-- The FIFO is full when the RAM contains ram_depth - 1 elements
type ram_type is array (0 to storage_depth - 1) of std_logic_vector(in_data'range);
signal ram : ram_type;

signal in_ready_i : std_logic := '1';
signal processing_request : std_logic := '0';
type state_t is (RX_READY, ENABLE_PUF, BUSY);
signal state : state_t;

begin

in_ready <= '1' when state = RX_READY else '0';
challenge <= ram(0);

PROC_STATE : process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then 
            state <= RX_READY;
        else 
            case state is
                when RX_READY =>
                    state <= RX_READY;
                    if (in_valid = '1') then
                        state <= ENABLE_PUF;
                        ram(0) <= in_data;
                        new_challenge <= '1';
                    end if;
                when ENABLE_PUF =>
                    new_challenge <= '0';
                    state <= BUSY;
                when BUSY =>
                    state <= BUSY;
                    if (PUF_out_valid = '1') then
                        state <= RX_READY;
                    end if;
            end case; 
        end if;
    end if;       
end process;


 
end bhv;
