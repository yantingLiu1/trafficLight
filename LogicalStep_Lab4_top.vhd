
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY LogicalStep_Lab4_top IS
   PORT
	(
    clkin_50	    : in	std_logic;							-- The 50 MHz FPGA Clockinput
	rst_n			: in	std_logic;							-- The RESET input (ACTIVE LOW)
	pb_n			: in	std_logic_vector(3 downto 0); -- The push-button inputs (ACTIVE LOW)
 	sw   			: in  	std_logic_vector(7 downto 0); -- The switch inputs
    leds			: out 	std_logic_vector(7 downto 0);	-- for displaying the the lab4 project details
	-------------------------------------------------------------
	-- you can add temporary output ports here if you need to debug your design 
	-- or to add internal signals for your simulations
	-------------------------------------------------------------
	sm_clken_out, blink_sig_out : out std_logic;
	ns_seg_a : out std_logic;
	ns_seg_d : out std_logic;
	ns_seg_g : out std_logic;
	es_seg_a : out std_logic;
	es_seg_d : out std_logic;
	es_seg_g : out std_logic;
	state : out std_logic_vector(3 downto 0);
   seg7_data 	: out 	std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	);
END LogicalStep_Lab4_top;

ARCHITECTURE SimpleCircuit OF LogicalStep_Lab4_top IS

   component segment7_mux port (
             clk        	: in  	std_logic := '0';
			 DIN2 			: in  	std_logic_vector(6 downto 0);	
			 DIN1 			: in  	std_logic_vector(6 downto 0);
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
   );
   end component;

   component clock_generator port (
			sim_mode			: in boolean;
			reset				: in std_logic;
            clkin      		    : in  std_logic;
			sm_clken			: out	std_logic;
			blink		  		: out std_logic
  );
   end component;

   component pb_filters port (
			clkin				: in std_logic;
			rst_n				: in std_logic;
			rst_n_filtered	    : out std_logic;
			pb_n				: in  std_logic_vector (3 downto 0);
			pb_n_filtered	    : out	std_logic_vector(3 downto 0)							 
 );
   end component;

   component pb_inverters port (
			rst_n				: in  std_logic;
			rst				    : out	std_logic;							 
			pb_n_filtered	    : in  std_logic_vector (3 downto 0);
			pb					: out	std_logic_vector(3 downto 0)							 
  );
   end component; 

	component synchronizer port(
			clk		: in std_logic;
			reset	: in std_logic;
			din		: in std_logic;
			dout	: out std_logic
  );
	end component;

	component holding_register port (
			clk				: in std_logic;
			reset			: in std_logic;
			register_clr	: in std_logic;
			din				: in std_logic;
			dout			: out std_logic
  );
	end component;

	component tlc_state_machine port (
		clk           : in  std_logic;
		reset         : in  std_logic;
		clk_en        : in  std_logic;
		blink_sig     : in  std_logic;
		ns_req        : in  std_logic;
		ew_req        : in  std_logic;
		mode_offline  : in  std_logic;
		ns_crossing   : out std_logic;
		ew_crossing   : out std_logic;
		state_num     : out std_logic_vector(3 downto 0);
		ns_display    : out std_logic_vector(6 downto 0);
		ew_display    : out std_logic_vector(6 downto 0);
		ns_reg_clr    : out std_logic;
		ew_reg_clr    : out std_logic
	);
	end component;

	-- CONSTANT
	CONSTANT sim_mode : boolean := TRUE;

	-- SIGNALS
	SIGNAL rst, rst_n_filtered, synch_rst     : std_logic;
	SIGNAL sm_clken, blink_sig                : std_logic; 
	SIGNAL pb_n_filtered, pb                  : std_logic_vector(3 downto 0); 

	SIGNAL ns_req_synch, ew_req_synch         : std_logic;
	SIGNAL mode_offline_synch                 : std_logic;
	SIGNAL ns_req_hold, ew_req_hold           : std_logic;
	SIGNAL ns_cross, ew_cross                 : std_logic;
	SIGNAL ns_seg, ew_seg                     : std_logic_vector(6 downto 0);
	SIGNAL state_bits                         : std_logic_vector(3 downto 0);
	SIGNAL ns_clr, ew_clr                     : std_logic;
	SIGNAL reset_sig : std_logic;


BEGIN

reset_sig <= not rst_n;

-- INPUT FILTERING
INST0: pb_filters     port map (clkin_50, rst_n, rst_n_filtered, pb_n, pb_n_filtered);
INST1: pb_inverters   port map (rst_n_filtered, rst, pb_n_filtered, pb);
INST2: synchronizer   port map (clkin_50, '0', rst, synch_rst);
INST3: clock_generator port map (sim_mode, reset_sig, clkin_50, sm_clken, blink_sig);--thisone has it flipped

-- BUTTON & SWITCH SYNCHRONIZERS
sync_pb0: synchronizer port map (clkin_50, synch_rst, pb(0), ns_req_synch);
sync_pb1: synchronizer port map (clkin_50, synch_rst, pb(1), ew_req_synch);
sync_sw0: synchronizer port map (clkin_50, synch_rst, sw(0), mode_offline_synch);

-- HOLDING REGISTERS
hold_ns: holding_register port map (clkin_50, synch_rst, ns_clr, ns_req_synch, ns_req_hold);
hold_ew: holding_register port map (clkin_50, synch_rst, ew_clr, ew_req_synch, ew_req_hold);

-- TLC STATE MACHINE
TLC_SM: tlc_state_machine
  port map (
    clkin_50,
    synch_rst,
    sm_clken,
    blink_sig,
     ns_req_hold,
    ew_req_hold,
   mode_offline_synch,
    ns_cross,
    ew_cross,
    state_bits,
    ns_seg,
   ew_seg,
    ns_clr,
    ew_clr
  );

-- SEGMENT DISPLAY MUX
SEG7MUX: segment7_mux
  port map (
   clkin_50,
    ns_seg,     -- NS => DIG2
     ew_seg,     -- EW => DIG1
     seg7_data,
   seg7_char2,
     seg7_char1
  );

-- LED MAPPING
leds(0) <= ns_cross;
leds(1) <= ns_req_hold;
leds(2) <= ew_cross;
leds(3) <= ew_req_hold;
leds(7 downto 4) <= state_bits;

	sm_clken_out <= sm_clken;
	blink_sig_out <= blink_sig;
	ns_seg_a <= ns_seg(0);
	ns_seg_d <= ns_seg(3);
	ns_seg_g <= ns_seg(6);
	es_seg_a <= ns_seg(0);
	es_seg_d <= ns_seg(3);
	es_seg_g <= ns_seg(6);
	state <= state_bits;


END SimpleCircuit;

--ARCHITECTURE SimpleCircuit OF LogicalStep_Lab4_top IS
--   component segment7_mux port (
--             clk        	: in  	std_logic := '0';
--			 DIN2 			: in  	std_logic_vector(6 downto 0);	--bits 6 to 0 represent segments G,F,E,D,C,B,A
--			 DIN1 			: in  	std_logic_vector(6 downto 0); --bits 6 to 0 represent segments G,F,E,D,C,B,A
--			 DOUT			: out	std_logic_vector(6 downto 0);
--			 DIG2			: out	std_logic;
--			 DIG1			: out	std_logic
--   );
--   end component;
--
--   component clock_generator port (
--			sim_mode			: in boolean;
--			reset				: in std_logic;
--            clkin      		    : in  std_logic;
--			sm_clken			: out	std_logic;
--			blink		  		: out std_logic
--  );
--   end component;
--
--    component pb_filters port (
--			clkin				: in std_logic;
--			rst_n				: in std_logic;
--			rst_n_filtered	    : out std_logic;
--			pb_n				: in  std_logic_vector (3 downto 0);
--			pb_n_filtered	    : out	std_logic_vector(3 downto 0)							 
-- );
--   end component;
--
--	component pb_inverters port (
--			rst_n				: in  std_logic;
--			rst				    : out	std_logic;							 
--			pb_n_filtered	    : in  std_logic_vector (3 downto 0);
--			pb					: out	std_logic_vector(3 downto 0)							 
--  );
--   end component; 
--	
--	component synchronizer port(
--			clk					: in std_logic;
--			reset					: in std_logic;
--			din					: in std_logic;
--			dout					: out std_logic
--  );
----   end component; 
----  component holding_register port (
----			clk					: in std_logic;
----			reset					: in std_logic;
----			register_clr		: in std_logic;
----			din					: in std_logic;
----			dout					: out std_logic
----  );
----  end component;			
------------------------------------------------------------------------------------------------------
--	CONSTANT	sim_mode								: boolean := FALSE;  -- set to FALSE for LogicalStep board downloads																						-- set to TRUE for SIMULATIONS
--	SIGNAL rst, rst_n_filtered, synch_rst			    : std_logic;
--	SIGNAL sm_clken, blink_sig							: std_logic; 
--	SIGNAL pb_n_filtered, pb							: std_logic_vector(3 downto 0); 
--	
--BEGIN
------------------------------------------------------------------------------------------------------
--INST0: pb_filters		port map (clkin_50, rst_n, rst_n_filtered, pb_n, pb_n_filtered);
--INST1: pb_inverters		port map (rst_n_filtered, rst, pb_n_filtered, pb);
--INST2: synchronizer     port map (clkin_50,'0', rst, synch_rst);	
--INST3: clock_generator 	port map (sim_mode, synch_rst, clkin_50, sm_clken, blink_sig);
--
--END SimpleCircuit;
