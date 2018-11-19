library ieee;
use ieee.std_logic_1164.all;

entity turbo_encoder is
port(
	clk, rst             : in std_logic;
	cin_0                : in std_logic; -- input 0 from group 4
	cin_1                : in std_logic; -- input 1 from group 4
 	in_ready             : in std_logic; -- ready control signal from group 4
	in_blocksize_select  : in std_logic; -- block size select signal from group 4, 0: 1056, 1:6144
	out_fifo_0_rd_req    : in std_logic;
	out_fifo_1_rd_req    : in std_logic;
	out_fifo_2_rd_req    : in std_logic;
	out_finish           : out std_logic;
	out_blocksize_select : out std_logic;
	out_fifo_0_data      : out std_logic_vector(7 downto 0);
	out_fifo_1_data      : out std_logic_vector(7 downto 0);
	out_fifo_2_data      : out std_logic_vector(7 downto 0);
	out_fifo_0_empty     : out std_logic;
	out_fifo_1_empty     : out std_logic;
	out_fifo_2_empty     : out std_logic	
	);
end entity;

architecture arch of turbo_encoder is

component turbo_encoder_module is
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
end component;

component fifo_writer is
port(
	clk, rst             : in std_logic;
	serial_in            : in std_logic;
	in_ready             : in std_logic; -- pulse when the first output arrives
	in_blocksize_select  : in std_logic; -- update when in_ready
	out_finish           : out std_logic; -- pulse when block is finished
	out_blocksize_select : out std_logic; -- latched in_blocksize_select
	wr_req               : out std_logic;
	data                 : out std_logic_vector(7 downto 0)
	);
end component;

component fifo_turbo
port
(
	aclr  : in std_logic; 
	clock : in std_logic;
	data  : in std_logic_vector (7 downto 0);
	rdreq : in std_logic;
	wrreq : in std_logic;
	empty : out std_logic;
	full  : out std_logic;
	q     : out std_logic_vector (7 downto 0)
);
end component;

	signal out_ready_sig            : std_logic;
	signal out_blocksize_select_sig : std_logic;
	signal fifo_0_serial_in_sig     : std_logic;
	signal fifo_0_data_sig          : std_logic_vector (7 downto 0);
	signal fifo_0_wr_req_sig        : std_logic;
	signal fifo_1_serial_in_sig     : std_logic;
	signal fifo_1_data_sig          : std_logic_vector (7 downto 0);
	signal fifo_1_wr_req_sig        : std_logic;
	signal fifo_2_serial_in_sig     : std_logic;
	signal fifo_2_data_sig          : std_logic_vector (7 downto 0);
	signal fifo_2_wr_req_sig        : std_logic;


begin

encoder_module_0 : turbo_encoder_module port map(
	clk                  => clk,
	rst                  => rst,
	cin_0                => cin_0,
	cin_1                => cin_1,
	in_ready             => in_ready,
	in_blocksize_select  => in_blocksize_select,
	out_ready            => out_ready_sig,
	out_blocksize_select => out_blocksize_select_sig,
	d_0                  => fifo_0_serial_in_sig,
	d_1                  => fifo_1_serial_in_sig,
	d_2                  => fifo_2_serial_in_sig
	);


writer0 : fifo_writer port map(
	clk                  => clk,
	rst                  => rst,
	serial_in            => fifo_0_serial_in_sig,
	in_ready             => out_ready_sig,
	in_blocksize_select  => out_blocksize_select_sig,
	out_finish           => out_finish,
	out_blocksize_select => out_blocksize_select,
	wr_req               => fifo_0_wr_req_sig,
	data                 => fifo_0_data_sig
	);

writer1 : fifo_writer port map(
	clk                  => clk,
	rst                  => rst,
	serial_in            => fifo_1_serial_in_sig,
	in_ready             => out_ready_sig,
	in_blocksize_select  => out_blocksize_select_sig,
	out_finish           => open,
	out_blocksize_select => open,
	wr_req               => fifo_1_wr_req_sig,
	data                 => fifo_1_data_sig
	);

writer2 : fifo_writer port map(
	clk                  => clk,
	rst                  => rst,
	serial_in            => fifo_2_serial_in_sig,
	in_ready             => out_ready_sig,
	in_blocksize_select  => out_blocksize_select_sig,
	out_finish           => open,
	out_blocksize_select => open,
	wr_req               => fifo_2_wr_req_sig,
	data                 => fifo_2_data_sig
	);

fifo_turbo_0 : fifo_turbo port map(
	aclr  => rst, 
	clock => clk,
	data  => fifo_0_data_sig,
	rdreq => out_fifo_0_rd_req,
	wrreq => fifo_0_wr_req_sig,
	empty => out_fifo_0_empty,
	full  => open,
	q     => out_fifo_0_data
	);

fifo_turbo_1 : fifo_turbo port map(
	aclr  => rst, 
	clock => clk,
	data  => fifo_1_data_sig,
	rdreq => out_fifo_1_rd_req,
	wrreq => fifo_1_wr_req_sig,
	empty => out_fifo_1_empty,
	full  => open,
	q     => out_fifo_1_data
	);

fifo_turbo_2 : fifo_turbo port map(
	aclr  => rst, 
	clock => clk,
	data  => fifo_2_data_sig,
	rdreq => out_fifo_2_rd_req,
	wrreq => fifo_2_wr_req_sig,
	empty => out_fifo_2_empty,
	full  => open,
	q     => out_fifo_2_data
	);

end architecture ; -- arch
