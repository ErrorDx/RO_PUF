library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;

library work;
use work.custom_math_package.all;

entity simple_RO_PUF is 
    Generic ( 
        number_of_INVs : natural; -- odd value >= 3
        number_of_ROs : natural; -- positive base of 2
        wait_ns : natural);
    Port (
        clk : in std_logic;
        challenge : in std_logic_vector(2*ceil_log2(number_of_ROs)-1 downto 0); -- set of select bits for the two MUXs
        ctr_out_1 : out natural;
        ctr_out_2 : out natural;
        new_challenge : in std_logic;
        PUF_out_valid : out std_logic );    
end simple_RO_PUF;

architecture bhv of simple_RO_PUF is

    -- Constants
    constant clog2_n_ROs : integer := ceil_log2(number_of_ROs);
    constant number_of_MUXs : natural := 2; 
    
    component RO_array is
        Generic (
            number_inv_stages : integer;
            number_of_ROs : integer);
        Port ( 
            enable_to_ROs : in std_logic_vector(number_of_ROs-1 downto 0);
            RO_outputs : out std_logic_vector(number_of_ROs-1 downto 0));
    end component;
    
    component n_to_1_mux is
        Generic ( 
            n : integer -- log2 of the number of inputs 
        );
        Port ( 
            input : in std_logic_vector(n-1 downto 0);
            output : out std_logic;
            select_input : in std_logic_vector(ceil_log2(n)-1 downto 0)
        );
    end component;
    
    component RO_counter is
        Port (
            RO_clk : in std_logic;
            output_ctr : out natural;
            clear_ctr : in std_logic );
    end component;
    
    component output_comparator is
        Generic (
            wait_ns : natural);
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
    end component;
    
    component RO_enable_decoder is 
        Generic (
            number_of_ROs : natural);
        Port (
            enable_to_ROs : out std_logic_vector(number_of_ROs-1 downto 0);
            challenge : in std_logic_vector(number_of_MUXs*ceil_log2(number_of_ROs)-1 downto 0);
            enable_in : in std_logic);
    end component;
    
    -- Internal outputs of blocks
    signal RO_outputs : std_logic_vector(number_of_ROs-1 downto 0);
    signal MUX_outputs : std_logic_vector(number_of_MUXs-1 downto 0);
    type CTR_outputs_t is array (1 downto 0) of natural;
    signal CTR_outputs : CTR_outputs_t;
    
    -- Internal control signals
    signal enable_ROs : std_logic;
    signal enable_to_ROs : std_logic_vector(number_of_ROs-1 downto 0);
    signal reset_counter : std_logic;
    
begin

    RO_array_1: RO_array
    generic map (
        number_inv_stages => number_of_INVs,
        number_of_ROs => number_of_ROs
    )
    port map (
        enable_to_ROs => enable_to_ROs,
        RO_outputs => RO_outputs
    );
    

    MUXs: -- generate two muxes
    for i in 0 to number_of_MUXs-1 generate
        MUX_X : n_to_1_mux
            generic map (
                n => number_of_ROs
            )
            port map (
                input => RO_outputs,
                output => MUX_outputs(i),
                select_input => challenge(i*clog2_n_ROs+clog2_n_ROs-1 downto i*clog2_n_ROs)
            );
    end generate MUXs;
    
    enable_DECODER: RO_enable_decoder 
    generic map (
        number_of_ROs => number_of_ROs
    )
    port map (
        enable_to_ROs => enable_to_ROs,
        challenge => challenge,
        enable_in => enable_ROs
    );
    
    COUNTERs: 
    for i in 0 to number_of_MUXs-1 generate
        CTR_X : RO_counter 
            port map (
                RO_clk => MUX_outputs(i),
                output_ctr => CTR_outputs(i), 
                clear_ctr => reset_counter
            );
    end generate COUNTERs;
    
    COMPARATOR: output_comparator
    generic map (
        wait_ns => wait_ns
    )
    port map( 
        clk => clk,
        new_challenge => new_challenge,
        reset_counter => reset_counter,
        ctr_out_1 => ctr_out_1,
        ctr_out_2 => ctr_out_2,
        ctr_in_1 => CTR_outputs(0),
        ctr_in_2 => CTR_outputs(1),
        output_valid => PUF_out_valid,
        enable_ROs => enable_ROs
    );

end bhv;
