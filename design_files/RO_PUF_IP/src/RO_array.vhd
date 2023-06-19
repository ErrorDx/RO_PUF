library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RO_array is
    Generic (
        number_inv_stages : integer;
        number_of_ROs : integer);
    Port ( 
        enable_to_ROs : in std_logic_vector(number_of_ROs-1 downto 0);
        RO_outputs : out std_logic_vector(number_of_ROs-1 downto 0));
    attribute dont_touch : string;
    attribute dont_touch of RO_array : entity is "true";
end RO_array;
    
architecture bhv of RO_array is

    component generic_RO is
        Generic ( 
            number_inv_stages : integer;
            stage_delay : integer );         
        Port ( 
            RO_clk_out : out std_logic;
            en_RO_clk : in std_logic );
    end component;

begin

    RO_array_0:
    for i in 0 to number_of_ROs-1 generate 
        RO_X: generic_RO 
            generic map(
                number_inv_stages => number_inv_stages,
                stage_delay => 10+i)
            port map(
                RO_clk_out=>RO_outputs(i),
                en_RO_clk => enable_to_ROs(i));
    end generate RO_array_0;

end bhv;
