library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity timeGenerator is
    Port (
        GCLK       : in  std_logic;
        TEST_HSLS  : in  std_logic;  -- (optionnel, pas utilisé ici)
        CE_1ms     : out std_logic;
        CE_1s      : out std_logic;
        CLK        : out std_logic
    );
end timeGenerator;

architecture Behavioral of timeGenerator is

    -- Fréquence de GCLK = 100 MHz ? période = 10 ns
    -- 100_000 cycles ? 1 ms
    -- 100_000_000 cycles ? 1 s

    constant CLK_FREQ     : integer := 100_000_000;
    constant MS_TICKS     : integer := CLK_FREQ / 1000;  -- 100_000
    constant S_TICKS      : integer := CLK_FREQ;         -- 100_000_000

    signal counter_ms     : integer range 0 to MS_TICKS := 0;
    signal counter_s      : integer range 0 to S_TICKS  := 0;

    signal ce_1ms_int     : std_logic := '0';
    signal ce_1s_int      : std_logic := '0';

begin

    -- Retourne l'horloge principale
    CLK <= GCLK;

    -- Générateur de top 1 ms
    process(GCLK)
    begin
        if rising_edge(GCLK) then
            if counter_ms = MS_TICKS - 1 then
                ce_1ms_int <= '1';
                counter_ms <= 0;
            else
                ce_1ms_int <= '0';
                counter_ms <= counter_ms + 1;
            end if;
        end if;
    end process;

    -- Générateur de top 1 s
    process(GCLK)
    begin
        if rising_edge(GCLK) then
            if counter_s = S_TICKS - 1 then
                ce_1s_int <= '1';
                counter_s <= 0;
            else
                ce_1s_int <= '0';
                counter_s <= counter_s + 1;
            end if;
        end if;
    end process;

    -- Affectation des sorties
    CE_1ms <= ce_1ms_int;
    CE_1s  <= ce_1s_int;

end Behavioral;
