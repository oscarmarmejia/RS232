----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:43:19 PM
-- Design Name: 
-- Module Name: Div_5207 - Behavioral
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
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;  
entity div_5207 is
	port(
	RST : in std_logic;
	CLK : in std_logic;
	B   : out std_logic 
	);
end div_5207;
Architecture Interna of div_5207 is
Signal Qn, Qp : Std_logic_vector(13 downto 0); --Estados internos
Begin
	Combinational : process (Qp)
	Begin
		if (Qp="00000000000000") then
			B <= '1';
			Qn<="00000001100100";--Qn <= "00000000110010";	 --	5207(1010001010111)
		else
			B <= '0';
			Qn <= Qp - 1;
		end if;
	end process Combinational;
	Secuencial: process (RST,CLK)
	Begin
		if (RST='0') then
			Qp <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			Qp <= Qn;
		end if;
	end process Secuencial;
end Interna;