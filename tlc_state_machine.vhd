library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tlc_state_machine is
  port (
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
end tlc_state_machine;

architecture rtl of tlc_state_machine is
  type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15);
  signal current_state, next_state : state_type;
begin

  -- Register process
  process(clk, reset)
  begin
    if reset = '1' then
      current_state <= S0;
    elsif rising_edge(clk) then
      if clk_en = '1' then
        current_state <= next_state;
      end if;
    end if;
  end process; 

  -- Transition logic
  process(current_state, ns_req, ew_req, mode_offline)
  begin
    next_state <= current_state;

    case current_state is
      when S0 =>
        if ew_req = '1' and ns_req = '0' then
          next_state <= S6;
        else
          next_state <= S1;
        end if;
      when S1 => next_state <= S2;
      when S2 => next_state <= S3;
      when S3 => next_state <= S4;
      when S4 => next_state <= S5;
      when S5 => next_state <= S6;
      when S6 => next_state <= S7;
      when S7 => next_state <= S8;

      when S8 =>
        if ns_req = '1' and ew_req = '0' then
          next_state <= S14;
        else
          next_state <= S9;
        end if;
      when S9  => next_state <= S10;
      when S10 => next_state <= S11;
      when S11 => next_state <= S12;
      when S12 => next_state <= S13;
      when S13 => next_state <= S14;
      when S14 => next_state <= S15;

      when S15 =>
        if mode_offline = '1' then
          next_state <= S15;
        else
          next_state <= S0;
        end if;
    end case;
  end process;

  -- Output/Decoder logic
  process(current_state, blink_sig)
    variable ns : std_logic_vector(6 downto 0);
    variable ew : std_logic_vector(6 downto 0);
  begin
    ns := (others => '0');
    ew := (others => '0');
    ns_crossing <= '0';
    ew_crossing <= '0';
    ns_reg_clr <= '0';
    ew_reg_clr <= '0';

    case current_state is

      -- EW direction GREEN + crossing display
      when S0 =>
        ew(3) := '1';
        ew_crossing <= '1';
        ns(0) := '1';

      when S1 =>
        ew(3) := '1';
        ew_crossing <= '1';
        ns(0) := '1';

      when S2 =>
        if blink_sig = '1' then ew(3) := '1'; end if;
        ns(0) := '1';

      when S3 =>
        if blink_sig = '1' then ew(3) := '1'; end if;
        ns(0) := '1';

      when S4 =>
        ew(6) := '1';  -- Amber
        ns(0) := '1';

      when S5 =>
        ew(6) := '1';
        ns(0) := '1';

      when S6 =>
        ew(0) := '1';  -- Red
        ns(0) := '1';
        ns_reg_clr <= '1';

      when S7 =>
        ew(0) := '1';
        ns(0) := '1';

      -- NS direction GREEN + crossing
      when S8 =>
        ew(0) := '1';
        ns(3) := '1';
        ns_crossing <= '1';

      when S9 =>
        ew(0) := '1';
        ns(3) := '1';
        ns_crossing <= '1';

      when S10 =>
        ew(0) := '1';
        if blink_sig = '1' then ns(3) := '1'; end if;

      when S11 =>
        ew(0) := '1';
        if blink_sig = '1' then ns(3) := '1'; end if;

      when S12 =>
        ew(0) := '1';
        ns(6) := '1';  -- Amber

      when S13 =>
        ew(0) := '1';
        ns(6) := '1';

      when S14 =>
        ns(0) := '1';
        ew_reg_clr <= '1';

      when S15 =>
        if blink_sig = '1' then
          ns(0) := '1';  -- Flash RED
          ew(6) := '1';  -- Flash Amber
        end if;

    end case;

    ns_display <= ns;
    ew_display <= ew;
    state_num <= std_logic_vector(to_unsigned(state_type'pos(current_state), 4));
  end process;

end rtl;