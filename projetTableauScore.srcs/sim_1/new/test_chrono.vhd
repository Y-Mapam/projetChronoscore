----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2025 03:58:15 PM
-- Design Name: 
-- Module Name: test_chronometre - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_chrono is
end test_chrono;

architecture Behavioral of test_chrono is
    constant T : time := 10 ns; -- clk period
    constant T_CE : time := 1 us; -- temps du chip-enable
    signal clk : std_logic;
    signal reset : std_logic;
    signal CE : std_logic;
    signal Wait_t : std_logic;
    signal Start : std_logic;
    signal sec_unit : std_logic_vector(3 downto 0);
    signal sec_dec : std_logic_vector(3 downto 0);
    signal min_unit : std_logic_vector(3 downto 0);
    signal min_dec : std_logic_vector(3 downto 0);
    
begin
    chronometer : entity work.chronometer(Behavioral)
        port map(
           CE_1s => CE,
           CLK => clk, 
           WAIT_t => Wait_t,
           START => Start,
           sec_unit => sec_unit,
           sec_dec => sec_dec,
           min_unit => min_unit,
           min_dec => min_dec,
           Reset => reset
        );
        
        -- 10-ns clock 
        process 
        begin
            clk <= '0';
            wait for T/2;
            clk <= '1';
            wait for T/2;
        end process;
        
        -- reset 
        process
        begin
            reset <= '0';
            wait for T_CE * 5;
            reset <= '1';
            wait for T_CE*2;
            reset <= '0';
            wait;
        end process;
        
        -- CE 1s
        process 
        begin
            CE <= '1';
            wait for T;
            CE <= '0';
            wait for T_CE*2;
        end process;
        
        -- Wait_t 
        process
        begin
            Wait_t <= '0';
            wait for T_CE * 100;
            Wait_t <= '1';
            wait for T_CE * 10;
            Wait_t <= '0';
            wait;
        end process;
        
        -- Start 
        process
        begin
            Start <= '0';
            wait for T_CE * 10;
            Start <= '1';
            wait for T_CE*2;
            Start <= '0';
            wait;
        end process;
        
        
        
end Behavioral;
