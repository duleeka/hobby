
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universal_shift_reg_nbit is
    generic (n : natural := 8);
    Port ( CLOCK : in  STD_LOGIC;
           LIN : in STD_LOGIC;          -- Left in.
			  RIN : in  STD_LOGIC;         -- Right in.
           RESET : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0); -- Function
           DATA : in  STD_LOGIC_VECTOR (n - 1 downto 0); -- External input
           Q : out  STD_LOGIC_VECTOR (n - 1 downto 0)); -- Output
end universal_shift_reg_nbit;

architecture Behavioral of universal_shift_reg_nbit is
	signal reg : std_logic_vector (n -1 downto 0);
begin
	Q <= reg;
	process (CLOCK, RESET)
	begin
		if (RESET = '0') then
			reg <= (others => '0');
		elsif (CLOCK'event and CLOCK = '1') then
			if (S = "00") then    -- Hold data.
				reg <= reg;
			elsif (S = "01") then -- Shift right.
				reg <= LIN & reg ((n - 1) downto 1);
			elsif (S = "10") then -- Shift left.
				reg <= reg ((n - 2) downto 0) & RIN;
			elsif (S = "11") then -- Load data.
				reg <= DATA;
			end if;
		end if;
	end process;

end Behavioral;

