library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore_fsm is
    Port ( CLOCK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           TDI : in  STD_LOGIC;
           RST : out  STD_LOGIC;
           SHIFT : out  STD_LOGIC);
end moore_fsm;

architecture Behavioral of moore_fsm is
	type STATES is (Reset, BIST, Result, NOP);
	signal CS: States;
begin
	SYNC: process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '0') then
			if (EN = '1') then
				if (CS = Reset) then
					if (TDI = '0') then
						CS <= BIST;
					end if;
				elsif (CS = BIST) then
					if (TDI = '1') then
						CS <= Result;
					end if;
				elsif (CS = Result) then
					if (TDI = '1') then
						CS <= NOP;
					end if;							
				elsif (CS = NOP) then
					if (TDI = '0') then
						CS <= BIST;
					else
						CS <= Reset;
					end if;
				end if;
			end if;
		end if;
	end process SYNC;

	COMB: process (CS) 
	begin
		 if (CS = Reset) then
			RST <= '1';
			SHIFT <= '0';
		elsif (CS = Result) then
		   RST <= '0';
			SHIFT <= '1';
		else 
			RST <= '0';
			SHIFT <= '0';
		end if;
	end process COMB;

end Behavioral;

