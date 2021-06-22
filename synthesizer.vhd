library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synthesizer is
	port(clk: in std_logic;
	keys: in std_logic_vector(4 downto 0);
	synth_out: out std_logic);
end synthesizer;

architecture Behavioral of synthesizer is

signal audio_signals: std_logic_vector(4 downto 0);

component squarewave is
	generic(freq: integer);
	port(clk: in std_logic;
	square_signal: out std_logic);
end component;

begin

E4: squarewave 
generic map(freq => 330)
port map(clk => clk, square_signal => audio_signals(0));

G4: squarewave 
generic map(freq => 392)
port map(clk => clk, square_signal => audio_signals(1));

A4: squarewave 
generic map(freq => 440)
port map(clk => clk, square_signal => audio_signals(2));

B4: squarewave 
generic map(freq => 494)
port map(clk => clk, square_signal => audio_signals(3));

D5: squarewave 
generic map(freq => 587)
port map(clk => clk, square_signal => audio_signals(4));


process(clk)
begin

if rising_edge(clk) then

	if keys(0) = '0' then
		synth_out <= audio_signals(0);
	elsif keys(1) = '0' then
		synth_out <= audio_signals(1);
	elsif keys(2) = '0' then
		synth_out <= audio_signals(2);
	elsif keys(3) = '0' then
		synth_out <= audio_signals(3);
	elsif keys(4) = '0' then
		synth_out <= audio_signals(4);

	elsif keys(0) = '1' then
		synth_out <= '0';
	elsif keys(1) = '1' then
		synth_out <= '0';
	elsif keys(2) = '1' then
		synth_out <= '0';
	elsif keys(3) = '1' then
		synth_out <= '0';
	elsif keys(4) = '1' then
		synth_out <= '0';
	end if;

end if;

end process;

end Behavioral;