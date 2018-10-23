-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/22/2018 19:05:42"
                                                            
-- Vhdl Test Bench template for design  :  turbo_encoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;                               

ENTITY turbo_encoder_vhd_tst IS
END turbo_encoder_vhd_tst;
ARCHITECTURE turbo_encoder_arch OF turbo_encoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cin : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL d0 : STD_LOGIC;
SIGNAL d1 : STD_LOGIC;
SIGNAL d2 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;

--shared variable simend : boolean := false;

COMPONENT turbo_encoder
	PORT (
	cin : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	d0 : OUT STD_LOGIC;
	d1 : OUT STD_LOGIC;
	d2 : OUT STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : turbo_encoder
	PORT MAP (
-- list connections between master ports and signals
	cin => cin,
	clock => clock,
	d0 => d0,
	d1 => d1,
	d2 => d2,
	reset => reset
	);

init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once
    reset <= '1';
    cin <= '0';
    wait for 50 ns;
    reset <= '0';
    cin <= '0';
    wait for 50 ns;
    cin <= '1';
    wait for 50 ns;
    cin <= '1';
    --simend := true;
WAIT;                                                       
END PROCESS init;

always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations 
BEGIN                                                         
	--if simend = false then        -- code executes for every event on sensitivity list
		clock <= '0';
		wait for 25 ns;
		clock <= '1';
		wait for 25 ns;
	--else	  	  
		--WAIT;
	--end if;                                                        
END PROCESS always;                                          
END turbo_encoder_arch;
