
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity turbo_encoder_module is
	port(
	clk, rst             : in std_logic;   
	cin_0                : in std_logic;   
	cin_1                : in std_logic;   
	in_ready             : in std_logic; -- pulse when block starts
	in_blocksize_select  : in std_logic;   
	out_ready            : out std_logic; -- pulse when the first output generates
	out_blocksize_select : out std_logic;  
	d_0                  : out std_logic;  
	d_1                  : out std_logic;  
	d_2                  : out std_logic
	);
end entity;

architecture arch of turbo_encoder_module is

component Encoder_Core port(
	clock              : in std_logic;
	reset              : in std_logic;
	cin                : in std_logic;
	sftreg_en          : in std_logic; -- when current state is norm or idle, sftreg_en is '1'; when others, '0'
	turbo_encoder_mode : in std_logic; -- when current state is norm, turbo_encoder_mode is '1'; when others, '0' 
	d0                 : out std_logic_vector(2 downto 0);
	d1                 : out std_logic_vector(2 downto 0)
	);
end component;
 
	type state_type is 
	     (idle, body_0, body_1, body_2, tail_0, tail_1, tail_2, tail_3);
	signal state_reg, state_next              : state_type;
	signal blocksize                          : unsigned (12 downto 0);
	signal out_blocksize_select_reg           : std_logic;
	signal counter_reg, counter_next          : unsigned (12 downto 0);
	signal q_0_sig, q_1_sig, q_2_sig, q_3_sig : std_logic_vector (2 downto 0);
    signal encoder_core_mode_sig              : std_logic;
	signal encoder_core_sftreg_sig            : std_logic;
	constant BLOCKSIZE_LARGE : unsigned (12 downto 0) := "1100000000000";
	constant BLOCKSIZE_SMALL : unsigned (12 downto 0) := "0010000100000";
   --constant BLOCKSIZE_SMALL : unsigned (12 downto 0) := "0000000001000";

begin
	
	--- state update ---
	process (clk, rst)
	begin
		if (rst = '1') then
			state_reg <= idle;
			counter_reg <= (others=>'0');
		elsif (clk'event and clk = '1') then
			state_reg <= state_next;
			counter_reg <= counter_next;
		end if;
	end process;

	-- block size selection logic ----
    process (clk, rst)
    begin
    	if (rst = '1') then
			out_blocksize_select_reg <= '0';
		elsif (clk'event and clk = '1') then
			if (in_ready = '1') then
				out_blocksize_select_reg <= in_blocksize_select;  ---- should be latched
			end if;
		end if;
    end process;

	blocksize <= BLOCKSIZE_SMALL when out_blocksize_select_reg = '0' else
		         BLOCKSIZE_LARGE;
    out_blocksize_select <= out_blocksize_select_reg;

    ----- next state logic -----
	process (state_reg, in_ready, counter_reg, blocksize)
	begin
		if (in_ready = '1') then
			counter_next <= (others=>'0');
			state_next <= body_0;
		else
			counter_next <= counter_reg + 1;
			state_next <= state_reg; ---- default state ----
			case state_reg is
				when idle =>         -- do nothing
					state_next <= idle;
				when body_0 =>
					if (counter_reg = 2) then
						state_next <= body_1;
					end if;
				when body_1 =>
					if (counter_reg = blocksize-1) then
						state_next <= body_2;
					end if;
				when body_2 =>
					if (counter_reg = blocksize+2) then
						state_next <= tail_0;
					end if;
				when tail_0 =>
					state_next <= tail_1;
				when tail_1 =>
					state_next <= tail_2;
				when tail_2 =>
					state_next <= tail_3;
				when tail_3 =>
					state_next <= idle;
			end case;
	    end if;
	end process;

	process (state_reg, q_0_sig, q_1_sig, q_2_sig, q_3_sig)
	begin
		case state_reg is
		when tail_0 =>
    			d_0 <= q_0_sig(0);
    			d_1 <= q_1_sig(0);
    			d_2 <= q_0_sig(1);
    	when tail_1 =>
    			d_0 <= q_1_sig(1);
    			d_1 <= q_0_sig(2);
    			d_2 <= q_1_sig(2);
    	when tail_2 =>
    			d_0 <= q_3_sig(0);
    			d_1 <= q_2_sig(0);
    			d_2 <= q_3_sig(1);
    	when tail_3 =>
    			d_0 <= q_2_sig(1);
    			d_1 <= q_3_sig(2);
    			d_2 <= q_2_sig(2);
    	when others =>
				d_0 <= q_0_sig(0);
	            d_1 <= q_1_sig(0);
	            d_2 <= q_2_sig(0);
		end case;    			    	
	end process;
	with state_reg select
		encoder_core_mode_sig <= '1' when body_0 | body_1,
								 '0' when others;
	with state_reg select
		encoder_core_sftreg_sig <= '1' when body_0 | body_1 | body_2,
								   '0' when others;				 
	with counter_reg select
		out_ready <= '1' when ("0000000000011"),
					 '0' when others;

core0 : Encoder_Core port map(
	clock              => clk,
	reset              => rst,
	cin                => cin_0,
	sftreg_en          => encoder_core_sftreg_sig,
	turbo_encoder_mode => encoder_core_mode_sig,
	d0                 => q_0_sig,
	d1                 => q_1_sig
	);

core1 : Encoder_Core port map(
	clock              => clk,
	reset              => rst,
	cin                => cin_1,
	sftreg_en          => encoder_core_sftreg_sig,
	turbo_encoder_mode => encoder_core_mode_sig,
    d0                 => q_3_sig,    
	d1                 => q_2_sig     
	);

end arch;