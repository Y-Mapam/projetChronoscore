----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 10:47:00
-- Design Name: 
-- Module Name: counter_0to5 - Behavioral
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

entity counter_0to5 is
    Port ( CE : in STD_LOGIC;
           R : in STD_LOGIC;
           CLK : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0);
           TC : out STD_LOGIC);
end counter_0to5;

architecture Behavioral of counter_0to5 is

signal cpt : unsigned (3 downto 0);

begin
    process(CLK, R)
    begin
        if (R = '1') then -- reset asynchrone interne au process
            cpt <= "0000";
            TC <= '0';
        end if;
        if (rising_edge(clk)) then
            if (CE = '1') then 
                if (cpt = 5) then 
                    cpt <= "0000";
                    TC <= '1'; -- pour que TC soit actif pendant 1 cycle d'horloge si le compteur atteint la valeur 5
                else
                    cpt <= cpt + 1;
                    TC <= '0';
                end if;
            else
                TC <= '0'; -- si CE désactivé on repasse bien TC à 0
            end if;
        end if;
    end process;
    O <= std_logic_vector(cpt);

end Behavioral;
