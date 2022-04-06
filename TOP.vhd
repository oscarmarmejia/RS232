----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2022 11:13:26 AM
-- Design Name: 
-- Module Name: TOP - Behavioral
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
Entity RS232 is					 
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	EN  : in  std_logic;
	EOT : out std_logic;
	D   : in  std_logic_vector(7 downto 0);
	Tx  : out std_logic;	
	LED : out std_logic;
	----------------------------
	
		
		 RxD : in STD_LOGIC;
		 RxDREG : out STD_LOGIC_VECTOR(7 downto 0);
		 DataRDY : out STD_LOGIC
	     
	);
end RS232;

Architecture Principal of RS232 is
------------------------------------------------------------------------------------------------------------------------
component Transmisor is					 
	port(
	RST : in  std_logic;
	CLK : in  std_logic;
	EN  : in  std_logic;  
	EOT : out std_logic;
	D   : in  std_logic_vector(7 downto 0);
	Tx  : out std_logic;	
	LED : out std_logic
	);
end component;
---------------------------------------------------------------------------------------------------------------------------
component Top_RxD is
	 port(
		 RST : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RxD : in STD_LOGIC;
		 RxDREG : out STD_LOGIC_VECTOR(7 downto 0);
		 DataRDY : out STD_LOGIC
	     );
end component;
---------------------------------------------------------------------------------------------------------------------------
  
begin	   			
	Transmisor_Tx:        Transmisor port map(RST,CLK,EN,EOT,D,Tx,LED);
	Receptor_Rx:          Top_RxD    port map(RST,CLK,RxD,RxDREG,DataRDY);
end Principal;
