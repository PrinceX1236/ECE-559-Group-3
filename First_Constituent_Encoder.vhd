library ieee;
use ieee.std_logic_1164.all;

ENTITY First_Consitituent_Encoder IS
PORT(
	clock : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	cin	: IN STD_LOGIC;
	switch_ctrl: IN STD_LOGIC;
	x_k  : OUT STD_LOGIC;
	z_k  : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE behavior OF First_Consitituent_Encoder IS
-- SIGNAL DECLARATIONS --
SIGNAL reg_enable: STD_LOGIC;

-- COMPONENT DECLARATIONS --
COMPONENT encoder_module
	PORT(
		clock : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		cin	: IN STD_LOGIC;
		xout  : OUT STD_LOGIC;
		zout  : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT shiftreg
	PORT(
		clock		: IN STD_LOGIC ;
		enable		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		shiftin		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	SHIFTREG_ARRAY: FOR i IN 1 DOWNTO 0 GENERATE
	SHIFTREG_i : shiftreg PORT MAP(
		clock => clock,
		enable => reg_enable,
		sclr => reset,
		shiftin		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (2 DOWNTO 0) );
	END GENERATE SHIFTREG_ARRAY;

END behavior;