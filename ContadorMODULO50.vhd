----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:31:26 AM
-- Design Name: 
-- Module Name: ContadorMODULO50 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;

entity contadorMODULO50 is
	 port(
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 EN : in STD_LOGIC;
		 TB : out STD_LOGIC
	     );
end contadorMODULO50;

--}} End of automatically maintained section

architecture contador of contadorMODULO50 is   
signal Qp,Qn: std_logic_vector(11 downto 0);
signal SEL: std_logic_vector(1 downto 0);
signal FIN: std_logic;
begin									 
	SEL <= FIN & EN;   
	TB <= FIN;
	
	Mux: process(Qp, SEL)
	begin
		case SEL is 
			when "00" 	=> Qn <= Qp;
			when "01"	=> Qn <= Qp+1;
			when others => Qn <= (others=>'0');
		end case;
	end process Mux;						   
	
	COMPARADOR: process (Qp)
	begin
		if Qp= "000000110010" then -- 50
			FIN <= '1';
		else
			FIN <= '0';
		end if;
	end process COMPARADOR;
	
	FF: process(CLK,RST)
	begin
		if RST='0' then
			Qp <= (others=>'0');
		elsif CLK'event and CLK='1' then
			Qp <= Qn;
		end if;
	end process FF;
end contador;

