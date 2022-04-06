----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:49:02 PM
-- Design Name: 
-- Module Name: Maq_FSM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


 Library IEEE;
use IEEE.std_logic_1164.all;
Entity Maq_FSM is
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	B   : in  std_logic;
	STT : in  std_logic;
	EOT : out std_logic;
	M   : out std_logic_vector(3 downto 0)
	);
end Maq_FSM;
Architecture Control of Maq_FSM is
signal Qp, Qn : std_logic_vector(3 downto 0);	 
begin
	Combinacional : process(Qp,STT,B)
	begin 
		case Qp is
			when "0000" =>
				if (STT='0') then			  
					Qn <= Qp;
				else
					Qn <= "0001";
				end if;
				EOT <= '1';
				M   <= "1111";
			when "0001" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0010";
				end if;
				EOT <= '0';
				M <= "1111";
			when "0010" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0011";
				end if;
				EOT <= '0';
				M <= "0000";
			when "0011" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0100";
				end if;
				EOT <= '0';
				M <= "0001";
			when "0100" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0101";
				end if;
				EOT <= '0';
				M <= "0010";
			when "0101" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0110";
				end if;
				EOT <= '0';
				M <= "0011";
			when "0110" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "0111";
				end if;
				EOT <= '0';
				M <= "0100";
			when "0111" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "1000";
				end if;
				EOT <= '0';
				M <= "0101";
			when "1000" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "1001";
				end if;
				EOT <= '0';
				M <= "0110";
			when "1001" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "1010";
				end if;
				EOT <= '0';
				M <= "0111";
			when "1010" =>
				if (B='0') then			  
					Qn <= Qp;
				else
					Qn <= "1011";
				end if;
				EOT <= '0';
				M <= "1000";
			--when "1011" =>
			when others =>
			if (B='0') then			  
					Qn <= Qp;
				else
					Qn<="0000";--Qn <= "0000";
				end if;
				EOT <= '0';
				M <= "1001";
			--when others =>
--			Qn  <= "0000";
--			EOT <= '0';
--			M   <= "1111";
		end case;
	end process Combinacional;
Secuencial: process (RST,CLK)
begin
	if (RST = '0') then
		Qp <= (others => '0');
	elsif (CLK'event and CLK = '0') then
		Qp <= Qn;
	end if;
end process Secuencial;
end Control;
