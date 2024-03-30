library IEEE;
use IEEE.std_logic_1164.all;

entity decod_fourSeven is
port(
	a4,a3,a2,a1 : in bit;
	s0,s1,s2,s3,s4,s5,s6,s7,s8,s9 : out bit
	);
end;

architecture main of decod_fourSeven is

signal out_aux: bit_vector(9 downto 0);
signal in_aux: bit_vector(4 downto 1);

begin
in_aux <= a4 & a3 & a2 & a1;
with in_aux select
out_aux <= "1000000" when "0000",
			  "1111001" when "0001",
			  "0100100" when "0010",
			  "0110000" when "0011",
			  "0011001" when "0100",
			  "0010010" when "0101",
			  "0000010" when "0110",
			  "1111000" when "0111",
			  "0000000" when "1000",
			  "0010000" when "1001",
			  "1111111" when others;

s0 <= out_aux(0);
s1 <= out_aux(1);
s2 <= out_aux(2);
s3 <= out_aux(3);
s4 <= out_aux(4);
s5 <= out_aux(5);
s6 <= out_aux(6);
s7 <= out_aux(7);
s8 <= out_aux(8);
s9 <= out_aux(9);
end;