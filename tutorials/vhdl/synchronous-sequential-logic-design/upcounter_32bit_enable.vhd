library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity upcounter_32bit_enable is
    Port ( RESET : in  STD_LOGIC;
           CLOCK : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (31 downto 0));
end upcounter_32bit_enable;

architecture Behavioral of upcounter_32bit_enable is
	signal count : unsigned (31 downto 0);
begin	
	process (RESET, CLOCK)
	begin
		if (RESET = '1') then
			count <= X"00000000";
		elsif (CLOCK'event and CLOCK = '1') then
			if (enable = '1') then
				count <= count + 1;
			end if;
		end if;
	end process;
	
	Q <= std_logic_vector(count);
end Behavioral;

