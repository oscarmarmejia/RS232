----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:27:20 AM
-- Design Name: 
-- Module Name: FMS_inicio - Behavioral
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



entity FSM_inicio is
	 port(
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 RxD : in STD_LOGIC;
		 STP : in STD_LOGIC;
		 STR : out STD_LOGIC
	     );
end FSM_inicio;

architecture FSM_inicio of FSM_inicio is
signal Qp,Qn: std_logic;
begin									  
	
	combinacional: process(Qp,RxD,STP)
	begin
		case Qp is 
			when '0' 	=>	if RxD = '1' then 
								Qn <= Qp;
							else 
								Qn <= '1';
							end if;
							STR <= '0';
			when others	=>	if STP = '0' then 
								Qn <= Qp;
							else 
								Qn <= '0';
							end if;		
							STR <= '1';	
		end case;
	end process combinacional;
	
	FF: process(CLK,RST)
	begin
		if RST='0' then
			Qp <= '0';
		elsif CLK'event and CLK='1' then
			Qp <= Qn;
		end if;
	end process FF;
	

		 

end FSM_inicio;