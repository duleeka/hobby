library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nedge_dff is
    Port ( D : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end nedge_dff;

architecture Behavioral of nedge_dff is

begin
	process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '0') then
			Q <= D;
		end if;
	end process;

end Behavioral;

