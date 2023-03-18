LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--build the full adder with dataflow description

ENTITY full_adder IS
    PORT(a, b, ci: IN std_logic; 
    sum, co: OUT std_logic);
ENd full_adder;

ARCHITECTURE mydesign OF full_adder IS

COMPONENT MUX2to1_1bit IS
    PORT(input1, input2, sel: IN std_logic; 
    output: OUT std_logic); --calling the 2to1 mux 1 bit
end component;

SIGNAL f1: std_logic; --output of the xor between a and b

BEGIN
f1 <= (a XOR b);
sum <= (ci XOR a) XOR b;
mux: MUX2to1_1bit PORT MAP(input1 => b, input2 => ci, sel => f1, output => co); --include the mux in the circuit
end mydesign;