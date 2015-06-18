-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "06/15/2015 00:56:40"
                                                            
-- Vhdl Test Bench template for design  :  MIPS
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MIPS_vhd_tst IS
END MIPS_vhd_tst;

ARCHITECTURE MIPS_arch OF MIPS_vhd_tst IS
	-- constants                                                 
	-- signals                                                   
	SIGNAL clk : STD_LOGIC;
	SIGNAL rst : STD_LOGIC;
	
	COMPONENT MIPS
		PORT (
			clk : IN STD_LOGIC;
			rst : IN STD_LOGIC
		);
	END COMPONENT;
	
BEGIN
	i1 : MIPS PORT MAP (
		-- list connections between master ports and signals
		clk => clk,
		rst => rst
	);

	rst <= 	'1',
				'0' after 20 ns;
	
	init : PROCESS                                    
	BEGIN                                                        
		clk <= '1', '0' AFTER 5 ns;
		WAIT FOR 10 ns;                                                      
	END PROCESS init;
	
END MIPS_arch;
