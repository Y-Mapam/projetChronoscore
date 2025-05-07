----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2025 10:54:29
-- Design Name: 
-- Module Name: score - Behavioral
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

entity score is
    Port ( CE_1ms : in STD_LOGIC;
           BPL : in STD_LOGIC;
           BPV : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BP_reset : in STD_LOGIC;
           loc_unit : out STD_LOGIC_VECTOR (3 downto 0);
           loc_dec : out STD_LOGIC_VECTOR (3 downto 0);
           vis_unit : out STD_LOGIC_VECTOR (3 downto 0);
           vis_dec : out STD_LOGIC_VECTOR (3 downto 0)
    );
end score;

architecture Behavioral of score is

-- définition signal
signal QL1 : STD_LOGIC;
signal QL2 : STD_LOGIC;
signal QV1 : STD_LOGIC;
signal QV2 : STD_LOGIC;
signal QL3 : STD_LOGIC;
signal YL : STD_LOGIC;
signal QV3 : STD_LOGIC;
signal YV : STD_LOGIC;

signal CE_L_unit : STD_LOGIC;
signal CE_V_unit : STD_LOGIC;

signal TC_L_unit : STD_LOGIC;
signal TC_V_unit : STD_LOGIC;
signal TC_L_dec : STD_LOGIC;
signal TC_V_dec : STD_LOGIC;

-- définiton composant
component register_1b_E
port(
    CLK : in std_logic;
    CE : in std_logic;
    D : in std_logic;
    Q : out std_logic
);
end component register_1b_E;

component register_1b
port(
    CLK : in std_logic;
    D : in std_logic;
    Q : out std_logic
);
end component register_1b;

component XOR_2b
port(
    A : in std_logic;
    B : in std_logic;
    Y : out std_logic 
);
end component XOR_2b;

component counter_0to9
port(
    CE : in std_logic;
    R : in std_logic;
    CLK : in std_logic;
    O : out std_logic_vector(3 downto 0);
    TC : out std_logic
);
end component counter_0to9;

begin

    CE_L_unit <= QL2 and YL;
    CE_V_unit <= QV2 and YV;

    REG1_L1 : register_1b_E
        port map(
            CE => CE_1ms,
            CLK => CLK,
            D => BPL,
            Q => QL1
        );
        
    REG1_L2 : register_1b_E
        port map(
            CE => CE_1ms,
            CLK => CLK,
            D => QL1,
            Q => QL2
        );
        
    REG1_V1 : register_1b_E
        port map(
            CE => CE_1ms,
            CLK => CLK,
            D => BPV,
            Q => QV1
        );
        
    REG1_V2 : register_1b_E
        port map(
            CE => CE_1ms,
            CLK => CLK,
            D => QV1,
            Q => QV2
        );
        
    REG2_L : register_1b
        port map(
            CLK => CLK,
            D => QL2,
            Q => QL3
        );
        
    REG2_V : register_1b
        port map(
            CLK => CLK,
            D => QV2,
            Q => QV3
        );

    XOR_L : XOR_2b
        port map(
            A => QL3,
            B => QL2,
            Y => YL
        );

     XOR_V : XOR_2b
        port map(
            A => QV3,
            B => QV2,
            Y => YV
        );

    CPT_L_unit : counter_0to9
        port map(
            CE => CE_L_unit,
            R => BP_reset,
            CLK => CLK,
            O => loc_unit,
            TC => TC_L_unit
        );

    CPT_L_dec : counter_0to9
        port map(
            CE => TC_L_unit,
            R => BP_reset,
            CLK => CLK,
            O => loc_dec,
            TC => TC_L_dec
        );

    CPT_V_unit : counter_0to9
        port map(
            CE => CE_V_unit,
            R => BP_reset,
            CLK => CLK,
            O => vis_unit,
            TC => TC_V_unit
        );

    CPT_V_dec : counter_0to9
        port map(
            CE => TC_V_unit,
            R => BP_reset,
            CLK => CLK,
            O => vis_dec,
            TC => TC_V_dec
        );

end Behavioral;
