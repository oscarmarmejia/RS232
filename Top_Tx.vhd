----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:22:47 AM
-- Design Name: 
-- Module Name: Top_Tx - Behavioral
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
Entity Transmisor is					 
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	EN  : in  std_logic;
	--SST : in  std_logic;   --Activa para enviar cada 500 mseg el dato
	EOT : out std_logic;
	D   : in  std_logic_vector(7 downto 0);
	Tx  : out std_logic;	
	LED : out std_logic
	);
end Transmisor;	 
Architecture Bloques of Transmisor is	
-----------------------------------------------------------------------------------------------------
 component Led_1s is
	port(
	   RST : in std_logic;
	   CLK : in std_logic;
	   ENA : in std_logic; 	   
	   LED: out std_logic
	);
end component;
------------------------------------------------------------------------------------------------------
component Pulso is
	port(
	   RST : in std_logic;
	   CLK : in std_logic;
	   ENA : in std_logic; 	   
	   STT: out std_logic
	);
end component;
------------------------------------------------------------------------------------------------------
Component Maq_FSM 		--Components declaration
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	B   : in  std_logic;
	STT : in  std_logic;
	EOT : out std_logic;
	M   : out std_logic_vector(3 downto 0)
	);
end Component;
-----------------------------------------------------------------------------------------------------
Component div_5207
	port(
	RST : in std_logic;
	CLK : in std_logic;
	B   : out std_logic
	);
end Component;
---------------------------------------------------------------------------------------------------------
Component MUX_salida 
	port(
	M  : in  std_logic_vector(3 downto 0); 
	D  : in  std_logic_vector(7 downto 0); 
	--P  : in  std_logic;
	Tx : out std_logic 
	);
end Component; 					 
----------------------------------------------------------------------------------------------------------
signal M   : std_logic_vector(3 downto 0);	       --Signals
signal B,STT : std_logic;
begin
	LD : Led_1s     port map (RST,CLK,EN,LED);
	M0 : Pulso      port map (RST,CLK,EN,STT);
	M1 : Maq_FSM    port map (RST,CLK,B,STT,EOT,M); --Pulso por SST
	M2 : DIV_5207   port map (RST,CLK,B);
	M3 : MUX_salida port map (M,D,Tx);
end Bloques;
