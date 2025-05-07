----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 11:19:17
-- Design Name: 
-- Module Name: test_counter_0to9 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_counter_0to9 is
end test_counter_0to9;

architecture Behavioral of test_counter_0to9 is
    constant T : time := 10 ns; -- clk period
    signal clk : std_logic;
    signal reset : std_logic;
    signal CE : std_logic;
    signal output : std_logic_vector(3 downto 0);
    signal TC : std_logic;
    
begin
    counter_0to9 : entity work.counter_0to9(Behavioral)
        port map(
            clk => clk,
            R => reset,
            CE => CE,
            O => output,
            TC => TC
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
        reset <= '1', '0' after T/2, '1' after 25*T, '0' after 25*T+T/2;
        
            -- CE
        CE <= '1', '0' after 50*T, '1' after 70*T;
end Behavioral;
