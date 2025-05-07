----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 11:10:57
-- Design Name: 
-- Module Name: register_D_1b - Behavioral
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

entity register_D_1b is
    Port ( CLk : in STD_LOGIC;
           R : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end register_D_1b;

architecture Behavioral of register_D_1b is

begin
    process(CLK, R)
    begin
        if (R = '1') then 
            Q <= '0';
        end if;
        if (rising_edge(clk)) then
            Q <= D;
        end if;
    end process;
end Behavioral;
