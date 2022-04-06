----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 01:45:32 PM
-- Design Name: 
-- Module Name: Mux - Behavioral
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
Entity MUX_salida is
	port(
	M  : in std_logic_vector(3 downto 0);
	D  : in std_logic_vector(7 downto 0); 
	Tx : out std_logic
	);
end MUX_salida;
Architecture Selection of MUX_salida is
begin
	process(M,D)
	begin
		case M is
			when "0000" => Tx <= '0';  --Inicio
			when "0001" => Tx <= D(0); --Dato 1
			when "0010" => Tx <= D(1); --Dato 2
			when "0011" => Tx <= D(2); --Dato 3
			when "0100" => Tx <= D(3); --Dato 4
			when "0101" => Tx <= D(4); --Dato 5
			when "0110" => Tx <= D(5); --Dato 6
			when "0111" => Tx <= D(6); --Dato 7
			when "1000" => Tx <= D(7); --Dato 8	
			when others => Tx <= '1';  --Fin
		end case;
	end process;
end Selection;