----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:45:26 AM
-- Design Name: 
-- Module Name: registro_dsp - Behavioral
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



entity registro_dsp is
	 port(
		 CLK : in STD_LOGIC; 
		 RST: in STD_LOGIC;	
		 D : in STD_LOGIC;
		 Desplaza : in STD_LOGIC;
		 Q : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end registro_dsp;

--}} End of automatically maintained section

architecture desplazamiento of registro_dsp is
signal Qp,Qn: std_logic_vector(7 downto 0);
begin					   					  
	Q<=Qp;
	rotar: process (Desplaza, D, Qp)
	begin			  
		if Desplaza = '1' then 
			Qn <= D & Qp(7 downto 1) ;
		else 
			Qn <= Qp;
		end if;			
	end process rotar;
	
	secuencial: process(RST,CLK,Desplaza)
	begin
	if RST='0' then  
		Qp <= (others=>'0');		
	elsif CLK'event AND CLK='1' then
		Qp <= Qn;
	end if;		
	end process secuencial;	

end desplazamiento;
