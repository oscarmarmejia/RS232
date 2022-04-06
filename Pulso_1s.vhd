----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:42:18 PM
-- Design Name: 
-- Module Name: Pulso_1s - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Pulso is
	port(
	   RST : in std_logic;
	   CLK : in std_logic;
	   ENA : in std_logic; 	   
	   STT: out std_logic
	);
end Pulso;
architecture Pulso of Pulso is
signal s1, s2 , s3, s4: std_logic_vector(25 downto 0);
signal s5,s6: std_logic;
begin
	s4<="01011111010111100000111111";--s4<="00000001111010000100011111";--s4<="01011111010111100000111111";
	Decrementator:process(s1)
	begin
	s2 <= s1-1;
    end process Decrementator;
Enable:process(s5, ENA)
begin
	s6 <=(not ENA) or s5;
end process Enable;
Multiplexer: process(s2, s4, s6)
begin
	if(s6 ='0') then
		s3 <= s2;
	else
		s3 <= s4;
	end if;
	end process Multiplexer;
	Register_TB:process(clk,rst,s4,s3)
	begin
		if(rst ='0') then
			s1 <= s4;
			elsif(clk'event and clk ='1') then
			s1 <= s3;	
		end if;
	end process Register_TB;
	Comparator: process(s1)
	begin
		if(s1 ="00000000000000000000000000")then
			s5 <= '1';
			STT <= '1';
		else
			s5 <= '0';
			STT <= '0';
		end if;
	end process Comparator;
end Pulso;
