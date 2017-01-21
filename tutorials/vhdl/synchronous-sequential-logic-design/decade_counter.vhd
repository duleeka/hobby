library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decade_counter is
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end decade_counter;

architecture Behavioral of decade_counter is
	signal temp: std_logic_vector(3 downto 0);
begin
	Q <= temp;
	process (CLOCK, RESET)
	begin
		if (RESET = '1') then
			temp <= (others => '0');
		elsif (CLOCK'event and CLOCK = '1') then
			if (temp < 9) then
				temp <= temp + 1;
			else 
				temp <= "0000";
			end if;
		end if;	
	end process;	
end Behavioral;

