----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:24:24 02/04/2021 
-- Design Name: 
-- Module Name:    top_morse - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top_module is
	port(ps2_clk: in std_logic;
		ps2_code:  out  STD_LOGIC_VECTOR (7 downto 0);
		ps2_data: in std_logic;
		ld_top: out std_logic);
end top_module;

architecture top_arch of top_module is
	signal clk25sig: std_logic;
	signal clk_o: std_logic;
	signal new_code_sig: STD_LOGIC;
	signal asci_in: std_logic_vector(7 downto 0);

	
	component ps2
	  Port ( clk25 : in  STD_LOGIC;
           data : in  STD_LOGIC;
           new_code : out  STD_LOGIC;
           code : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component morse_att
	   Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
				clk: in STD_LOGIC;
           o : out  STD_LOGIC);
	end component;
	begin
		U1: ps2 port map(clk25 => clk25sig, code => ps2_code, data => ps2_data, new_code => new_code_sig);
		U2: morse_att port map(o => ld_top, clk =>clk_o, i => asci_in);
end top_arch;