
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generic_up_down_counter_parallel_load is
    generic (n : integer := 16);
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;                    -- Counter reset.
           UPDOWN : in  STD_LOGIC;                   -- Count direction.
           LOAD : in  STD_LOGIC;                     -- Load external data.
           DATA : in  STD_LOGIC_VECTOR (n - 1 downto 0); -- External data.
           Q : buffer  STD_LOGIC_VECTOR (n -1 downto 0));  -- Counter output.
end generic_up_down_counter_parallel_load;

architecture Behavioral of generic_up_down_counter_parallel_load is

begin
	process (CLOCK, RESET)
	begin
		if (RESET = '1') then
			Q <= (others => '0');
		elsif (CLOCK'event and CLOCK = '1') then
			if (LOAD = '1') then
				Q <= DATA;
			elsif (UPDOWN = '0') then
				Q <= Q + 1;
			else
				Q <= Q - 1;
			end if;
		end if;
	end process;

end Behavioral;

