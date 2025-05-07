library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_score is
end test_score;

architecture Behavioral of test_score is
    constant T_CLK : time := 10 ns;       -- Période horloge principale
    constant T_CE  : time := 1 us;        -- Période de top CE (1µs pour accélérer simulation)

    signal clk : std_logic := '0';
    signal CE : std_logic := '0';
    signal BPreset : std_logic := '0';
    signal BPL : std_logic := '0';
    signal BPV : std_logic := '0';

    signal loc_unit, loc_dec, vis_unit, vis_dec : std_logic_vector(3 downto 0);

begin

    -- Instance du module à tester
    DUT : entity work.score(Behavioral)
        port map (
            CLK => clk,
            CE_1ms => CE,
            BP_reset => BPreset,
            BPL => BPL,
            BPV => BPV,
            loc_unit => loc_unit,
            loc_dec => loc_dec,
            vis_unit => vis_unit,
            vis_dec => vis_dec
        );

    -- Générateur d'horloge
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for T_CLK/2;
            clk <= '1';
            wait for T_CLK/2;
        end loop;
    end process;

    -- Générateur de CE (1 µs)
    ce_process : process
    begin
        while true loop
            CE <= '1';
            wait for 100 ns;
            CE <= '0';
            wait for 900 ns;
        end loop;
    end process;

    -- Stimulus
    stimulus : process
    begin
        -- Reset initial
        BPreset <= '1';
        wait for 3 us;
        BPreset <= '0';
        wait for 5 us;

        -- Appuis BPL (4 points pour équipe locale)
        for i in 0 to 3 loop
            BPL <= '1';
            wait for 10 us;   -- durée d'appui
            BPL <= '0';
            wait for 20 us;   -- délai avant prochain appui
        end loop;

        -- Appuis BPV (6 points pour équipe visiteuse)
        for i in 0 to 5 loop
            BPV <= '1';
            wait for 10 us;
            BPV <= '0';
            wait for 15 us;
        end loop;

        -- Reset partiel
        wait for 50 us;
        BPreset <= '1';
        wait for 5 us;
        BPreset <= '0';

        -- Derniers appuis
        wait for 20 us;
        BPL <= '1';
        wait for 10 us;
        BPL <= '0';

        wait;
    end process;

end Behavioral;
