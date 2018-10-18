library ieee;
use ieee.std_logic_1164.all;

entity encoder_module is
port(
	  clock : IN STD_LOGIC;
	  reset : IN STD_LOGIC;
	  cin	: IN STD_LOGIC;
	  xout  : OUT STD_LOGIC;
	  zout  : OUT STD_LOGIC
	);
end entity;

architecture arc of encoder_module is

component shiftreg
	PORT
	(
		clock		: IN STD_LOGIC ;
		enable		: IN STD_LOGIC ;
		sclr		: IN STD_LOGIC ;
		shiftin		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
	);
end component;

signal q_x: STD_LOGIC_VECTOR (2 downto 0);
signal sft_in: STD_LOGIC; 

begin

sft_in <= cin xor (q_x(0) xor q_x(1));
zout <= (sft_in xor q_x(2)) xor q_x(0);
xout <= q_x(0) xor q_x(1);

sft0 : shiftreg port map(
						  clock   => clock,
						  enable  => '1',
						  sclr    => reset,
						  shiftin => sft_in,
						  q       => q_x
						);

end arc;