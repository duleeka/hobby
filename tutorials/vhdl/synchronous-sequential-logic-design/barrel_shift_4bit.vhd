library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shift_4bit is
    Port ( CLOCK : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;     -- Load external data.
           S : in  STD_LOGIC_VECTOR (1 downto 0); -- Number of bits to be shifted.
           DATA : in  STD_LOGIC_VECTOR (3 downto 0); -- External data input.
           Q : buffer  STD_LOGIC_VECTOR (3 downto 0)); -- Output.
end barrel_shift_4bit;

architecture Behavioral of barrel_shift_4bit is

begin
	process (CLOCK, LOAD)
	begin
		if (LOAD = '1') then
			Q <= DATA;
		elsif (CLOCK'event and CLOCK = '1') then
			case S is
				when "01" => Q <= Q(2 downto 0) & '0';  -- 1 bit shift.
				when "10" => Q <= Q(1 downto 0) & "00"; -- 2 bit shift.
				when "11" => Q <= Q(0) & "000";         -- 3 bit shift.
				when others => Q <= Q;                  -- no shift.
			end case;
		end if;
	end process;

end Behavioral;

