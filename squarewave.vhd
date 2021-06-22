library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity squarewave is
	generic(freq: integer);
	port(clk: in std_logic;
	square_signal: out std_logic);
end squarewave;

architecture Behavioral of squarewave is

begin

process(clk)

variable counter: integer range 0 to 12000000 / freq;
variable UP: integer := 12000000 / freq / 2;
variable DOWN : integer := 12000000 / freq;

begin

if rising_edge(clk) then
	counter := counter + 1;
	if counter = UP then
		square_signal <= '1';
	elsif counter = DOWN then
		square_signal <= '0';
		counter := 0;
	end if;
end if;

end process;

end Behavioral;