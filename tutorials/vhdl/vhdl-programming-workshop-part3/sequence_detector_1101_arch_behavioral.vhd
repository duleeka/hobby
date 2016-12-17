library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequence_detector_1101 is
    Port ( CLK : in  STD_LOGIC;
           X : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
			  S : out STD_LOGIC_VECTOR(1 downto 0);
           Z : out  STD_LOGIC);
end sequence_detector_1101;

architecture Behavioral of sequence_detector_1101 is
	Type States is (S0, S1, S2, S3);
	Signal PS, NS : States;
begin
	process (CLK, CLEAR)
	begin
		if (CLEAR = '1') then
			PS <= S0;
		elsif (CLK'event and CLK = '1') then
			PS <= NS;
		end if;
	end process;
	
	process (PS, X)
	begin
		case PS is
			when S0 =>
				S <= "00";
				if (X = '0') then
					NS <= S0;
				else
					NS <= S1;
				end if;
			when S1 =>
				S <= "01";
				if (X = '0') then
					NS <= S0;
				else	
					NS <= S2;
				end if;
			when S2 =>
				S <= "10";
				if (X = '0') then
					NS <= S3;
				else 
					NS <= S2;
				end if;
			when S3 =>
				S <= "11";
				if (X = '0') then
					NS <= S0;
				else 
					NS <= S1;
				end if;	
			when others =>
				S <= "00";			
				NS <= S0;
			end case;
	end process;

	process (PS, X)
	begin
		case PS is
			when S0 =>
				Z <= '0';
			when S1 =>
				Z <= '0';
			when S2 =>
				Z <= '0';
			when S3 =>
				if (X = '1') then
					Z <= '1';
				else 
					Z <= '0';
				end if;
			when others =>
				Z <= '0';
		end case;
	end process;
end Behavioral;

