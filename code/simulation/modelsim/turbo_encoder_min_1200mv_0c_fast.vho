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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "10/23/2018 12:40:55"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	turbo_encoder IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	cin : IN std_logic;
	d0 : OUT std_logic;
	d1 : OUT std_logic;
	d2 : OUT std_logic
	);
END turbo_encoder;

-- Design Ports Information
-- d0	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d1	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d2	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF turbo_encoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_cin : std_logic;
SIGNAL ww_d0 : std_logic;
SIGNAL ww_d1 : std_logic;
SIGNAL ww_d2 : std_logic;
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \d0~output_o\ : std_logic;
SIGNAL \d1~output_o\ : std_logic;
SIGNAL \d2~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter[0]~13_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \counter[1]~16\ : std_logic;
SIGNAL \counter[2]~17_combout\ : std_logic;
SIGNAL \counter[2]~18\ : std_logic;
SIGNAL \counter[3]~19_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \counter[3]~20\ : std_logic;
SIGNAL \counter[4]~21_combout\ : std_logic;
SIGNAL \counter[4]~22\ : std_logic;
SIGNAL \counter[5]~24_combout\ : std_logic;
SIGNAL \counter[5]~25\ : std_logic;
SIGNAL \counter[6]~26_combout\ : std_logic;
SIGNAL \counter[6]~27\ : std_logic;
SIGNAL \counter[7]~28_combout\ : std_logic;
SIGNAL \counter[7]~29\ : std_logic;
SIGNAL \counter[8]~30_combout\ : std_logic;
SIGNAL \counter[8]~31\ : std_logic;
SIGNAL \counter[9]~32_combout\ : std_logic;
SIGNAL \counter[9]~33\ : std_logic;
SIGNAL \counter[10]~34_combout\ : std_logic;
SIGNAL \counter[10]~35\ : std_logic;
SIGNAL \counter[11]~36_combout\ : std_logic;
SIGNAL \counter[11]~37\ : std_logic;
SIGNAL \counter[12]~38_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \counter[8]~23_combout\ : std_logic;
SIGNAL \counter[0]~14\ : std_logic;
SIGNAL \counter[1]~15_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \Equal2~2_combout\ : std_logic;
SIGNAL \Equal2~3_combout\ : std_logic;
SIGNAL \d0~0_combout\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\ : std_logic;
SIGNAL \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]~3_combout\ : std_logic;
SIGNAL \encoder_module0|qout~combout\ : std_logic;
SIGNAL \x~0_combout\ : std_logic;
SIGNAL \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]~4_combout\ : std_logic;
SIGNAL \sft1|LPM_SHIFTREG_component|dffs[2]~2_combout\ : std_logic;
SIGNAL \sft1|LPM_SHIFTREG_component|dffs[1]~0_combout\ : std_logic;
SIGNAL \d0~1_combout\ : std_logic;
SIGNAL \sft0|LPM_SHIFTREG_component|dffs[2]~1_combout\ : std_logic;
SIGNAL \sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\ : std_logic;
SIGNAL \sft0|LPM_SHIFTREG_component|dffs[0]~0_combout\ : std_logic;
SIGNAL \d0~2_combout\ : std_logic;
SIGNAL \sft3|LPM_SHIFTREG_component|dffs[2]~1_combout\ : std_logic;
SIGNAL \sft3|LPM_SHIFTREG_component|dffs[1]~2_combout\ : std_logic;
SIGNAL \sft3|LPM_SHIFTREG_component|dffs[0]~0_combout\ : std_logic;
SIGNAL \d0~3_combout\ : std_logic;
SIGNAL \encoder_module0|zout~0_combout\ : std_logic;
SIGNAL \sft1|LPM_SHIFTREG_component|dffs[0]~1_combout\ : std_logic;
SIGNAL \d1~0_combout\ : std_logic;
SIGNAL \d1~1_combout\ : std_logic;
SIGNAL \d1~2_combout\ : std_logic;
SIGNAL \d2~0_combout\ : std_logic;
SIGNAL \d2~1_combout\ : std_logic;
SIGNAL counter : std_logic_vector(12 DOWNTO 0);
SIGNAL \sft1|LPM_SHIFTREG_component|dffs\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \sft3|LPM_SHIFTREG_component|dffs\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \sft0|LPM_SHIFTREG_component|dffs\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_clock~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_cin <= cin;
d0 <= ww_d0;
d1 <= ww_d1;
d2 <= ww_d2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_clock~inputclkctrl_outclk\ <= NOT \clock~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X1_Y0_N9
\d0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d0~3_combout\,
	devoe => ww_devoe,
	o => \d0~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\d1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d1~2_combout\,
	devoe => ww_devoe,
	o => \d1~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\d2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d2~1_combout\,
	devoe => ww_devoe,
	o => \d2~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: LCCOMB_X5_Y3_N0
\counter[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[0]~13_combout\ = counter(0) $ (VCC)
-- \counter[0]~14\ = CARRY(counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => counter(0),
	datad => VCC,
	combout => \counter[0]~13_combout\,
	cout => \counter[0]~14\);

-- Location: IOIBUF_X0_Y4_N22
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X5_Y3_N2
\counter[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[1]~15_combout\ = (counter(1) & (!\counter[0]~14\)) # (!counter(1) & ((\counter[0]~14\) # (GND)))
-- \counter[1]~16\ = CARRY((!\counter[0]~14\) # (!counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(1),
	datad => VCC,
	cin => \counter[0]~14\,
	combout => \counter[1]~15_combout\,
	cout => \counter[1]~16\);

-- Location: LCCOMB_X5_Y3_N4
\counter[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[2]~17_combout\ = (counter(2) & (\counter[1]~16\ $ (GND))) # (!counter(2) & (!\counter[1]~16\ & VCC))
-- \counter[2]~18\ = CARRY((counter(2) & !\counter[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(2),
	datad => VCC,
	cin => \counter[1]~16\,
	combout => \counter[2]~17_combout\,
	cout => \counter[2]~18\);

-- Location: FF_X5_Y3_N5
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[2]~17_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LCCOMB_X5_Y3_N6
\counter[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[3]~19_combout\ = (counter(3) & (!\counter[2]~18\)) # (!counter(3) & ((\counter[2]~18\) # (GND)))
-- \counter[3]~20\ = CARRY((!\counter[2]~18\) # (!counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(3),
	datad => VCC,
	cin => \counter[2]~18\,
	combout => \counter[3]~19_combout\,
	cout => \counter[3]~20\);

-- Location: FF_X5_Y3_N7
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[3]~19_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LCCOMB_X4_Y3_N4
\Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (counter(3) & !counter(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datad => counter(1),
	combout => \Equal3~1_combout\);

-- Location: LCCOMB_X5_Y3_N8
\counter[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[4]~21_combout\ = (counter(4) & (\counter[3]~20\ $ (GND))) # (!counter(4) & (!\counter[3]~20\ & VCC))
-- \counter[4]~22\ = CARRY((counter(4) & !\counter[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(4),
	datad => VCC,
	cin => \counter[3]~20\,
	combout => \counter[4]~21_combout\,
	cout => \counter[4]~22\);

-- Location: FF_X5_Y3_N9
\counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[4]~21_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(4));

-- Location: LCCOMB_X5_Y3_N10
\counter[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[5]~24_combout\ = (counter(5) & (!\counter[4]~22\)) # (!counter(5) & ((\counter[4]~22\) # (GND)))
-- \counter[5]~25\ = CARRY((!\counter[4]~22\) # (!counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(5),
	datad => VCC,
	cin => \counter[4]~22\,
	combout => \counter[5]~24_combout\,
	cout => \counter[5]~25\);

-- Location: FF_X5_Y3_N11
\counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[5]~24_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(5));

-- Location: LCCOMB_X5_Y3_N12
\counter[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[6]~26_combout\ = (counter(6) & (\counter[5]~25\ $ (GND))) # (!counter(6) & (!\counter[5]~25\ & VCC))
-- \counter[6]~27\ = CARRY((counter(6) & !\counter[5]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(6),
	datad => VCC,
	cin => \counter[5]~25\,
	combout => \counter[6]~26_combout\,
	cout => \counter[6]~27\);

-- Location: FF_X5_Y3_N13
\counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[6]~26_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(6));

-- Location: LCCOMB_X5_Y3_N14
\counter[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[7]~28_combout\ = (counter(7) & (!\counter[6]~27\)) # (!counter(7) & ((\counter[6]~27\) # (GND)))
-- \counter[7]~29\ = CARRY((!\counter[6]~27\) # (!counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(7),
	datad => VCC,
	cin => \counter[6]~27\,
	combout => \counter[7]~28_combout\,
	cout => \counter[7]~29\);

-- Location: FF_X5_Y3_N15
\counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[7]~28_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(7));

-- Location: LCCOMB_X5_Y3_N16
\counter[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[8]~30_combout\ = (counter(8) & (\counter[7]~29\ $ (GND))) # (!counter(8) & (!\counter[7]~29\ & VCC))
-- \counter[8]~31\ = CARRY((counter(8) & !\counter[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(8),
	datad => VCC,
	cin => \counter[7]~29\,
	combout => \counter[8]~30_combout\,
	cout => \counter[8]~31\);

-- Location: FF_X5_Y3_N17
\counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[8]~30_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(8));

-- Location: LCCOMB_X5_Y3_N18
\counter[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[9]~32_combout\ = (counter(9) & (!\counter[8]~31\)) # (!counter(9) & ((\counter[8]~31\) # (GND)))
-- \counter[9]~33\ = CARRY((!\counter[8]~31\) # (!counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(9),
	datad => VCC,
	cin => \counter[8]~31\,
	combout => \counter[9]~32_combout\,
	cout => \counter[9]~33\);

-- Location: FF_X5_Y3_N19
\counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[9]~32_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(9));

-- Location: LCCOMB_X5_Y3_N20
\counter[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[10]~34_combout\ = (counter(10) & (\counter[9]~33\ $ (GND))) # (!counter(10) & (!\counter[9]~33\ & VCC))
-- \counter[10]~35\ = CARRY((counter(10) & !\counter[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => counter(10),
	datad => VCC,
	cin => \counter[9]~33\,
	combout => \counter[10]~34_combout\,
	cout => \counter[10]~35\);

-- Location: FF_X5_Y3_N21
\counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[10]~34_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(10));

-- Location: LCCOMB_X5_Y3_N22
\counter[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[11]~36_combout\ = (counter(11) & (!\counter[10]~35\)) # (!counter(11) & ((\counter[10]~35\) # (GND)))
-- \counter[11]~37\ = CARRY((!\counter[10]~35\) # (!counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => counter(11),
	datad => VCC,
	cin => \counter[10]~35\,
	combout => \counter[11]~36_combout\,
	cout => \counter[11]~37\);

-- Location: FF_X5_Y3_N23
\counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[11]~36_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(11));

-- Location: LCCOMB_X5_Y3_N24
\counter[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[12]~38_combout\ = \counter[11]~37\ $ (!counter(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => counter(12),
	cin => \counter[11]~37\,
	combout => \counter[12]~38_combout\);

-- Location: FF_X5_Y3_N25
\counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[12]~38_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(12));

-- Location: LCCOMB_X5_Y3_N30
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!counter(6) & (!counter(4) & (!counter(7) & !counter(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(6),
	datab => counter(4),
	datac => counter(7),
	datad => counter(5),
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X5_Y3_N28
\Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (!counter(11) & (!counter(9) & (!counter(10) & !counter(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(11),
	datab => counter(9),
	datac => counter(10),
	datad => counter(8),
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X5_Y3_N26
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!counter(2) & (!counter(12) & (\Equal2~0_combout\ & \Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(12),
	datac => \Equal2~0_combout\,
	datad => \Equal2~1_combout\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X4_Y3_N30
\counter[8]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter[8]~23_combout\ = (\reset~input_o\) # ((counter(0) & (\Equal3~1_combout\ & \LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => counter(0),
	datac => \Equal3~1_combout\,
	datad => \LessThan2~0_combout\,
	combout => \counter[8]~23_combout\);

-- Location: FF_X4_Y3_N9
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \counter[0]~13_combout\,
	sclr => \counter[8]~23_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: FF_X5_Y3_N3
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \counter[1]~15_combout\,
	sclr => \counter[8]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X4_Y3_N6
\Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!counter(1) & (\LessThan2~0_combout\ & (!counter(0) & counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(1),
	datab => \LessThan2~0_combout\,
	datac => counter(0),
	datad => counter(3),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X4_Y3_N8
\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (!counter(3) & (\LessThan2~0_combout\ & ((!counter(1)) # (!counter(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datab => \LessThan2~0_combout\,
	datac => counter(0),
	datad => counter(1),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X4_Y3_N28
\Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~2_combout\ = (!counter(3) & (counter(2) & counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datac => counter(2),
	datad => counter(1),
	combout => \Equal2~2_combout\);

-- Location: LCCOMB_X6_Y3_N24
\Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~3_combout\ = (\Equal2~2_combout\ & (\Equal2~1_combout\ & (\Equal2~0_combout\ & !counter(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~2_combout\,
	datab => \Equal2~1_combout\,
	datac => \Equal2~0_combout\,
	datad => counter(12),
	combout => \Equal2~3_combout\);

-- Location: LCCOMB_X3_Y3_N12
\d0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d0~0_combout\ = (\LessThan2~1_combout\) # ((\Equal3~0_combout\ & ((counter(0)) # (!\Equal2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => counter(0),
	datac => \LessThan2~1_combout\,
	datad => \Equal2~3_combout\,
	combout => \d0~0_combout\);

-- Location: IOIBUF_X3_Y0_N1
\cin~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

-- Location: LCCOMB_X4_Y3_N10
\LessThan2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (!counter(3) & ((!counter(1)) # (!counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(3),
	datac => counter(0),
	datad => counter(1),
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X4_Y3_N14
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\ = (!\reset~input_o\ & \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2),
	combout => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\);

-- Location: FF_X4_Y3_N15
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1));

-- Location: LCCOMB_X4_Y3_N12
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]~3_combout\ = (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datac => \reset~input_o\,
	combout => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]~3_combout\);

-- Location: FF_X4_Y3_N13
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0));

-- Location: LCCOMB_X4_Y3_N26
\encoder_module0|qout\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_module0|qout~combout\ = \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datad => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0),
	combout => \encoder_module0|qout~combout\);

-- Location: LCCOMB_X4_Y3_N20
\x~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \x~0_combout\ = (\LessThan2~2_combout\ & ((\LessThan2~0_combout\ & (\cin~input_o\)) # (!\LessThan2~0_combout\ & ((\encoder_module0|qout~combout\))))) # (!\LessThan2~2_combout\ & (((\encoder_module0|qout~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~2_combout\,
	datab => \cin~input_o\,
	datac => \encoder_module0|qout~combout\,
	datad => \LessThan2~0_combout\,
	combout => \x~0_combout\);

-- Location: LCCOMB_X4_Y3_N2
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]~4_combout\ = (!\reset~input_o\ & (\x~0_combout\ $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \x~0_combout\,
	datac => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datad => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0),
	combout => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]~4_combout\);

-- Location: FF_X4_Y3_N3
\encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2));

-- Location: LCCOMB_X4_Y3_N18
\sft1|LPM_SHIFTREG_component|dffs[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft1|LPM_SHIFTREG_component|dffs[2]~2_combout\ = (!\reset~input_o\ & (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2) $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) $ (\x~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2),
	datac => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datad => \x~0_combout\,
	combout => \sft1|LPM_SHIFTREG_component|dffs[2]~2_combout\);

-- Location: FF_X4_Y3_N19
\sft1|LPM_SHIFTREG_component|dffs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft1|LPM_SHIFTREG_component|dffs[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft1|LPM_SHIFTREG_component|dffs\(2));

-- Location: LCCOMB_X3_Y3_N6
\sft1|LPM_SHIFTREG_component|dffs[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft1|LPM_SHIFTREG_component|dffs[1]~0_combout\ = (!\reset~input_o\ & \sft1|LPM_SHIFTREG_component|dffs\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \sft1|LPM_SHIFTREG_component|dffs\(2),
	combout => \sft1|LPM_SHIFTREG_component|dffs[1]~0_combout\);

-- Location: FF_X3_Y3_N7
\sft1|LPM_SHIFTREG_component|dffs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft1|LPM_SHIFTREG_component|dffs[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft1|LPM_SHIFTREG_component|dffs\(1));

-- Location: LCCOMB_X4_Y3_N16
\d0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d0~1_combout\ = (\LessThan2~2_combout\ & (!\LessThan2~0_combout\ & ((counter(0)) # (!\Equal2~3_combout\)))) # (!\LessThan2~2_combout\ & ((counter(0)) # ((!\Equal2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~2_combout\,
	datab => counter(0),
	datac => \Equal2~3_combout\,
	datad => \LessThan2~0_combout\,
	combout => \d0~1_combout\);

-- Location: LCCOMB_X4_Y3_N24
\sft0|LPM_SHIFTREG_component|dffs[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft0|LPM_SHIFTREG_component|dffs[2]~1_combout\ = (!\reset~input_o\ & \x~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \x~0_combout\,
	combout => \sft0|LPM_SHIFTREG_component|dffs[2]~1_combout\);

-- Location: FF_X4_Y3_N25
\sft0|LPM_SHIFTREG_component|dffs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft0|LPM_SHIFTREG_component|dffs[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft0|LPM_SHIFTREG_component|dffs\(2));

-- Location: LCCOMB_X3_Y3_N16
\sft0|LPM_SHIFTREG_component|dffs[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\ = (!\reset~input_o\ & \sft0|LPM_SHIFTREG_component|dffs\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \sft0|LPM_SHIFTREG_component|dffs\(2),
	combout => \sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\);

-- Location: FF_X3_Y3_N17
\sft0|LPM_SHIFTREG_component|dffs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft0|LPM_SHIFTREG_component|dffs[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft0|LPM_SHIFTREG_component|dffs\(1));

-- Location: LCCOMB_X3_Y3_N8
\sft0|LPM_SHIFTREG_component|dffs[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft0|LPM_SHIFTREG_component|dffs[0]~0_combout\ = (!\reset~input_o\ & \sft0|LPM_SHIFTREG_component|dffs\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \sft0|LPM_SHIFTREG_component|dffs\(1),
	combout => \sft0|LPM_SHIFTREG_component|dffs[0]~0_combout\);

-- Location: FF_X3_Y3_N9
\sft0|LPM_SHIFTREG_component|dffs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft0|LPM_SHIFTREG_component|dffs[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft0|LPM_SHIFTREG_component|dffs\(0));

-- Location: LCCOMB_X3_Y3_N30
\d0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \d0~2_combout\ = (\d0~1_combout\ & ((\sft1|LPM_SHIFTREG_component|dffs\(1)) # ((\d0~0_combout\)))) # (!\d0~1_combout\ & (((\sft0|LPM_SHIFTREG_component|dffs\(0) & !\d0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sft1|LPM_SHIFTREG_component|dffs\(1),
	datab => \d0~1_combout\,
	datac => \sft0|LPM_SHIFTREG_component|dffs\(0),
	datad => \d0~0_combout\,
	combout => \d0~2_combout\);

-- Location: LCCOMB_X4_Y3_N22
\sft3|LPM_SHIFTREG_component|dffs[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft3|LPM_SHIFTREG_component|dffs[2]~1_combout\ = (!\reset~input_o\ & (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datad => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(0),
	combout => \sft3|LPM_SHIFTREG_component|dffs[2]~1_combout\);

-- Location: FF_X4_Y3_N23
\sft3|LPM_SHIFTREG_component|dffs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft3|LPM_SHIFTREG_component|dffs[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft3|LPM_SHIFTREG_component|dffs\(2));

-- Location: LCCOMB_X3_Y3_N4
\sft3|LPM_SHIFTREG_component|dffs[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft3|LPM_SHIFTREG_component|dffs[1]~2_combout\ = (!\reset~input_o\ & \sft3|LPM_SHIFTREG_component|dffs\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \sft3|LPM_SHIFTREG_component|dffs\(2),
	combout => \sft3|LPM_SHIFTREG_component|dffs[1]~2_combout\);

-- Location: FF_X3_Y3_N5
\sft3|LPM_SHIFTREG_component|dffs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft3|LPM_SHIFTREG_component|dffs[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft3|LPM_SHIFTREG_component|dffs\(1));

-- Location: LCCOMB_X3_Y3_N24
\sft3|LPM_SHIFTREG_component|dffs[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft3|LPM_SHIFTREG_component|dffs[0]~0_combout\ = (\sft3|LPM_SHIFTREG_component|dffs\(1) & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sft3|LPM_SHIFTREG_component|dffs\(1),
	datac => \reset~input_o\,
	combout => \sft3|LPM_SHIFTREG_component|dffs[0]~0_combout\);

-- Location: FF_X3_Y3_N25
\sft3|LPM_SHIFTREG_component|dffs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft3|LPM_SHIFTREG_component|dffs[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft3|LPM_SHIFTREG_component|dffs\(0));

-- Location: LCCOMB_X3_Y3_N26
\d0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \d0~3_combout\ = (\d0~0_combout\ & ((\d0~2_combout\ & ((\sft3|LPM_SHIFTREG_component|dffs\(0)))) # (!\d0~2_combout\ & (\cin~input_o\)))) # (!\d0~0_combout\ & (((\d0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d0~0_combout\,
	datab => \cin~input_o\,
	datac => \d0~2_combout\,
	datad => \sft3|LPM_SHIFTREG_component|dffs\(0),
	combout => \d0~3_combout\);

-- Location: LCCOMB_X4_Y3_N0
\encoder_module0|zout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_module0|zout~0_combout\ = \x~0_combout\ $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1) $ (\encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x~0_combout\,
	datac => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(1),
	datad => \encoder_module0|sft0|LPM_SHIFTREG_component|dffs\(2),
	combout => \encoder_module0|zout~0_combout\);

-- Location: LCCOMB_X3_Y3_N28
\sft1|LPM_SHIFTREG_component|dffs[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sft1|LPM_SHIFTREG_component|dffs[0]~1_combout\ = (!\reset~input_o\ & \sft1|LPM_SHIFTREG_component|dffs\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \sft1|LPM_SHIFTREG_component|dffs\(1),
	combout => \sft1|LPM_SHIFTREG_component|dffs[0]~1_combout\);

-- Location: FF_X3_Y3_N29
\sft1|LPM_SHIFTREG_component|dffs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~inputclkctrl_outclk\,
	d => \sft1|LPM_SHIFTREG_component|dffs[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sft1|LPM_SHIFTREG_component|dffs\(0));

-- Location: LCCOMB_X3_Y3_N22
\d1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d1~0_combout\ = (\Equal2~3_combout\ & ((counter(0) & ((\sft0|LPM_SHIFTREG_component|dffs\(2)))) # (!counter(0) & (\sft1|LPM_SHIFTREG_component|dffs\(0))))) # (!\Equal2~3_combout\ & (\sft1|LPM_SHIFTREG_component|dffs\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~3_combout\,
	datab => \sft1|LPM_SHIFTREG_component|dffs\(0),
	datac => counter(0),
	datad => \sft0|LPM_SHIFTREG_component|dffs\(2),
	combout => \d1~0_combout\);

-- Location: LCCOMB_X3_Y3_N20
\d1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d1~1_combout\ = (\Equal3~0_combout\ & (((\d1~0_combout\)))) # (!\Equal3~0_combout\ & ((\Equal2~3_combout\ & ((\d1~0_combout\))) # (!\Equal2~3_combout\ & (\sft3|LPM_SHIFTREG_component|dffs\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \sft3|LPM_SHIFTREG_component|dffs\(2),
	datac => \d1~0_combout\,
	datad => \Equal2~3_combout\,
	combout => \d1~1_combout\);

-- Location: LCCOMB_X3_Y3_N14
\d1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \d1~2_combout\ = (\LessThan2~1_combout\ & (\encoder_module0|zout~0_combout\)) # (!\LessThan2~1_combout\ & ((\d1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~1_combout\,
	datac => \encoder_module0|zout~0_combout\,
	datad => \d1~1_combout\,
	combout => \d1~2_combout\);

-- Location: LCCOMB_X3_Y3_N10
\d2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d2~0_combout\ = (\d0~0_combout\ & (((\encoder_module0|zout~0_combout\) # (\d0~1_combout\)))) # (!\d0~0_combout\ & (\sft0|LPM_SHIFTREG_component|dffs\(1) & ((!\d0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d0~0_combout\,
	datab => \sft0|LPM_SHIFTREG_component|dffs\(1),
	datac => \encoder_module0|zout~0_combout\,
	datad => \d0~1_combout\,
	combout => \d2~0_combout\);

-- Location: LCCOMB_X3_Y3_N18
\d2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d2~1_combout\ = (\d2~0_combout\ & (((\sft3|LPM_SHIFTREG_component|dffs\(1)) # (!\d0~1_combout\)))) # (!\d2~0_combout\ & (\sft1|LPM_SHIFTREG_component|dffs\(2) & ((\d0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d2~0_combout\,
	datab => \sft1|LPM_SHIFTREG_component|dffs\(2),
	datac => \sft3|LPM_SHIFTREG_component|dffs\(1),
	datad => \d0~1_combout\,
	combout => \d2~1_combout\);

ww_d0 <= \d0~output_o\;

ww_d1 <= \d1~output_o\;

ww_d2 <= \d2~output_o\;
END structure;


