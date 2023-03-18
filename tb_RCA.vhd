LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RCA_tb IS
END RCA_tb;

ARCHITECTURE test OF RCA_tb IS
SIGNAL switches: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL resetn, clk, ovf: STD_LOGIC;
SIGNAL res: STD_LOGIC_VECTOR(3 DOWNTO 0);

COMPONENT RCA_4bit IS
	PORT (SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- b (7 downto 4) a(3 downto 0)
	KEY0: IN STD_LOGIC; -- active low asynchronous reset input
	KEY1: IN STD_LOGIC; -- manual clock input
	LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
	LEDR9: OUT STD_LOGIC); -- overflow bit
END COMPONENT;

BEGIN
uut: RCA_4bit PORT MAP(SW=>switches, KEY0=>resetn, KEY1=>clk, LEDR=>res, LEDR9=>ovf);
--clk <= '0';
--resetn <= '1';
PROCESS
	BEGIN
	clk <= '0';
	resetn <= '1';
	switches <= "00000000"; -- 0+0
	WAIT FOR 100 ns;
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "00010001"; -- 1+1
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "00100010"; -- 2+2
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "00101110"; -- 2-2
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "11111101"; -- -1-3
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "01110111"; -- 7+7 check ovf
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	WAIT FOR 100 ns;
	switches <= "01010110"; -- 6+5 check reset
	resetn <= '0';
	clk <= '1';
	WAIT FOR 100 ns;
	clk <= '0';
	resetn <= '1';
	WAIT FOR 100 ns;
	WAIT;
END PROCESS;
END test;
