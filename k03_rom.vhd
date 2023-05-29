library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all; -- old method
--use IEEE.std_logic_unsigned.all; -- old method
use IEEE.numeric_std.all; -- new method
entity kxx_rom is
port (
R : in STD_LOGIC;
X : in STD_LOGIC_VECTOR(3 downto 0);
Y : out STD_LOGIC_VECTOR(3 downto 0)
);
end entity;
architecture kxx_rom_arch of kxx_rom is
signal inp_addr : STD_LOGIC_VECTOR(4 downto 0);
type sbox is array (0 to 31) of STD_LOGIC_VECTOR(3 downto 0);
constant kxx : sbox := (
x"4", x"b", x"2", x"e", x"f", x"0", x"8", x"d", --R=0;X:0-7
x"3", x"c", x"9", x"7", x"5", x"a", x"6", x"1", --R=0;X:8-15
x"5", x"f", x"2", x"8", x"0", x"c", x"e", x"b", --R=1;X:0-7
x"6", x"a", x"d", x"1", x"9", x"7", x"3", x"4" --R=1;X:8-15
);
begin
inp_addr <= R & X;
--Y <= kxx(conv_integer(inp_vec)); -- old method
Y <= kxx(to_integer(unsigned(inp_addr))); -- new method
end architecture;
