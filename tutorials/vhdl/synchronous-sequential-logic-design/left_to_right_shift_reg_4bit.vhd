
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity left_to_right_shift_reg_4bit is
    Port ( R : in  STD_LOGIC_VECTOR (3 downto 0); -- External input.
           CLOCK : in  STD_LOGIC;
           LIN : in  STD_LOGIC;
			  LOAD : in STD_LOGIC;	-- LOAD external input.
           D : buffer  STD_LOGIC_VECTOR (3 downto 0));
end left_to_right_shift_reg_4bit;

architecture Behavioral of left_to_right_shift_reg_4bit is

begin
	process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '1') then
			if (LOAD = '1') then
				D <= R;
			else
				D(0) <= D(1);
				D(1) <= D(2);
				D(2) <= D(3);
				D(3) <= LIN;
			end if;
		end if;
	end process;

end Behavioral;

