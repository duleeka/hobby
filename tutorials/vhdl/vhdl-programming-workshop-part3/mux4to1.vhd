----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:22 12/17/2016 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4to1 is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC);
end mux4to1;

architecture Behavioral of mux4to1 is
component mux2to1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end component;

SIGNAL W1, W2 : STD_LOGIC;
begin
	M1: mux2to1 port map (X(0), X(1), C(0), W1);
	M2: mux2to1 port map (X(2), X(3), C(0), W2);
	M3: mux2to1 port map (W1, W2, C(1), Y);

end Behavioral;

