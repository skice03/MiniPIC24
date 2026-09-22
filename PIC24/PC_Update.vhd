library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC_Update is
    Port ( 
			NF      	  : in STD_LOGIC;
			OVF     	  : in STD_LOGIC;
			ZF  	 	  : in STD_LOGIC;
			CF      	  : in STD_LOGIC;
			Offset 	  : in STD_LOGIC_VECTOR(4 downto 0);
			BranchType : in STD_LOGIC_VECTOR(2 downto 0);
			Branch 	  : in STD_LOGIC;
			PC         : in STD_LOGIC_VECTOR (5 downto 0);
         New_PC     : out STD_LOGIC_VECTOR (5 downto 0));
end PC_Update;

architecture Behavioral of PC_Update is
		signal PC_temp : STD_LOGIC_VECTOR(5 downto 0);
		signal depl  : STD_LOGIC_VECTOR(5 downto 0);
begin
	PC_temp <= PC + 2; -- store PC + 2
	depl <= Offset&'0'; -- shift offset left
	New_PC <= (PC_temp + depl) when (Branch = '1' and ((BranchType = b"011" and NF = '1')   --BRA N, Expr (Negative, 011)
															    or  (BranchType = b"000" and OVF = '1')   --BRA OV, Expr (Overflow, 000)
															    or  (BranchType = b"010" and ZF = '1')    --BRA Z, Expr (Zero, 010)
															    or  (BranchType = b"001" and CF = '1')    --BRA C, Expr (Carry, 001)
															    or  (BranchType = b"111"))) 				    --BRA Expr (Unconditioned, 111)
															    else PC_temp;		                     
end Behavioral;
