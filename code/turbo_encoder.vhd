
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity turbo_encoder is
port(
	  clock : in std_logic;
	  reset : in std_logic;
	  cin	: in std_logic;
	  d0  	: out std_logic;
	  d1    : out std_logic;
	  d2    : out std_logic
	);
end entity;

architecture arc of turbo_encoder is

component shiftreg
	port
	(
		clock		: in std_logic ;
		enable		: in std_logic ;
		sclr		: in std_logic ;
		shiftin		: in std_logic ;
		q		    : out std_logic_vector (2 downto 0)
	);
end component;

component encoder_module
port (
      clock : in std_logic;
	  reset : in std_logic;
	  cin	: in std_logic;
	  zout  : out std_logic;
	  qout  : out std_logic
	);
end component;

signal counter: unsigned (12 downto 0);
signal K: unsigned (12 downto 0) := "0000000000011";
signal x: std_logic;
signal z: std_logic;
signal x_p: std_logic;
signal z_p: std_logic;
signal c_t0: std_logic; -- upper input after switch
signal c_t1: std_logic; -- lower input after switch
signal f0: std_logic; -- upper feedback
signal f1: std_logic; -- lower feedback
signal cin_p: std_logic;
signal q_0: std_logic_vector (2 downto 0);
signal q_1: std_logic_vector (2 downto 0);
signal q_2: std_logic_vector (2 downto 0);
signal q_3: std_logic_vector (2 downto 0);

signal sftreg_en : std_logic;
signal wr_en : std_logic;
signal rd_en : std_logic;
signal sftreg_clk : std_logic;

begin

sftreg_en <= not wr_en; -- shift register should be enabled in K to K + 2 
sftreg_clk <= not clock;

process (clock, reset)  --- counter
begin
	
	if (clock'event and clock = '1') then
	    if reset = '1' then 
	    	counter <= (others => '0');
		elsif counter = K + 6 then
	      	counter <= (others => '0');
	    else 
			counter <= counter + 1;
		end if;
	end if;	     	 

end process;

process (counter) --- FIFO control signal
begin
-- write control
	if counter >= k or counter < k + 3 then
	   wr_en <= '0';
	else 
	   wr_en <= '1';
	end if;
-- read control
	if counter < k then
	   rd_en <= '1';
	else
		rd_en <= '0';
	end if;
end process;

process (cin, cin_p, f0, f1, c_t0, counter) -- switch control
begin
	cin_p <= cin;  -- testing
	if counter < K then
		c_t0 <= cin;
		c_t1 <= cin_p;
	else
		c_t0 <= f0;
		c_t1 <= f1;
	end if;
	x   <= c_t0;
	x_p <= f1;
end process;

process (x, z, z_p, q_0, q_1, q_2, q_3, counter) -- output control
begin
	if counter < K then
	   d0 <= x;
	   d1 <= z;
	   d2 <= z_p;
    elsif counter = K + 3 then
    			d0 <= q_0(0);
    			d1 <= q_1(0);
    			d2 <= q_0(1);
	elsif counter = K + 4 then
    			d0 <= q_1(1);
    			d1 <= q_0(2);
    			d2 <= q_1(2);
	elsif counter = K + 5 then
    			d0 <= q_3(0);
    			d1 <= q_2(0);
    			d2 <= q_3(1);
	else
    			d0 <= q_2(1);
    			d1 <= q_3(2);
    			d2 <= q_2(2);
    end if;   
end process;

encoder_module0: encoder_module port map (
	  clock => clock,
	  reset => reset,
	  cin	=> c_t0,
	  zout  => z,
	  qout  => f0			
	);

encoder_module1: encoder_module port map (
	  clock => clock,
	  reset => reset,
	  cin	=> c_t1,
	  zout  => z_p,
	  qout  => f1			
	);

sft0 : shiftreg port map(
						  clock   => sftreg_clk,
						  enable  => sftreg_en,
						  sclr    => reset,
						  shiftin => x,
						  q       => q_0
						);

sft1 : shiftreg port map(
						  clock   => sftreg_clk,
						  enable  => sftreg_en,
						  sclr    => reset,
						  shiftin => z,
						  q       => q_1
						);
sft2 : shiftreg port map(
						  clock   => sftreg_clk,
						  enable  => sftreg_en,
						  sclr    => reset,
						  shiftin => z_p,
						  q       => q_2
						);

sft3 : shiftreg port map(
						  clock   => sftreg_clk,
						  enable  => sftreg_en,
						  sclr    => reset,
						  shiftin => x_p,
						  q       => q_3
						);

end arc;

