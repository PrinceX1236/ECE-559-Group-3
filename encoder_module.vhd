
library ieee;
use ieee.std_logic_1164.all;



entity encoder_module is
port(
	  clock : in std_logic;
	  reset : in std_logic;
	  cin	: in std_logic;
	  zout  : out std_logic;
	  qout  : out std_logic
	);
end entity;

architecture arc of encoder_module is

component shiftreg_3b
	port
	(
		aclr   : in std_logic ;
		clock  : in std_logic ;
		enable : in std_logic ;
		shiftin: in std_logic ;
		q      : out std_logic_vector (2 downto 0)
	);
end component;

signal q_x: std_logic_vector (2 downto 0);
signal sft_in: std_logic; 

begin

sft_in <= cin xor (q_x(0) xor q_x(1));
zout <= (sft_in xor q_x(2)) xor q_x(0);
qout <= q_x(0) xor q_x(1);


sft0 : shiftreg_3b port map(
						  aclr    => reset,
						  clock   => clock,
						  enable  => '1',
						  shiftin => sft_in,
						  q       => q_x
						);

end arc;

