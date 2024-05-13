----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:50 02/05/2021 
-- Design Name: 
-- Module Name:    morse_att - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_att is
    Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
				clk: in STD_LOGIC;
           o : out  STD_LOGIC);
end morse_att;

architecture Behavioral of Morse_att is
signal f: STD_LOGIC_VECTOR (3 downto 0);
signal c: integer range 0 to 10:=3;
signal d,e: STD_LOGIC:='0';
begin
with i select
f<= "01ZZ" when x"1c",
	"1000" when x"32",
	"1010" when x"21",
	"100Z" when x"23",
	"0ZZZ" when x"24",
	"0010" when x"2b",
	"110Z" when x"34",
	"0000" when x"33",
	"00ZZ" when x"43",
	"0111" when x"3b",
	"101Z" when x"42",
	"0100" when x"4b",
	"11ZZ" when x"3a",
	"10ZZ" when x"31",
	"111Z" when x"44",
	"0110" when x"4d",
	"1101" when x"15",
	"010Z" when x"20",
	"000Z" when x"1b",
	"1ZZZ" when x"2c",
	"001Z" when x"3c",
	"0001" when x"2a",
	"011Z" when x"1d",
	"1001" when x"22",
	"1011" when x"35",
	"1100" when x"1a",
	"ZZZZ" when others;
process (clk)
begin
if rising_edge (clk) then
	if d='1' then
		o<='0';
		d<='0';
	elsif e='1' then
		o<='1';
		e<='0';
		d<='1';
	elsif f(c)='0' then
		o<='1';
		d<='1';
	elsif f(c)='1' then
		o<='1';
		e<='1';
		c<=c+1;
	elsif f(c)='Z' then
		o<='Z';	
		c<=3;
	end if;
	if c=0 then
		c<=3;
	else
		c<=c-1;
	end if;
end if;
end process;
end Behavioral;

