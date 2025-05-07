----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2025 10:24:56
-- Design Name: 
-- Module Name: counter_3b_E - Behavioral
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

entity counter_3b_E is
    Port ( CE_1ms : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end counter_3b_E;

architecture Behavioral of counter_3b_E is

signal cpt : unsigned (2 downto 0) := (others => '0');

begin
    process(CLK)
    begin
        if(rising_edge(clk)) then
            if (CE_1ms =  '1') then -- si passe à 8 : "1000" -> "000" donc cpt mod(8)                cpt <= cpt+1;
                cpt <= cpt+1;
            end if;
        end if;
    end process;
    Q <= std_logic_vector(cpt);
end Behavioral;
