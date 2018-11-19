library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity Encoder_Core is
port(
	  clock              : in std_logic;
	  reset              : in std_logic;
	  cin                : in std_logic;
	  sftreg_en          : in std_logic; -- when current state is norm or idle, sftreg_en is '1'; when others, '0'
	  turbo_encoder_mode : in std_logic; -- when current state is norm, turbo_encoder_mode is '1'; when others, '0' 
	  d0                 : out std_logic_vector(2 downto 0);
	  d1                 : out std_logic_vector(2 downto 0)
	);
end entity;

architecture arc of Encoder_Core is

-- component declarations --
component shiftreg_3b
	port
	(
		aclr		: in std_logic ;
		clock		: in std_logic ;
		enable		: in std_logic ;
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

-- signal declarations --
signal q_0: std_logic_vector (2 downto 0);
signal q_1: std_logic_vector (2 downto 0);
signal z: std_logic;
signal f0: std_logic; -- upper feedback
signal c_t0: std_logic; -- upper input of the encoder after the switch
signal encoder_mode : std_logic;

begin

encoder_mode <= turbo_encoder_mode;
process (encoder_mode, cin, f0) 
begin
	case encoder_mode is
		when '1' => 
			c_t0 <= cin;
		when '0' => 
			c_t0 <= f0;
	end case;
end process;

encoder_module_0: encoder_module port map (
	  clock => clock,
	  reset => reset,
	  cin	=> c_t0,
	  zout  => z,
	  qout  => f0			
	);


sft0 : shiftreg_3b port map(
						  aclr    => reset,
						  clock   => clock,
						  enable  => sftreg_en,
						  shiftin => c_t0,
						  q       => q_0
						);

sft1 : shiftreg_3b port map(
						  aclr    => reset,
						  clock   => clock,
						  enable  => sftreg_en,
						  shiftin => z,
						  q       => q_1
						);
d0 <= q_0;
d1 <= q_1;

end arc;