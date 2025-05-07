----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2025 09:53:42
-- Design Name: 
-- Module Name: display - Behavioral
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

entity display is
    Port ( CE_1ms : in STD_LOGIC;
           CE_1s : in STD_LOGIC;
           CLK : in STD_LOGIC;
           data_disp1_L0 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L1 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_R0 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_R1 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L0 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L1 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R0 : in STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R1 : in STD_LOGIC_VECTOR (3 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           LEDS : out STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is

-- définition des signaux
signal Q_counter_3b_e: std_logic_vector(2 downto 0);
signal Q_Tregister_1b: std_logic;
signal O_mux_8x1x4b: std_logic_vector(3 downto 0);
signal O_transcodeur_3v8: std_logic_vector(7 downto 0);
signal O_mux_8x1x1b: std_logic;
signal O_transcoder_7segs: std_logic_vector(6 downto 0);
signal data_register_8b : std_logic_vector(7 downto 0);

-- définiton composant
component counter_3b_e
port(
    CE_1ms : in std_logic;
    CLK : in std_logic;
    Q : out std_logic_vector(2 downto 0)
);
end component counter_3b_e;

component transcodeur_3v8
port(
    A : in std_logic_vector(2 downto 0);
    O : out std_logic_vector(7 downto 0)
);
end component transcodeur_3v8;

component mux_8x1x1b
port(
    A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    E: in std_logic;
    F: in std_logic;
    G: in std_logic;
    H: in std_logic;
    sel: in std_logic_vector (2 downto 0);
    O: out std_logic
);
end component mux_8x1x1b;

component mux_8x1x4b
port(
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    C: in std_logic_vector(3 downto 0);
    D: in std_logic_vector(3 downto 0);
    E: in std_logic_vector(3 downto 0);
    F: in std_logic_vector(3 downto 0);
    G: in std_logic_vector(3 downto 0);
    H: in std_logic_vector(3 downto 0);
    S: in std_logic_vector(2 downto 0);
    O: out std_logic_vector(3 downto 0)
);
end component mux_8x1x4b;

component Tregister_1b
port(
    CLK: in std_logic;
    T: in std_logic;
    Q: out std_logic
);
end component Tregister_1b;

component transcoder_7segs
port(
    A: in std_logic_vector(3 downto 0);
    O: out std_logic_vector(6 downto 0)
);
end component transcoder_7segs;

component register_8b
port(
    CLK: in std_logic;
    D: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector(7 downto 0)
);
end component register_8b;
    
begin

data_register_8b <= O_mux_8x1x1b & O_transcoder_7segs;

    U0: counter_3b_e
    port map(
        CE_1ms => CE_1ms,
        CLK => CLK,
        Q => Q_counter_3b_e
    );
    
    U3: Tregister_1b
    port map(
        CLK => CLK,
        T => CE_1s,
        Q => Q_Tregister_1b
    );
        
    U5: mux_8x1x4b
    port map(
        A => data_disp1_R0,
        B => data_disp1_R1,
        C => data_disp1_L0,
        D => data_disp1_L1,
        E => data_disp2_R0,
        F => data_disp2_R1,
        G => data_disp2_L0,
        H => data_disp2_L1,
        S => Q_counter_3b_e,
        O => O_mux_8x1x4b
    );
    
    U1: transcodeur_3v8
    port map(
        A => Q_counter_3b_e,
        O => O_transcodeur_3v8
    );
    
    U4: mux_8x1x1b
    port map(
        A   => '0',
        B   => '0',
        C   => Q_Tregister_1b,
        D   => '0',
        E   => '0',
        F   => '0',
        G   => '0',
        H   => '0',
        sel => Q_counter_3b_e,
        O   => O_mux_8x1x1b
    );
    
    U6: transcoder_7segs
    port map(
        A => O_mux_8x1x4b,
        O => O_transcoder_7segs
    );
    
    U2: register_8b
    port map(
        clk => clk,
        D => O_transcodeur_3v8,
        Q => AN
    );
    
    U7: register_8b
    port map(
        clk => clk,
        D => data_register_8b,
        Q => LEDS
    );

end Behavioral;
