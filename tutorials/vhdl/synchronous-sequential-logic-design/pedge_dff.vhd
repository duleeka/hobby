library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pedge_dff is
    Port ( D : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end pedge_dff;

architecture Behavioral of pedge_dff is

begin
	process
	begin
		wait until CLOCK = '1';
			Q <= D;
	end process;

end Behavioral;

