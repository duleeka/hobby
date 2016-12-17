library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end mux2to1;

architecture Structural of mux2to1 is

component not_gate is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component and_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component or_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

Signal W1, W2, W3: Std_Logic;
begin

	G1: not_gate Port Map (C, W1);
	G2: and_2_gate Port Map (A, W1, W2);
	G3: and_2_gate Port Map (B, C, W3);
	G4: or_2_gate Port Map (W2, W3, Z);
end Structural;

