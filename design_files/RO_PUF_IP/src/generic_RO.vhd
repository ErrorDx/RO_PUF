library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_RO is
    Generic ( 
        number_inv_stages : integer := 3;
        stage_delay : integer := 10 );         
    Port ( 
        RO_clk_out : out std_logic;
        en_RO_clk : in std_logic);
    attribute dont_touch : string;
    attribute ALLOW_COMBINATORIAL_LOOPS : string;
    attribute dont_touch of generic_RO : entity is "true";
end generic_RO;

architecture bhv of generic_RO is
    signal inv_chain : std_logic_vector(number_inv_stages-1 downto 0) := (others => '0');
    attribute ALLOW_COMBINATORIAL_LOOPS of inv_chain : signal is "true";
    attribute dont_touch of inv_chain : signal is "true";
begin
    gen_inv_chain: for i in 0 to number_inv_stages-1 generate 
        INV_0: if (i=0 and number_inv_stages /= 1) generate
            inv_chain(i) <= not inv_chain(i+1); --after (stage_delay+i) * 1 ns;
        end generate;
        
        INV_0_alt: if (i=0 and number_inv_stages = 1) generate 
            inv_chain(i) <= not inv_chain(i); --after (stage_delay+i) * 1 ns;
        end generate;
            
        INV_x: if (i/=0 and i/=number_inv_stages-1) generate 
            inv_chain(i) <= not inv_chain(i+1); --after (stage_delay+i) * 1 ns;
        end generate;
        
        INV_N: if (i=number_inv_stages-1 and number_inv_stages /= 1) generate 
            inv_chain(i) <= not inv_chain(0); --after (stage_delay+i) * 1 ns;
        end generate;
        
    end generate;
    RO_clk_out <= inv_chain(0) and en_RO_clk;

end bhv;
