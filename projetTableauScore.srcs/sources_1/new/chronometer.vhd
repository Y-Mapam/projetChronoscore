----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 12:23:56
-- Design Name: 
-- Module Name: chronometer - Behavioral
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

entity chronometer is
    Port ( CE_1s : in STD_LOGIC;
           CLK : in STD_LOGIC;
           WAIT_t : in STD_LOGIC;
           START : in STD_LOGIC;
           sec_unit : out STD_LOGIC_VECTOR (3 downto 0);
           sec_dec : out STD_LOGIC_VECTOR (3 downto 0);
           min_unit : out STD_LOGIC_VECTOR (3 downto 0);
           min_dec : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end chronometer;

architecture Behavioral of chronometer is

-- déclaration des signaux
signal Qint : std_logic;
signal Dint : std_logic;
signal min_dec_int : std_logic_vector (3 downto 0);
signal min_unit_int : std_logic_vector (3 downto 0);
signal O_EQU : std_logic;
signal CE_CPT1 : std_logic;
signal TC1 : std_logic;
signal TC2 : std_logic;
signal TC3 : std_logic;
signal TC4 : std_logic;

-- définiton composant
component register_D_1b
port(
    CLK : in std_logic;
    R : in std_logic;
    D : in std_logic;
    Q : out std_logic
);
end component register_D_1b;

component counter_0to9
port(
    CE : in std_logic;
    R : in std_logic;
    CLK : in std_logic;
    O : out std_logic_vector(3 downto 0);
    TC : out std_logic
);
end component counter_0to9;

component counter_0to5
port(
    CE : in std_logic;
    R : in std_logic;
    CLK : in std_logic;
    O : out std_logic_vector(3 downto 0);
    TC : out std_logic
);
end component counter_0to5;

component EQU45
port(
    min_dec : in std_logic_vector(3 downto 0);
    min_unit : in std_logic_vector(3 downto 0);
    O : out std_logic
);
end component EQU45;

begin
    -- définition des signaux internes
    Dint <= Qint or START;
    CE_CPT1 <= not(O_EQU) and not(WAIT_t) and CE_1s and Qint;
    
    -- définition des sorties
    min_unit <= min_unit_int;
    min_dec <= min_dec_int;
    
    REG1 : register_D_1b
        port map(
            CLK => CLK,
            R => Reset,
            D => Dint,
            Q => Qint
        );
    
    EQU45_1: EQU45
        port map(
            min_dec => min_dec_int,
            min_unit => min_unit_int,
            O => O_EQU
            );
            
    CPT1: counter_0to9
        port map(
            CE => CE_CPT1,
            R => Reset,
            CLK => CLK,
            O => sec_unit,
            TC => TC1
            );

    CPT2:  counter_0to5
        port map(
            CE => TC1,
            R => Reset,
            CLK => CLK,
            O => sec_dec,
            TC => TC2
            );
           
    CPT3:  counter_0to9
        port map(
            CE => TC2,
            R => Reset,
            CLK => CLK,
            O => min_unit_int,
            TC => TC3
            );
            
    CPT4:  counter_0to5
        port map(
            CE => TC3,
            R => Reset,
            CLK => CLK,
            O => min_dec_int,
            TC => TC4
            );

end Behavioral;
