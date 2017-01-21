library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ring_counter is
	 generic (n: integer := 4);
    Port ( START : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           Q : buffer  STD_LOGIC_VECTOR (0 to n - 1));
end ring_counter;

architecture Behavioral of ring_counter is
	
begin
	process (CLOCK, START)
	begin
		if (START = '1') then
			Q (0) <= '1';
			Q (1 to n-1) <= (others => '0');
		elsif (CLOCK'event and CLOCK = '1') then
			for i in 1 to n-1 loop
				Q(i) <= Q(i - 1);
			end loop;
			Q(0) <= Q(n - 1);
		end if;
	end process;
end Behavioral;

