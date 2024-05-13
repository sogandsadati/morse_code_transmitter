----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:38 02/05/2021 
-- Design Name: 
-- Module Name:    ps2 - Behavioral 
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

entity PS2 is
    Port ( clk25 : in  STD_LOGIC;
           data : in  STD_LOGIC;
           new_code : out  STD_LOGIC;
           code : out  STD_LOGIC_VECTOR (7 downto 0));
end PS2;

architecture Behavioral of PS2 is
signal d: STD_LOGIC_VECTOR (10 downto 0);
signal i: integer range 0 to 12;
signal p: STD_LOGIC;
begin
p <= d(8) xor d(7) xor d(6) xor d(5) xor d(4) xor d(3) xor d(2) xor d(1);

process (clk25)
begin
if falling_edge(clk25) then
	d(i)<=data;
	i<=i+1;
end if;
if i=11 then
	if d(9)/=p then
		code<=d(8 downto 1);
		new_code<='1';
	end if;
i<=0;
d<=(others=>'Z');
else
	new_code<='0';
end if;
end process;
end Behavioral;

