library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM32x24 is
    Port ( 
		Addr : in  STD_LOGIC_VECTOR (4 downto 0);
      Data : out  STD_LOGIC_VECTOR (23 downto 0)
			  );
end ROM32x24;

architecture ROM32x24 of ROM32x24 is
  type tROM is array (0 to 31) of std_logic_vector (23 downto 0);
							constant ROM : tROM :=(
							x"808101", -- mov 0x1020, w1   ;INW0=0001
							x"808112", -- mov 0x1022, w2   ;INW1=8000
							x"EA0181", -- neg w1, w3       ;w3=ffff, N=1, OV=0, Z=0, C=0
							x"888123", -- mov w3, 0x1024   ;ffff
							x"EA0203", -- neg w3, w4       ;w4=0001, N=0, OV=0, Z=0, C=0
							x"888124", -- mov w4, 0x1024   ;0001
							x"EA0282", -- neg w2, w5       ;w5=8000, N=1, OV=1, Z=0, C=0
							x"888125", -- mov w5, 0x1024   ;8000
							x"508301", -- sub w1,w1,w6     ;w6=0000, prepare zero operand
							x"EA0386", -- neg w6, w7       ;w7=0000, N=0, OV=0, Z=1, C=1
							x"888127", -- mov w7, 0x1024   ;0000
							x"37FFF4", -- bra LOOP         ;return to start
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000"
							);
begin

	Data <= ROM(conv_integer(Addr));

end ROM32x24;