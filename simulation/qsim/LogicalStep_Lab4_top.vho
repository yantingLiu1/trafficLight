-- Copyright (C) 2018  Intel Corporation. All rights reserved.
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
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "07/13/2025 13:58:40"

-- 
-- Device: Altera 10M08SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab4_top IS
    PORT (
	clkin_50 : IN std_logic;
	rst_n : IN std_logic;
	pb_n : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(7 DOWNTO 0);
	leds : OUT std_logic_vector(7 DOWNTO 0);
	sm_clken_out : OUT std_logic;
	blink_sig_out : OUT std_logic;
	ns_seg_a : OUT std_logic;
	ns_seg_d : OUT std_logic;
	ns_seg_g : OUT std_logic;
	es_seg_a : OUT std_logic;
	es_seg_d : OUT std_logic;
	es_seg_g : OUT std_logic;
	state : OUT std_logic_vector(3 DOWNTO 0);
	seg7_data : OUT std_logic_vector(6 DOWNTO 0);
	seg7_char1 : OUT std_logic;
	seg7_char2 : OUT std_logic
	);
END LogicalStep_Lab4_top;

ARCHITECTURE structure OF LogicalStep_Lab4_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkin_50 : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_pb_n : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sm_clken_out : std_logic;
SIGNAL ww_blink_sig_out : std_logic;
SIGNAL ww_ns_seg_a : std_logic;
SIGNAL ww_ns_seg_d : std_logic;
SIGNAL ww_ns_seg_g : std_logic;
SIGNAL ww_es_seg_a : std_logic;
SIGNAL ww_es_seg_d : std_logic;
SIGNAL ww_es_seg_g : std_logic;
SIGNAL ww_state : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_seg7_data : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg7_char1 : std_logic;
SIGNAL ww_seg7_char2 : std_logic;
SIGNAL \pb_n[2]~input_o\ : std_logic;
SIGNAL \pb_n[3]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \seg7_data[6]~output_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \sm_clken_out~output_o\ : std_logic;
SIGNAL \blink_sig_out~output_o\ : std_logic;
SIGNAL \ns_seg_a~output_o\ : std_logic;
SIGNAL \ns_seg_d~output_o\ : std_logic;
SIGNAL \ns_seg_g~output_o\ : std_logic;
SIGNAL \es_seg_a~output_o\ : std_logic;
SIGNAL \es_seg_d~output_o\ : std_logic;
SIGNAL \es_seg_g~output_o\ : std_logic;
SIGNAL \state[0]~output_o\ : std_logic;
SIGNAL \state[1]~output_o\ : std_logic;
SIGNAL \state[2]~output_o\ : std_logic;
SIGNAL \state[3]~output_o\ : std_logic;
SIGNAL \seg7_data[0]~output_o\ : std_logic;
SIGNAL \seg7_data[1]~output_o\ : std_logic;
SIGNAL \seg7_data[2]~output_o\ : std_logic;
SIGNAL \seg7_data[3]~output_o\ : std_logic;
SIGNAL \seg7_data[4]~output_o\ : std_logic;
SIGNAL \seg7_data[5]~output_o\ : std_logic;
SIGNAL \seg7_char1~output_o\ : std_logic;
SIGNAL \seg7_char2~output_o\ : std_logic;
SIGNAL \clkin_50~input_o\ : std_logic;
SIGNAL \pb_n[0]~input_o\ : std_logic;
SIGNAL \INST0|pb_n_filtered[0]~0_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \INST0|rst_n_filtered~0_combout\ : std_logic;
SIGNAL \hold_ns|sreg~0_combout\ : std_logic;
SIGNAL \hold_ns|sreg~q\ : std_logic;
SIGNAL \pb_n[1]~input_o\ : std_logic;
SIGNAL \INST0|pb_n_filtered[1]~1_combout\ : std_logic;
SIGNAL \TLC_SM|Selector1~0_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~q\ : std_logic;
SIGNAL \INST3|clk_reg_extend~0_combout\ : std_logic;
SIGNAL \INST3|clk_reg_extend~1_combout\ : std_logic;
SIGNAL \INST3|sm_clken~combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S14~q\ : std_logic;
SIGNAL \hold_ew|sreg~0_combout\ : std_logic;
SIGNAL \hold_ew|sreg~q\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \TLC_SM|Selector2~0_combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S15~q\ : std_logic;
SIGNAL \TLC_SM|next_state.S0~0_combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S0~q\ : std_logic;
SIGNAL \TLC_SM|next_state.S1~0_combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S1~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S2~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S3~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S4~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S5~q\ : std_logic;
SIGNAL \TLC_SM|Selector0~0_combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S6~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S7~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S8~q\ : std_logic;
SIGNAL \TLC_SM|next_state.S9~0_combout\ : std_logic;
SIGNAL \TLC_SM|current_state.S9~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S10~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S11~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S12~q\ : std_logic;
SIGNAL \TLC_SM|current_state.S13~q\ : std_logic;
SIGNAL \INST3|blink_sig~0_combout\ : std_logic;
SIGNAL \INST3|blink_sig~q\ : std_logic;
SIGNAL \SEG7MUX|DOUT_TEMP[6]~2_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[0]~0_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[0]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[1]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[1]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[1]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[2]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[2]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[2]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[3]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[3]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[3]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[4]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[4]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[4]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[5]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[5]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[5]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[6]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[6]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[6]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[7]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[7]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[7]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[8]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[8]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[8]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[9]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[9]~q\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[9]~2\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[10]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|clk_proc:COUNT[10]~q\ : std_logic;
SIGNAL \SEG7MUX|DOUT_TEMP[6]~3_combout\ : std_logic;
SIGNAL \TLC_SM|ns_crossing~combout\ : std_logic;
SIGNAL \TLC_SM|ew_crossing~combout\ : std_logic;
SIGNAL \TLC_SM|WideOr12~0_combout\ : std_logic;
SIGNAL \SEG7MUX|DOUT[0]~0_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr12~combout\ : std_logic;
SIGNAL \TLC_SM|WideOr11~0_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr10~0_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr11~combout\ : std_logic;
SIGNAL \TLC_SM|ns_display[6]~0_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr10~combout\ : std_logic;
SIGNAL \TLC_SM|WideOr7~0_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr7~1_combout\ : std_logic;
SIGNAL \TLC_SM|WideOr9~combout\ : std_logic;
SIGNAL \TLC_SM|Selector6~0_combout\ : std_logic;
SIGNAL \TLC_SM|Selector5~0_combout\ : std_logic;
SIGNAL \SEG7MUX|DOUT[0]~1_combout\ : std_logic;
SIGNAL \SEG7MUX|DOUT[0]~2_combout\ : std_logic;
SIGNAL \SEG7MUX|DOUT[3]~3_combout\ : std_logic;
SIGNAL \SEG7MUX|DOUT[3]~4_combout\ : std_logic;
SIGNAL \INST0|sreg4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INST3|clk_reg_extend\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST0|sreg1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sync_pb0|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST2|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \sync_sw0|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \sync_pb1|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST0|sreg0\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_rst_n~input_o\ : std_logic;
SIGNAL \INST2|ALT_INV_sreg\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \TLC_SM|ALT_INV_ns_display[6]~0_combout\ : std_logic;
SIGNAL \SEG7MUX|ALT_INV_clk_proc:COUNT[10]~q\ : std_logic;

BEGIN

ww_clkin_50 <= clkin_50;
ww_rst_n <= rst_n;
ww_pb_n <= pb_n;
ww_sw <= sw;
leds <= ww_leds;
sm_clken_out <= ww_sm_clken_out;
blink_sig_out <= ww_blink_sig_out;
ns_seg_a <= ww_ns_seg_a;
ns_seg_d <= ww_ns_seg_d;
ns_seg_g <= ww_ns_seg_g;
es_seg_a <= ww_es_seg_a;
es_seg_d <= ww_es_seg_d;
es_seg_g <= ww_es_seg_g;
state <= ww_state;
seg7_data <= ww_seg7_data;
seg7_char1 <= ww_seg7_char1;
seg7_char2 <= ww_seg7_char2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rst_n~input_o\ <= NOT \rst_n~input_o\;
\INST2|ALT_INV_sreg\(1) <= NOT \INST2|sreg\(1);
\TLC_SM|ALT_INV_ns_display[6]~0_combout\ <= NOT \TLC_SM|ns_display[6]~0_combout\;
\SEG7MUX|ALT_INV_clk_proc:COUNT[10]~q\ <= NOT \SEG7MUX|clk_proc:COUNT[10]~q\;

\seg7_data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \SEG7MUX|DOUT_TEMP[6]~3_combout\,
	devoe => ww_devoe,
	o => \seg7_data[6]~output_o\);

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|ns_crossing~combout\,
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hold_ns|sreg~q\,
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|ew_crossing~combout\,
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hold_ew|sreg~q\,
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr12~combout\,
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr11~combout\,
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr10~combout\,
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr9~combout\,
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\sm_clken_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|sm_clken~combout\,
	devoe => ww_devoe,
	o => \sm_clken_out~output_o\);

\blink_sig_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|blink_sig~q\,
	devoe => ww_devoe,
	o => \blink_sig_out~output_o\);

\ns_seg_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|Selector6~0_combout\,
	devoe => ww_devoe,
	o => \ns_seg_a~output_o\);

\ns_seg_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|Selector5~0_combout\,
	devoe => ww_devoe,
	o => \ns_seg_d~output_o\);

\ns_seg_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|ALT_INV_ns_display[6]~0_combout\,
	devoe => ww_devoe,
	o => \ns_seg_g~output_o\);

\es_seg_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|Selector6~0_combout\,
	devoe => ww_devoe,
	o => \es_seg_a~output_o\);

\es_seg_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|Selector5~0_combout\,
	devoe => ww_devoe,
	o => \es_seg_d~output_o\);

\es_seg_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|ALT_INV_ns_display[6]~0_combout\,
	devoe => ww_devoe,
	o => \es_seg_g~output_o\);

\state[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr12~combout\,
	devoe => ww_devoe,
	o => \state[0]~output_o\);

\state[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr11~combout\,
	devoe => ww_devoe,
	o => \state[1]~output_o\);

\state[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr10~combout\,
	devoe => ww_devoe,
	o => \state[2]~output_o\);

\state[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \TLC_SM|WideOr9~combout\,
	devoe => ww_devoe,
	o => \state[3]~output_o\);

\seg7_data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG7MUX|DOUT[0]~2_combout\,
	devoe => ww_devoe,
	o => \seg7_data[0]~output_o\);

\seg7_data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[1]~output_o\);

\seg7_data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[2]~output_o\);

\seg7_data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG7MUX|DOUT[3]~4_combout\,
	devoe => ww_devoe,
	o => \seg7_data[3]~output_o\);

\seg7_data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[4]~output_o\);

\seg7_data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[5]~output_o\);

\seg7_char1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG7MUX|ALT_INV_clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char1~output_o\);

\seg7_char2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SEG7MUX|clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char2~output_o\);

\clkin_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkin_50,
	o => \clkin_50~input_o\);

\pb_n[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(0),
	o => \pb_n[0]~input_o\);

\INST0|sreg0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(0));

\INST0|sreg0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(1));

\INST0|sreg0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(2));

\INST0|sreg0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(3));

\INST0|pb_n_filtered[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|pb_n_filtered[0]~0_combout\ = (!\INST0|sreg0\(1) & (!\INST0|sreg0\(2) & !\INST0|sreg0\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg0\(1),
	datab => \INST0|sreg0\(2),
	datac => \INST0|sreg0\(3),
	combout => \INST0|pb_n_filtered[0]~0_combout\);

\rst_n~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

\INST0|sreg4[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(0));

\INST0|sreg4[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(1));

\INST0|sreg4[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(2));

\INST0|sreg4[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(3));

\INST0|rst_n_filtered~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|rst_n_filtered~0_combout\ = (!\INST0|sreg4\(1) & (!\INST0|sreg4\(2) & !\INST0|sreg4\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg4\(1),
	datab => \INST0|sreg4\(2),
	datac => \INST0|sreg4\(3),
	combout => \INST0|rst_n_filtered~0_combout\);

\INST2|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|rst_n_filtered~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST2|sreg\(0));

\INST2|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST2|sreg\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST2|sreg\(1));

\sync_pb0|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|pb_n_filtered[0]~0_combout\,
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_pb0|sreg\(0));

\sync_pb0|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \sync_pb0|sreg\(0),
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_pb0|sreg\(1));

\hold_ns|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hold_ns|sreg~0_combout\ = (!\TLC_SM|current_state.S6~q\ & ((\hold_ns|sreg~q\) # (\sync_pb0|sreg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hold_ns|sreg~q\,
	datab => \sync_pb0|sreg\(1),
	datad => \TLC_SM|current_state.S6~q\,
	combout => \hold_ns|sreg~0_combout\);

\hold_ns|sreg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \hold_ns|sreg~0_combout\,
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hold_ns|sreg~q\);

\pb_n[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(1),
	o => \pb_n[1]~input_o\);

\INST0|sreg1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(0));

\INST0|sreg1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(1));

\INST0|sreg1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(2));

\INST0|sreg1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(3));

\INST0|pb_n_filtered[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST0|pb_n_filtered[1]~1_combout\ = (!\INST0|sreg1\(1) & (!\INST0|sreg1\(2) & !\INST0|sreg1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST0|sreg1\(1),
	datab => \INST0|sreg1\(2),
	datac => \INST0|sreg1\(3),
	combout => \INST0|pb_n_filtered[1]~1_combout\);

\sync_pb1|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|pb_n_filtered[1]~1_combout\,
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_pb1|sreg\(0));

\sync_pb1|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \sync_pb1|sreg\(0),
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_pb1|sreg\(1));

\TLC_SM|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|Selector1~0_combout\ = (\TLC_SM|current_state.S13~q\) # ((\TLC_SM|current_state.S8~q\ & (\hold_ns|sreg~q\ & !\hold_ew|sreg~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S13~q\,
	datab => \TLC_SM|current_state.S8~q\,
	datac => \hold_ns|sreg~q\,
	datad => \hold_ew|sreg~q\,
	combout => \TLC_SM|Selector1~0_combout\);

\INST3|clk_divider:counter[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[0]~1_combout\ = \INST3|clk_divider:counter[0]~q\ $ (VCC)
-- \INST3|clk_divider:counter[0]~2\ = CARRY(\INST3|clk_divider:counter[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[0]~q\,
	datad => VCC,
	combout => \INST3|clk_divider:counter[0]~1_combout\,
	cout => \INST3|clk_divider:counter[0]~2\);

\INST3|clk_divider:counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[0]~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[0]~q\);

\INST3|clk_divider:counter[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[1]~1_combout\ = (\INST3|clk_divider:counter[1]~q\ & (!\INST3|clk_divider:counter[0]~2\)) # (!\INST3|clk_divider:counter[1]~q\ & ((\INST3|clk_divider:counter[0]~2\) # (GND)))
-- \INST3|clk_divider:counter[1]~2\ = CARRY((!\INST3|clk_divider:counter[0]~2\) # (!\INST3|clk_divider:counter[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[1]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[0]~2\,
	combout => \INST3|clk_divider:counter[1]~1_combout\,
	cout => \INST3|clk_divider:counter[1]~2\);

\INST3|clk_divider:counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[1]~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[1]~q\);

\INST3|clk_divider:counter[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[2]~1_combout\ = (\INST3|clk_divider:counter[2]~q\ & (\INST3|clk_divider:counter[1]~2\ $ (GND))) # (!\INST3|clk_divider:counter[2]~q\ & (!\INST3|clk_divider:counter[1]~2\ & VCC))
-- \INST3|clk_divider:counter[2]~2\ = CARRY((\INST3|clk_divider:counter[2]~q\ & !\INST3|clk_divider:counter[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[2]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[1]~2\,
	combout => \INST3|clk_divider:counter[2]~1_combout\,
	cout => \INST3|clk_divider:counter[2]~2\);

\INST3|clk_divider:counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[2]~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[2]~q\);

\INST3|clk_divider:counter[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[3]~1_combout\ = (\INST3|clk_divider:counter[3]~q\ & (!\INST3|clk_divider:counter[2]~2\)) # (!\INST3|clk_divider:counter[3]~q\ & ((\INST3|clk_divider:counter[2]~2\) # (GND)))
-- \INST3|clk_divider:counter[3]~2\ = CARRY((!\INST3|clk_divider:counter[2]~2\) # (!\INST3|clk_divider:counter[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[3]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[2]~2\,
	combout => \INST3|clk_divider:counter[3]~1_combout\,
	cout => \INST3|clk_divider:counter[3]~2\);

\INST3|clk_divider:counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[3]~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[3]~q\);

\INST3|clk_divider:counter[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[4]~1_combout\ = \INST3|clk_divider:counter[4]~q\ $ (!\INST3|clk_divider:counter[3]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[4]~q\,
	cin => \INST3|clk_divider:counter[3]~2\,
	combout => \INST3|clk_divider:counter[4]~1_combout\);

\INST3|clk_divider:counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[4]~1_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[4]~q\);

\INST3|clk_reg_extend~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~0_combout\ = (\rst_n~input_o\ & \INST3|clk_divider:counter[4]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \INST3|clk_divider:counter[4]~q\,
	combout => \INST3|clk_reg_extend~0_combout\);

\INST3|clk_reg_extend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(0));

\INST3|clk_reg_extend~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~1_combout\ = (\INST3|clk_reg_extend\(0) & \rst_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datab => \rst_n~input_o\,
	combout => \INST3|clk_reg_extend~1_combout\);

\INST3|clk_reg_extend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(1));

\INST3|sm_clken\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|sm_clken~combout\ = (\INST3|clk_reg_extend\(0) & !\INST3|clk_reg_extend\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datad => \INST3|clk_reg_extend\(1),
	combout => \INST3|sm_clken~combout\);

\TLC_SM|current_state.S14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|Selector1~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S14~q\);

\hold_ew|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hold_ew|sreg~0_combout\ = (!\TLC_SM|current_state.S14~q\ & ((\hold_ew|sreg~q\) # (\sync_pb1|sreg\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hold_ew|sreg~q\,
	datab => \sync_pb1|sreg\(1),
	datad => \TLC_SM|current_state.S14~q\,
	combout => \hold_ew|sreg~0_combout\);

\hold_ew|sreg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \hold_ew|sreg~0_combout\,
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hold_ew|sreg~q\);

\sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

\sync_sw0|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \sw[0]~input_o\,
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sw0|sreg\(0));

\sync_sw0|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \sync_sw0|sreg\(0),
	clrn => \INST2|ALT_INV_sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_sw0|sreg\(1));

\TLC_SM|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|Selector2~0_combout\ = (\TLC_SM|current_state.S14~q\) # ((\TLC_SM|current_state.S15~q\ & \sync_sw0|sreg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S14~q\,
	datab => \TLC_SM|current_state.S15~q\,
	datac => \sync_sw0|sreg\(1),
	combout => \TLC_SM|Selector2~0_combout\);

\TLC_SM|current_state.S15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|Selector2~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S15~q\);

\TLC_SM|next_state.S0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|next_state.S0~0_combout\ = (\sync_sw0|sreg\(1)) # (!\TLC_SM|current_state.S15~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sync_sw0|sreg\(1),
	datad => \TLC_SM|current_state.S15~q\,
	combout => \TLC_SM|next_state.S0~0_combout\);

\TLC_SM|current_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|next_state.S0~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S0~q\);

\TLC_SM|next_state.S1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|next_state.S1~0_combout\ = (!\TLC_SM|current_state.S0~q\ & ((\hold_ns|sreg~q\) # (!\hold_ew|sreg~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hold_ns|sreg~q\,
	datac => \hold_ew|sreg~q\,
	datad => \TLC_SM|current_state.S0~q\,
	combout => \TLC_SM|next_state.S1~0_combout\);

\TLC_SM|current_state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|next_state.S1~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S1~q\);

\TLC_SM|current_state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S1~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S2~q\);

\TLC_SM|current_state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S2~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S3~q\);

\TLC_SM|current_state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S3~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S4~q\);

\TLC_SM|current_state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S4~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S5~q\);

\TLC_SM|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|Selector0~0_combout\ = (\TLC_SM|current_state.S5~q\) # ((\hold_ew|sreg~q\ & (!\hold_ns|sreg~q\ & !\TLC_SM|current_state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S5~q\,
	datab => \hold_ew|sreg~q\,
	datac => \hold_ns|sreg~q\,
	datad => \TLC_SM|current_state.S0~q\,
	combout => \TLC_SM|Selector0~0_combout\);

\TLC_SM|current_state.S6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|Selector0~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S6~q\);

\TLC_SM|current_state.S7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S6~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S7~q\);

\TLC_SM|current_state.S8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S7~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S8~q\);

\TLC_SM|next_state.S9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|next_state.S9~0_combout\ = (\TLC_SM|current_state.S8~q\ & ((\hold_ew|sreg~q\) # (!\hold_ns|sreg~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S8~q\,
	datab => \hold_ew|sreg~q\,
	datad => \hold_ns|sreg~q\,
	combout => \TLC_SM|next_state.S9~0_combout\);

\TLC_SM|current_state.S9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|next_state.S9~0_combout\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S9~q\);

\TLC_SM|current_state.S10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S9~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S10~q\);

\TLC_SM|current_state.S11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S10~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S11~q\);

\TLC_SM|current_state.S12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S11~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S12~q\);

\TLC_SM|current_state.S13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \TLC_SM|current_state.S12~q\,
	clrn => \rst_n~input_o\,
	ena => \INST3|sm_clken~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \TLC_SM|current_state.S13~q\);

\INST3|blink_sig~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|blink_sig~0_combout\ = (\rst_n~input_o\ & \INST3|clk_divider:counter[2]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst_n~input_o\,
	datab => \INST3|clk_divider:counter[2]~q\,
	combout => \INST3|blink_sig~0_combout\);

\INST3|blink_sig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|blink_sig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|blink_sig~q\);

\SEG7MUX|DOUT_TEMP[6]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT_TEMP[6]~2_combout\ = (\TLC_SM|current_state.S5~q\) # ((\TLC_SM|current_state.S4~q\) # ((\TLC_SM|current_state.S15~q\ & \INST3|blink_sig~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S5~q\,
	datab => \TLC_SM|current_state.S4~q\,
	datac => \TLC_SM|current_state.S15~q\,
	datad => \INST3|blink_sig~q\,
	combout => \SEG7MUX|DOUT_TEMP[6]~2_combout\);

\SEG7MUX|clk_proc:COUNT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[0]~0_combout\ = !\SEG7MUX|clk_proc:COUNT[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[0]~q\,
	combout => \SEG7MUX|clk_proc:COUNT[0]~0_combout\);

\SEG7MUX|clk_proc:COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[0]~q\);

\SEG7MUX|clk_proc:COUNT[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[1]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[1]~q\ & (\SEG7MUX|clk_proc:COUNT[0]~q\ $ (VCC))) # (!\SEG7MUX|clk_proc:COUNT[1]~q\ & (\SEG7MUX|clk_proc:COUNT[0]~q\ & VCC))
-- \SEG7MUX|clk_proc:COUNT[1]~2\ = CARRY((\SEG7MUX|clk_proc:COUNT[1]~q\ & \SEG7MUX|clk_proc:COUNT[0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[1]~q\,
	datab => \SEG7MUX|clk_proc:COUNT[0]~q\,
	datad => VCC,
	combout => \SEG7MUX|clk_proc:COUNT[1]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[1]~2\);

\SEG7MUX|clk_proc:COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[1]~q\);

\SEG7MUX|clk_proc:COUNT[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[2]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[2]~q\ & (!\SEG7MUX|clk_proc:COUNT[1]~2\)) # (!\SEG7MUX|clk_proc:COUNT[2]~q\ & ((\SEG7MUX|clk_proc:COUNT[1]~2\) # (GND)))
-- \SEG7MUX|clk_proc:COUNT[2]~2\ = CARRY((!\SEG7MUX|clk_proc:COUNT[1]~2\) # (!\SEG7MUX|clk_proc:COUNT[2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[2]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[1]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[2]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[2]~2\);

\SEG7MUX|clk_proc:COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[2]~q\);

\SEG7MUX|clk_proc:COUNT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[3]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[3]~q\ & (\SEG7MUX|clk_proc:COUNT[2]~2\ $ (GND))) # (!\SEG7MUX|clk_proc:COUNT[3]~q\ & (!\SEG7MUX|clk_proc:COUNT[2]~2\ & VCC))
-- \SEG7MUX|clk_proc:COUNT[3]~2\ = CARRY((\SEG7MUX|clk_proc:COUNT[3]~q\ & !\SEG7MUX|clk_proc:COUNT[2]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[3]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[2]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[3]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[3]~2\);

\SEG7MUX|clk_proc:COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[3]~q\);

\SEG7MUX|clk_proc:COUNT[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[4]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[4]~q\ & (!\SEG7MUX|clk_proc:COUNT[3]~2\)) # (!\SEG7MUX|clk_proc:COUNT[4]~q\ & ((\SEG7MUX|clk_proc:COUNT[3]~2\) # (GND)))
-- \SEG7MUX|clk_proc:COUNT[4]~2\ = CARRY((!\SEG7MUX|clk_proc:COUNT[3]~2\) # (!\SEG7MUX|clk_proc:COUNT[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[4]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[3]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[4]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[4]~2\);

\SEG7MUX|clk_proc:COUNT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[4]~q\);

\SEG7MUX|clk_proc:COUNT[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[5]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[5]~q\ & (\SEG7MUX|clk_proc:COUNT[4]~2\ $ (GND))) # (!\SEG7MUX|clk_proc:COUNT[5]~q\ & (!\SEG7MUX|clk_proc:COUNT[4]~2\ & VCC))
-- \SEG7MUX|clk_proc:COUNT[5]~2\ = CARRY((\SEG7MUX|clk_proc:COUNT[5]~q\ & !\SEG7MUX|clk_proc:COUNT[4]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[5]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[4]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[5]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[5]~2\);

\SEG7MUX|clk_proc:COUNT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[5]~q\);

\SEG7MUX|clk_proc:COUNT[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[6]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[6]~q\ & (!\SEG7MUX|clk_proc:COUNT[5]~2\)) # (!\SEG7MUX|clk_proc:COUNT[6]~q\ & ((\SEG7MUX|clk_proc:COUNT[5]~2\) # (GND)))
-- \SEG7MUX|clk_proc:COUNT[6]~2\ = CARRY((!\SEG7MUX|clk_proc:COUNT[5]~2\) # (!\SEG7MUX|clk_proc:COUNT[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[6]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[5]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[6]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[6]~2\);

\SEG7MUX|clk_proc:COUNT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[6]~q\);

\SEG7MUX|clk_proc:COUNT[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[7]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[7]~q\ & (\SEG7MUX|clk_proc:COUNT[6]~2\ $ (GND))) # (!\SEG7MUX|clk_proc:COUNT[7]~q\ & (!\SEG7MUX|clk_proc:COUNT[6]~2\ & VCC))
-- \SEG7MUX|clk_proc:COUNT[7]~2\ = CARRY((\SEG7MUX|clk_proc:COUNT[7]~q\ & !\SEG7MUX|clk_proc:COUNT[6]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[7]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[6]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[7]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[7]~2\);

\SEG7MUX|clk_proc:COUNT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[7]~q\);

\SEG7MUX|clk_proc:COUNT[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[8]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[8]~q\ & (!\SEG7MUX|clk_proc:COUNT[7]~2\)) # (!\SEG7MUX|clk_proc:COUNT[8]~q\ & ((\SEG7MUX|clk_proc:COUNT[7]~2\) # (GND)))
-- \SEG7MUX|clk_proc:COUNT[8]~2\ = CARRY((!\SEG7MUX|clk_proc:COUNT[7]~2\) # (!\SEG7MUX|clk_proc:COUNT[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[8]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[7]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[8]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[8]~2\);

\SEG7MUX|clk_proc:COUNT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[8]~q\);

\SEG7MUX|clk_proc:COUNT[9]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[9]~1_combout\ = (\SEG7MUX|clk_proc:COUNT[9]~q\ & (\SEG7MUX|clk_proc:COUNT[8]~2\ $ (GND))) # (!\SEG7MUX|clk_proc:COUNT[9]~q\ & (!\SEG7MUX|clk_proc:COUNT[8]~2\ & VCC))
-- \SEG7MUX|clk_proc:COUNT[9]~2\ = CARRY((\SEG7MUX|clk_proc:COUNT[9]~q\ & !\SEG7MUX|clk_proc:COUNT[8]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[9]~q\,
	datad => VCC,
	cin => \SEG7MUX|clk_proc:COUNT[8]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[9]~1_combout\,
	cout => \SEG7MUX|clk_proc:COUNT[9]~2\);

\SEG7MUX|clk_proc:COUNT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[9]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[9]~q\);

\SEG7MUX|clk_proc:COUNT[10]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|clk_proc:COUNT[10]~1_combout\ = \SEG7MUX|clk_proc:COUNT[10]~q\ $ (\SEG7MUX|clk_proc:COUNT[9]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \SEG7MUX|clk_proc:COUNT[10]~q\,
	cin => \SEG7MUX|clk_proc:COUNT[9]~2\,
	combout => \SEG7MUX|clk_proc:COUNT[10]~1_combout\);

\SEG7MUX|clk_proc:COUNT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \SEG7MUX|clk_proc:COUNT[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \SEG7MUX|clk_proc:COUNT[10]~q\);

\SEG7MUX|DOUT_TEMP[6]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT_TEMP[6]~3_combout\ = (\SEG7MUX|clk_proc:COUNT[10]~q\ & ((\TLC_SM|current_state.S13~q\) # ((\TLC_SM|current_state.S12~q\)))) # (!\SEG7MUX|clk_proc:COUNT[10]~q\ & (((\SEG7MUX|DOUT_TEMP[6]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S13~q\,
	datab => \TLC_SM|current_state.S12~q\,
	datac => \SEG7MUX|DOUT_TEMP[6]~2_combout\,
	datad => \SEG7MUX|clk_proc:COUNT[10]~q\,
	combout => \SEG7MUX|DOUT_TEMP[6]~3_combout\);

\TLC_SM|ns_crossing\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|ns_crossing~combout\ = (\TLC_SM|current_state.S8~q\) # (\TLC_SM|current_state.S9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S8~q\,
	datab => \TLC_SM|current_state.S9~q\,
	combout => \TLC_SM|ns_crossing~combout\);

\TLC_SM|ew_crossing\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|ew_crossing~combout\ = (\TLC_SM|current_state.S1~q\) # (!\TLC_SM|current_state.S0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S1~q\,
	datad => \TLC_SM|current_state.S0~q\,
	combout => \TLC_SM|ew_crossing~combout\);

\TLC_SM|WideOr12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr12~0_combout\ = (\TLC_SM|current_state.S9~q\) # ((\TLC_SM|current_state.S7~q\) # ((\TLC_SM|current_state.S11~q\) # (\TLC_SM|current_state.S13~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S9~q\,
	datab => \TLC_SM|current_state.S7~q\,
	datac => \TLC_SM|current_state.S11~q\,
	datad => \TLC_SM|current_state.S13~q\,
	combout => \TLC_SM|WideOr12~0_combout\);

\SEG7MUX|DOUT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT[0]~0_combout\ = (!\TLC_SM|current_state.S1~q\ & (!\TLC_SM|current_state.S3~q\ & (!\TLC_SM|current_state.S5~q\ & !\TLC_SM|current_state.S15~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S1~q\,
	datab => \TLC_SM|current_state.S3~q\,
	datac => \TLC_SM|current_state.S5~q\,
	datad => \TLC_SM|current_state.S15~q\,
	combout => \SEG7MUX|DOUT[0]~0_combout\);

\TLC_SM|WideOr12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr12~combout\ = (\TLC_SM|WideOr12~0_combout\) # (!\SEG7MUX|DOUT[0]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|WideOr12~0_combout\,
	datad => \SEG7MUX|DOUT[0]~0_combout\,
	combout => \TLC_SM|WideOr12~combout\);

\TLC_SM|WideOr11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr11~0_combout\ = (\TLC_SM|current_state.S3~q\) # ((\TLC_SM|current_state.S11~q\) # ((\TLC_SM|current_state.S2~q\) # (\TLC_SM|current_state.S10~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S3~q\,
	datab => \TLC_SM|current_state.S11~q\,
	datac => \TLC_SM|current_state.S2~q\,
	datad => \TLC_SM|current_state.S10~q\,
	combout => \TLC_SM|WideOr11~0_combout\);

\TLC_SM|WideOr10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr10~0_combout\ = (!\TLC_SM|current_state.S15~q\ & (!\TLC_SM|current_state.S7~q\ & (!\TLC_SM|current_state.S6~q\ & !\TLC_SM|current_state.S14~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S15~q\,
	datab => \TLC_SM|current_state.S7~q\,
	datac => \TLC_SM|current_state.S6~q\,
	datad => \TLC_SM|current_state.S14~q\,
	combout => \TLC_SM|WideOr10~0_combout\);

\TLC_SM|WideOr11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr11~combout\ = (\TLC_SM|WideOr11~0_combout\) # (!\TLC_SM|WideOr10~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|WideOr11~0_combout\,
	datad => \TLC_SM|WideOr10~0_combout\,
	combout => \TLC_SM|WideOr11~combout\);

\TLC_SM|ns_display[6]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|ns_display[6]~0_combout\ = (!\TLC_SM|current_state.S13~q\ & !\TLC_SM|current_state.S12~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TLC_SM|current_state.S13~q\,
	datad => \TLC_SM|current_state.S12~q\,
	combout => \TLC_SM|ns_display[6]~0_combout\);

\TLC_SM|WideOr10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr10~combout\ = (\TLC_SM|current_state.S5~q\) # ((\TLC_SM|current_state.S4~q\) # ((!\TLC_SM|ns_display[6]~0_combout\) # (!\TLC_SM|WideOr10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S5~q\,
	datab => \TLC_SM|current_state.S4~q\,
	datac => \TLC_SM|WideOr10~0_combout\,
	datad => \TLC_SM|ns_display[6]~0_combout\,
	combout => \TLC_SM|WideOr10~combout\);

\TLC_SM|WideOr7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr7~0_combout\ = (!\TLC_SM|current_state.S8~q\ & (!\TLC_SM|current_state.S9~q\ & (!\TLC_SM|current_state.S11~q\ & !\TLC_SM|current_state.S13~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S8~q\,
	datab => \TLC_SM|current_state.S9~q\,
	datac => \TLC_SM|current_state.S11~q\,
	datad => \TLC_SM|current_state.S13~q\,
	combout => \TLC_SM|WideOr7~0_combout\);

\TLC_SM|WideOr7~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr7~1_combout\ = (!\TLC_SM|current_state.S15~q\ & (!\TLC_SM|current_state.S10~q\ & !\TLC_SM|current_state.S12~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TLC_SM|current_state.S15~q\,
	datac => \TLC_SM|current_state.S10~q\,
	datad => \TLC_SM|current_state.S12~q\,
	combout => \TLC_SM|WideOr7~1_combout\);

\TLC_SM|WideOr9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|WideOr9~combout\ = (\TLC_SM|current_state.S14~q\) # ((!\TLC_SM|WideOr7~1_combout\) # (!\TLC_SM|WideOr7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S14~q\,
	datac => \TLC_SM|WideOr7~0_combout\,
	datad => \TLC_SM|WideOr7~1_combout\,
	combout => \TLC_SM|WideOr9~combout\);

\TLC_SM|Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|Selector6~0_combout\ = (\TLC_SM|current_state.S15~q\ & ((\INST3|blink_sig~q\) # ((\TLC_SM|WideOr7~0_combout\ & \TLC_SM|WideOr7~1_combout\)))) # (!\TLC_SM|current_state.S15~q\ & (\TLC_SM|WideOr7~0_combout\ & (\TLC_SM|WideOr7~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S15~q\,
	datab => \TLC_SM|WideOr7~0_combout\,
	datac => \TLC_SM|WideOr7~1_combout\,
	datad => \INST3|blink_sig~q\,
	combout => \TLC_SM|Selector6~0_combout\);

\TLC_SM|Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \TLC_SM|Selector5~0_combout\ = (\TLC_SM|ns_crossing~combout\) # ((\INST3|blink_sig~q\ & ((\TLC_SM|current_state.S11~q\) # (\TLC_SM|current_state.S10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|ns_crossing~combout\,
	datab => \INST3|blink_sig~q\,
	datac => \TLC_SM|current_state.S11~q\,
	datad => \TLC_SM|current_state.S10~q\,
	combout => \TLC_SM|Selector5~0_combout\);

\SEG7MUX|DOUT[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT[0]~1_combout\ = (\TLC_SM|current_state.S0~q\ & (!\TLC_SM|current_state.S14~q\ & (!\TLC_SM|current_state.S2~q\ & !\TLC_SM|current_state.S4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|current_state.S0~q\,
	datab => \TLC_SM|current_state.S14~q\,
	datac => \TLC_SM|current_state.S2~q\,
	datad => \TLC_SM|current_state.S4~q\,
	combout => \SEG7MUX|DOUT[0]~1_combout\);

\SEG7MUX|DOUT[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT[0]~2_combout\ = (\SEG7MUX|clk_proc:COUNT[10]~q\ & (\TLC_SM|Selector6~0_combout\)) # (!\SEG7MUX|clk_proc:COUNT[10]~q\ & (((\SEG7MUX|DOUT[0]~0_combout\ & \SEG7MUX|DOUT[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|Selector6~0_combout\,
	datab => \SEG7MUX|DOUT[0]~0_combout\,
	datac => \SEG7MUX|DOUT[0]~1_combout\,
	datad => \SEG7MUX|clk_proc:COUNT[10]~q\,
	combout => \SEG7MUX|DOUT[0]~2_combout\);

\SEG7MUX|DOUT[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT[3]~3_combout\ = (\INST3|blink_sig~q\ & ((\TLC_SM|current_state.S3~q\) # (\TLC_SM|current_state.S2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|blink_sig~q\,
	datab => \TLC_SM|current_state.S3~q\,
	datac => \TLC_SM|current_state.S2~q\,
	combout => \SEG7MUX|DOUT[3]~3_combout\);

\SEG7MUX|DOUT[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SEG7MUX|DOUT[3]~4_combout\ = (\SEG7MUX|clk_proc:COUNT[10]~q\ & (\TLC_SM|Selector5~0_combout\)) # (!\SEG7MUX|clk_proc:COUNT[10]~q\ & (((\TLC_SM|ew_crossing~combout\) # (\SEG7MUX|DOUT[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TLC_SM|Selector5~0_combout\,
	datab => \TLC_SM|ew_crossing~combout\,
	datac => \SEG7MUX|DOUT[3]~3_combout\,
	datad => \SEG7MUX|clk_proc:COUNT[10]~q\,
	combout => \SEG7MUX|DOUT[3]~4_combout\);

\pb_n[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(2),
	o => \pb_n[2]~input_o\);

\pb_n[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(3),
	o => \pb_n[3]~input_o\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

\sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

\sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

\sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

\sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

\sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

ww_leds(0) <= \leds[0]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(7) <= \leds[7]~output_o\;

ww_sm_clken_out <= \sm_clken_out~output_o\;

ww_blink_sig_out <= \blink_sig_out~output_o\;

ww_ns_seg_a <= \ns_seg_a~output_o\;

ww_ns_seg_d <= \ns_seg_d~output_o\;

ww_ns_seg_g <= \ns_seg_g~output_o\;

ww_es_seg_a <= \es_seg_a~output_o\;

ww_es_seg_d <= \es_seg_d~output_o\;

ww_es_seg_g <= \es_seg_g~output_o\;

ww_state(0) <= \state[0]~output_o\;

ww_state(1) <= \state[1]~output_o\;

ww_state(2) <= \state[2]~output_o\;

ww_state(3) <= \state[3]~output_o\;

ww_seg7_data(0) <= \seg7_data[0]~output_o\;

ww_seg7_data(1) <= \seg7_data[1]~output_o\;

ww_seg7_data(2) <= \seg7_data[2]~output_o\;

ww_seg7_data(3) <= \seg7_data[3]~output_o\;

ww_seg7_data(4) <= \seg7_data[4]~output_o\;

ww_seg7_data(5) <= \seg7_data[5]~output_o\;

ww_seg7_data(6) <= \seg7_data[6]~output_o\;

ww_seg7_char1 <= \seg7_char1~output_o\;

ww_seg7_char2 <= \seg7_char2~output_o\;
END structure;


