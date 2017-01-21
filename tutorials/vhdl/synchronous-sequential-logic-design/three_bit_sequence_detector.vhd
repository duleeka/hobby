
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_bit_sequence_detector is
    Port ( X : in  STD_LOGIC;                       -- Serial input.
           CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0);  -- State
           Z : out  STD_LOGIC);                     -- Sequence detector output.
end three_bit_sequence_detector;

architecture Behavioral of three_bit_sequence_detector is
	type state_type is (S0, S1, S2);
	signal P_S, N_S : state_type;
begin
	sync_proc: process (CLOCK, RESET)
	begin
		if (RESET = '1') then
			P_S <= S0;
		elsif (rising_edge(CLOCK)) then
			P_S <= N_S;		
		end if; 
	end process sync_proc;
	
	comb_proc: process (P_S, X)
	begin
		case P_S is
			when S0 =>
				Z <= '0';
				if (X = '0') then
					N_S <= S0;
				else
					N_S <= S1;
				end if;
			when S1 =>
				Z <= '0';
				if (X = '0') then
					N_S <= S0;
				else
					N_S <= S2;
				end if;
			when S2 =>
					if (X = '0') then
						Z <= '0';
						N_S <= S0;
					else
						Z <= '1';
						N_S <= S2;
					end if;
			when others =>
				Z <= '0';
				N_S <= S0;
		end case;
	end process comb_proc;

with P_S select
	S <= "00" when S0,
		  "01" when S1,
		  "11" when S2,
		  "00" when others;

end Behavioral;	

