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

entity test_counter3b is
end test_counter3b;

architecture Behavioral of test_counter3b is
    constant T : time := 10 ns; -- clk period
    signal clk : std_logic;
    signal CE : std_logic;
    signal output : std_logic_vector(2 downto 0);
    
begin
    counter3b : entity work.counter_3b_E(Behavioral)
        port map(
            clk => clk,
            CE_1ms => CE,
            Q => output
        );
        
        -- 10-ns clock 
        process 
        begin
            clk <= '0';
            wait for T/2;
            clk <= '1';
            wait for T/2;
        end process;
        
            -- CE
        process 
        begin
            CE <= '0';
            wait for T*100/2;
            CE <= '1';
            wait for T/2;
        end process;
end Behavioral;
