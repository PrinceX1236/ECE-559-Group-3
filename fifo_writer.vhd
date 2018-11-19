library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fifo_writer is
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
end entity; 

architecture arch of fifo_writer is

component shiftreg_8b
    port
    (
		aclr    : in std_logic ; 
		clock    : in std_logic ;
		data     : in std_logic_vector (7 downto 0);
		enable   : in std_logic ;
		load     : in std_logic ;
		shiftin  : in std_logic ;
		q        : out std_logic_vector (7 downto 0);
		shiftout : out std_logic 
    );
end component;

	type bus_state_type is
		(idle, wr, fin);
	type block_state_type is
		(idle, cnt);
	signal bus_state_reg, bus_state_next         : bus_state_type;
	signal block_state_reg, block_state_next     : block_state_type;
	signal bus_counter_reg, bus_counter_next     : unsigned (2 downto 0); 
	signal block_counter_reg, block_counter_next : unsigned (12 downto 0);
	signal sftreg_shiftin_sig					 : std_logic; 
	signal out_blocksize_select_reg              : std_logic;
	signal blocksize                             : unsigned (12 downto 0);

	constant BLOCKSIZE_LARGE : unsigned (12 downto 0) := "1100000000100"; -- input block size + 4
	constant BLOCKSIZE_SMALL : unsigned (12 downto 0) := "0010000100100";
   --constant BLOCKSIZE_SMALL : unsigned (12 downto 0) := "0000000001100"; -- in blocksize + 4
	
begin

	process (clk, rst)
	begin
		if (rst = '1') then
			bus_state_reg <= idle;
			block_state_reg <= idle;
			bus_counter_reg <= (others=>'0');
			block_counter_reg <= (others=>'0');
		elsif (clk'event and clk = '1') then
			bus_state_reg <= bus_state_next;
			block_state_reg <= block_state_next;
			bus_counter_reg <= bus_counter_next;
			block_counter_reg <= block_counter_next;
		end if;	
	end process;

	-- block size selection logic
    process (clk, rst)
    begin
    	if (rst = '1') then
			out_blocksize_select_reg <= '0';
		elsif (clk'event and clk = '1') then
			if (in_ready = '1') then
				out_blocksize_select_reg <= in_blocksize_select;
			end if;
		end if;
    end process;

	blocksize <= BLOCKSIZE_SMALL when out_blocksize_select_reg = '0' else
		         BLOCKSIZE_LARGE;
    out_blocksize_select <= out_blocksize_select_reg;

---- next state logic for bus state machine ------
	process (bus_state_reg, in_ready, bus_counter_reg, block_counter_reg, blocksize)
	begin
		if (in_ready = '1') then
			bus_state_next <= wr;
			bus_counter_next <= (others=>'0');
		else
			bus_counter_next <= bus_counter_reg + 1;
			bus_state_next <= bus_state_reg; ---- default bus_state ----
			case bus_state_reg is
				when idle =>         -- do nothing
					bus_state_next <= idle;
				when wr =>
					if (bus_counter_reg = 7) then
						if (block_counter_reg < blocksize - 1) then
							bus_counter_next <= (others=>'0');
						else
							bus_state_next <= fin;
						end if;
					end if ;
				when fin =>
					bus_state_next <= idle;
			end case;
		end if;
	end process;

--- next state logic for block state machine -----
	process (block_state_reg, in_ready, block_counter_reg, blocksize)
	begin
		if (in_ready = '1') then
			block_counter_next <= (others=>'0');
			block_state_next <= cnt;
		else
			block_counter_next <= block_counter_reg + 1;
			block_state_next <= block_state_reg;
			if (block_counter_reg = blocksize - 1) then
				block_state_next <= idle;
			end if;
		end if;
	end process;

	---- output logic ----
	wr_req <= '1' when ((bus_state_reg = wr) and (bus_counter_reg = 7)) else
	          '0';
	sftreg_shiftin_sig <= serial_in when (block_counter_reg < blocksize - 1) else
		                  '0';       
    out_finish <= '1' when (bus_state_reg = fin) else
    	          '0';

sftreg : shiftreg_8b port map(
	aclr    => rst,
	clock    => clk,
	data     => "00000000",
	enable   => '1',
	load     => '0',
	shiftin  => sftreg_shiftin_sig,
	q        => data,
	shiftout => open
);

end architecture ; -- arch	