
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity right_to_left_shift_reg_4bit is
    Port ( R : in  STD_LOGIC_VECTOR (3 downto 0); -- External input.
           CLOCK : in  STD_LOGIC;
           RIN : in  STD_LOGIC;
			  LOAD : in STD_LOGIC;	-- LOAD external input.
           D : buffer  STD_LOGIC_VECTOR (3 downto 0));
end right_to_left_shift_reg_4bit;

architecture Behavioral of right_to_left_shift_reg_4bit is

begin
	process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '1') then
			if (LOAD = '1') then
				D <= R;
			else
				D(3) <= D(2);
				D(2) <= D(1);
				D(1) <= D(0);
				D(0) <= RIN;
			end if;
		end if;
	end process;

end Behavioral;

