library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgCnt is
    Port ( 
		Clk : in  STD_LOGIC;
		New_PC : in  STD_LOGIC_VECTOR (5 downto 0);
      PC : out  STD_LOGIC_VECTOR (5 downto 0):= b"000000"
		);
end ProgCnt;

architecture Behavioral of ProgCnt is

begin

	PC <= New_PC when rising_edge(Clk);

end Behavioral;
