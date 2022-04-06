----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:33:55 AM
-- Design Name: 
-- Module Name: Latch_Register - Behavioral
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

entity Latch is
	 port(
		 CLK : in STD_LOGIC;		 
		 RST : in STD_LOGIC;			
		 LE: in STD_LOGIC;
		 D : in STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	     );
end Latch;


architecture Registro of Latch is  
signal Qp,Qn: std_logic_vector(7 downto 0);
begin		  
	Q <= Qp;	
	
	Mux: process(Qp,LE) begin
	if LE = '1' then Qn <= D;
	else Qn<=Qp; end if;
	end process Mux;		 
	
	FF: process (CLK, RST)	begin
		if RST = '0' then 	Qp<= (others=>'0');			
		elsif CLK'event and CLK ='1'and LE='1' then 
			Qp<= Qn; end if;
	end process FF;
	
end Registro;
