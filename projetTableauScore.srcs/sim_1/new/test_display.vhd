library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_display is
end test_display;

architecture Behavioral of test_display is

    -- Constantes pour les périodes
    constant T_CLK : time := 10 ns;
    constant T_CE_1ms : time := 1 us;
    constant T_CE_1s : time := 10 us;

    -- Signaux d’entrée
    signal clk          : std_logic := '0';
    signal CE_1ms       : std_logic := '0';
    signal CE_1s        : std_logic := '0';

    signal data_disp1_L0, data_disp1_L1, data_disp1_R0, data_disp1_R1 : std_logic_vector(3 downto 0);
    signal data_disp2_L0, data_disp2_L1, data_disp2_R0, data_disp2_R1 : std_logic_vector(3 downto 0);

    -- Signaux de sortie
    signal AN    : std_logic_vector(7 downto 0);
    signal LEDS  : std_logic_vector(7 downto 0);

begin

    -- Instanciation du module display
    DUT: entity work.display
        port map(
            CE_1ms => CE_1ms,
            CE_1s => CE_1s,
            CLK => clk,
            data_disp1_L0 => data_disp1_L0,
            data_disp1_L1 => data_disp1_L1,
            data_disp1_R0 => data_disp1_R0,
            data_disp1_R1 => data_disp1_R1,
            data_disp2_L0 => data_disp2_L0,
            data_disp2_L1 => data_disp2_L1,
            data_disp2_R0 => data_disp2_R0,
            data_disp2_R1 => data_disp2_R1,
            AN => AN,
            LEDS => LEDS
        );

    -- Horloge
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for T_CLK/2;
            clk <= '1';
            wait for T_CLK/2;
        end loop;
    end process;

    -- CE_1ms (1 us)
    ce_1ms_process: process
    begin
        while true loop
            CE_1ms <= '1';
            wait for T_CLK;
            CE_1ms <= '0';
            wait for T_CE_1ms - T_CLK;
        end loop;
    end process;

    -- CE_1s (10 us ici pour la simulation)
    ce_1s_process: process
    begin
        while true loop
            CE_1s <= '1';
            wait for T_CLK;
            CE_1s <= '0';
            wait for T_CE_1s - T_CLK;
        end loop;
    end process;

    -- Stimuli
    stim_process: process
    begin
        -- Valeurs de départ
        data_disp1_L0 <= "0001";  -- 1
        data_disp1_L1 <= "0010";  -- 2
        data_disp1_R0 <= "0011";  -- 3
        data_disp1_R1 <= "0100";  -- 4

        data_disp2_L0 <= "0101";  -- 5
        data_disp2_L1 <= "0110";  -- 6
        data_disp2_R0 <= "0111";  -- 7
        data_disp2_R1 <= "1000";  -- 8

        wait for 100 us;

        -- Changement de données après 100 us
        data_disp1_L0 <= "1001";  -- 9
        data_disp1_L1 <= "0000";  -- 0
        data_disp1_R0 <= "0001";
        data_disp1_R1 <= "0010";

        data_disp2_L0 <= "0011";
        data_disp2_L1 <= "0100";
        data_disp2_R0 <= "0101";
        data_disp2_R1 <= "0110";

        wait;

    end process;

end Behavioral;
