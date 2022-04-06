----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:19:15 AM
-- Design Name: 
-- Module Name: Top_RxD - Behavioral
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



entity Top_RxD is
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RxD : in STD_LOGIC;
		 RxDREG : out STD_LOGIC_VECTOR(7 downto 0);
		 DataRDY : out STD_LOGIC
	     );
end Top_RxD;									 

architecture simple of Top_RxD is

component FSM_inicio 
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RxD : in STD_LOGIC;
		 STP : in STD_LOGIC;
		 STR : out STD_LOGIC
	     );
end component;

component contadorMODULO50
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 EN : in STD_LOGIC;
		 TB : out STD_LOGIC
	     );
end component;	   

component FSM_RxD
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 SYNC : in STD_LOGIC;
		 LDR : out STD_LOGIC;
		 SHR : out STD_LOGIC
	     );		 	
end component;	

component  registro_dsp
	 port(
		 RST : in STD_LOGIC; 
		 CLK: in STD_LOGIC;		 
		 D : in STD_LOGIC;
		 Desplaza : in STD_LOGIC;
		 Q : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end component;

component Latch 
	 port(
		 RST : in STD_LOGIC;		 
		 CLK : in STD_LOGIC;			
		 LE: in STD_LOGIC;
		 D : in STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : out STD_LOGIC_VECTOR(7 DOWNTO 0)
	     );
end component;

signal LDR,SHR,SYNC,STR: std_logic;
signal REG: std_logic_vector(7 downto 0);

begin	   		
	DataRDY <= LDR;
	FSM_control:         FSM_RxD port map(RST,CLK,SYNC,LDR,SHR);
	FSM_bit_inicio:      FSM_inicio port map(RST,CLK,RxD,LDR,STR);
	Counter:             ContadorMODULO50 port map(RST,CLK,STR,SYNC);
	REG_corrimiento:     registro_dsp port map(RST,CLK,RxD,SHR,REG);
	Candado:             Latch port map(RST,CLK,LDR,REG,RxDREG);
end simple;