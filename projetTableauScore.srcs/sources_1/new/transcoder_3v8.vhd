----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2025 11:16:39
-- Design Name: 
-- Module Name: transcodeur_3v8 - Behavioral
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

entity transcodeur_3v8 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (7 downto 0));
end transcodeur_3v8;

architecture Behavioral of transcodeur_3v8 is

begin
O <=    "00000001" when A="000" else
        "00000010" when A="001" else
        "00000100" when A="010" else
        "00001000" when A="011" else
        "00010000" when A="100" else
        "00100000" when A="101" else
        "01000000" when A="110" else
        "10000000" when A="111";        

end Behavioral;
