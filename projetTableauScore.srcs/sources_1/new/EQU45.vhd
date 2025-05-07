----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 10:53:26
-- Design Name: 
-- Module Name: EQU45 - Behavioral
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

entity EQU45 is
    Port ( min_dec : in STD_LOGIC_VECTOR (3 downto 0);
           min_unit : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC);
end EQU45;

architecture Behavioral of EQU45 is

begin

O <= '1' when (min_dec = "0100" and min_unit = "0101") else '0'; -- toujours utiliser when dans du out of process (if est propre à un système avec process)

end Behavioral;
