----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2025 12:16:28
-- Design Name: 
-- Module Name: transcoder_7Os - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transcoder_7segs is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end transcoder_7segs;

architecture Behavioral of transcoder_7segs is

signal segs : STD_LOGIC_VECTOR (6 downto 0);

begin

O <= not(segs); -- car segs est utilisé en logique positive

with A select
segs <= "0111111" when "0000", --0--
        "0000110" when "0001", --1--
        "1011011" when "0010", --2--
        "1001111" when "0011", --3--
        "1100110" when "0100",
        "1101101" when "0101",
        "1111101" when "0110",
        "0000111" when "0111",
        "1111111" when "1000",
        "1101111" when "1001",  --9--
        "0000000" when others;

end Behavioral;
