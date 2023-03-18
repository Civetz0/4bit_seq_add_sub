LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY signed_adder IS
	PORT (in1, in2: IN SIGNED(3 DOWNTO 0);
	cin: IN STD_LOGIC;
	cout, sgn: OUT STD_LOGIC;
	s: OUT SIGNED(3 DOWNTO 0));
END signed_adder;

ARCHITECTURE structural OF signed_adder IS
    SIGNAL q1, q2, c: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL co1, co2, co3: std_logic;
    
    COMPONENT full_adder IS
    PORT(a, b, ci: IN std_logic; 
    sum, co: OUT std_logic);
    end component;

BEGIN
    q1 <= STD_LOGIC_VECTOR(in1);
	 PROCESS(in2, cin) IS
	 BEGIN
	 complement_loop: for k in 0 to 3 loop --perform the 1 complement of the second operand
	 q2(k) <= in2(k) XOR cin;
	 end loop complement_loop;
	 END PROCESS;
	 
    q2 <= STD_LOGIC_VECTOR(in2);
    fa0: full_adder PORT MAP(a => q1(0), b=> q2(0), ci => cin,  sum => c(0), co => co1);
    fa1: full_adder PORT MAP(a => q1(1), b=> q2(1), ci => co1,  sum => c(1), co => co2);
    fa2: full_adder PORT MAP(a => q1(2), b=> q2(2), ci => co2,  sum => c(2), co => co3);
    fa3: full_adder PORT MAP(a => q1(3), b=> q2(3), ci => co3,  sum => c(3), co => cout);
    sgn <= c(3);
    s <= SIGNED(c);
END structural;