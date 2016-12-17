library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bcd_to_sevenseg is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           Segs : out  STD_LOGIC_VECTOR (1 to 7));
end bcd_to_sevenseg;

architecture Structural of bcd_to_sevenseg is
component not_gate is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component and_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component and_3_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component or_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component or_3_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component or_4_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           X4 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component xor_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component xnor_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out STD_LOGIC);
end component;

signal ip0, ip1, ip2, a1, b1, d1, d2, d3, d4, e1, e2, f1, f2, f3, g1, g2: STD_LOGIC;
signal a, b, c, d, e, f, g: STD_LOGIC;
begin
	Segs(1) <= a;
	Segs(2) <= b;
	Segs(3) <= c;
	Segs(4) <= d;
	Segs(5) <= e;
	Segs(6) <= f;
	Segs(7) <= g;

	U0: not_gate PORT MAP(I(0), ip0);
	U1: not_gate PORT MAP(I(1), ip1);
	U2: not_gate PORT MAP(I(2), ip2);
	U3: xnor_2_gate PORT MAP(I(2), I(0), a1);	
	U4: or_3_gate PORT MAP(I(3), I(1), a1, a);	
	U5: xnor_2_gate PORT MAP(I(1), I(0), b1);		
	U6: or_2_gate PORT MAP(ip2, b1, b);		
	U7: or_3_gate PORT MAP(I(2), ip1, I(0), c);			
	U8: and_2_gate PORT MAP(I(1), ip0, d1);				
	U9: and_2_gate PORT MAP(ip2, ip0, d2);					
	U10: and_2_gate PORT MAP(ip2, I(1), d3);						
	U11: and_3_gate PORT MAP(I(2), ip1, I(0), d4);							
	U12: or_4_gate PORT MAP(d1, d2, d3, d4, d);								
	U13: and_2_gate PORT MAP(I(1), ip0, e1);									
	U14: and_2_gate PORT MAP(ip2, ip0, e2);										
	U15: or_2_gate PORT MAP(e1, e2, e);											
	U16: and_2_gate PORT MAP(I(2), ip1, f1);												
	U17: and_2_gate PORT MAP(I(2), ip0, f2);													
	U18: and_2_gate PORT MAP(ip1, ip0, f3);													
	U19: or_4_gate PORT MAP(I(3), f1, f2, f3, f);													
	U20: xor_2_gate PORT MAP(I(2), I(1), g1);														
	U21: and_2_gate PORT MAP(I(1), ip0, g2);															
	U22: or_3_gate PORT MAP(I(3), g1, g2, g);																
end Structural;

