----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2025 12:40:42
-- Design Name: 
-- Module Name: register_1b - Behavioral
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

entity Tregister_1b is
    Port ( CLK : in STD_LOGIC;
           T : in STD_LOGIC;
           Q : out STD_LOGIC);
end Tregister_1b;

architecture Behavioral of Tregister_1b is

begin

    process(CLK)
    begin
        if(rising_edge(clk)) then
            if (T = '0') then
                Q <= '1';
            else
                Q <= '0';
            end if;
        end if;
    end process;

end Behavioral;
