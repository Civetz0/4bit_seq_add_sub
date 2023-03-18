LIBRARY ieee;
USE ieee.std_logic_1164.all;

--design of the mux 1 bit 2 to 1

ENTITY MUX2to1_1bit IS
    PORT(input1, input2, sel: IN std_logic; 
    output: OUT std_logic);
end MUX2to1_1bit;

ARCHITECTURE behaviour OF MUX2to1_1bit IS
BEGIN
PROCESS(input1, input2, sel) IS
    BEGIN
    if(sel = '0') then
    output <= input1; --upper signal in the mux symbol
    else
    output <= input2; --lower signal in the mux symbol
    end if;
end process;
end behaviour; 