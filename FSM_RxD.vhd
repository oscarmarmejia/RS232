----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:29:03 AM
-- Design Name: 
-- Module Name: FSM_RxD - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity FSM_RxD is
	 port(
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 SYNC : in STD_LOGIC;
		 LDR : out STD_LOGIC;
		 SHR : out STD_LOGIC
	     );
end FSM_RxD;

--}} End of automatically maintained section

architecture FSM_RxD of FSM_RxD is

signal Qp,Qn: std_logic_vector(4 downto 0);

begin
	COMBINACIONAL: process(Qp,SYNC)
	begin
		case Qp is
			when "00000" => if SYNC = '1' then	-- Bit de inicio
								Qn <= "00001";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "00001" => if SYNC = '1' then	
								Qn <= "00010";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "00010" => if SYNC = '1' then	
								Qn <= "00011";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "00011" => Qn <= "00100";			--Bit 0							
							SHR <= '1';
							LDR <= '0';	   
							
			when "00100" => if SYNC = '1' then	
								Qn <= "00101";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "00101" => if SYNC = '1' then	
								Qn <= "00110";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "00110" => Qn <= "00111";			--Bit 1							
							SHR <= '1';
							LDR <= '0';	   
			when "00111" => if SYNC = '1' then	
								Qn <= "01000";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "01000" => if SYNC = '1' then	
								Qn <= "01001";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "01001" => Qn <= "01010";			--Bit 2
							SHR <= '1';
							LDR <= '0';	   							
			when "01010" => if SYNC = '1' then	
								Qn <= "01011";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "01011" => if SYNC = '1' then	
								Qn <= "01100";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "01100" => Qn <= "01101";			--Bit 3 
							SHR <= '1';
							LDR <= '0';	   
			when "01101" => if SYNC = '1' then	
								Qn <= "01110";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "01110" => if SYNC = '1' then	
								Qn <= "01111";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "01111" => Qn <= "10000";			--Bit 4							
							SHR <= '1';
							LDR <= '0';	   
			when "10000" => if SYNC = '1' then	
								Qn <= "10001";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "10001" => if SYNC = '1' then	
								Qn <= "10010";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "10010" => Qn <= "10011";			--Bit 5
							SHR <= '1';
							LDR <= '0';	   
			when "10011" => if SYNC = '1' then	
								Qn <= "10100";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "10100" => if SYNC = '1' then	
								Qn <= "10101";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "10101" => Qn <= "10110";			--Bit 6
							SHR <= '1';
							LDR <= '0';	   							
			when "10110" => if SYNC = '1' then	
								Qn <= "10111";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "10111" => if SYNC = '1' then	
								Qn <= "11000";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';				
			when "11000" => Qn <= "11001";			--Bit 7
							SHR <= '1';					   			
							LDR <= '0';	   				   
			when "11001" => if SYNC = '1' then	
								Qn <= "11010";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';
			when "11010" => if SYNC = '1' then	
								Qn <= "11011";
							else
								Qn <= Qp;
							end if;
							SHR <= '0';
							LDR <= '0';								
			when others  => Qn <= "00000";			-- Fin recepcion
							SHR <= '0';					   			
							LDR <= '1';	
		end case;
	end process COMBINACIONAL;

							
			
	FF: process(CLK,RST)
	begin
		if RST='0' then
			Qp <= (others=>'0');
		elsif CLK'event and CLK='1' then
			Qp <= Qn;
		end if;
	end process FF;

end FSM_RxD;
