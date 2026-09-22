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
							x"808101", -- mov 0x1020, w1   ;INW0=0010
							x"808112", -- mov 0x1022, w2   ;INW1=8000
							x"508181", -- sub w1,w1,w3     ;w3=0000, Z=1, C=1
							x"598260", -- subb w3,#0,w4    ;w4=0000, Z=1, C=1
							x"888124", -- mov w4, 0x1024   ;0000
							x"5882E1", -- subb w1,#1,w5    ;w5=000f, Z=0, C=1
							x"888125", -- mov w5, 0x1024   ;000f
							x"598360", -- subb w3,#0,w6    ;w6=0000, Z=0
							x"888126", -- mov w6, 0x1024   ;0000
							x"320003", -- bra Z, STOP      ;no jump
							x"5903E1", -- subb w2,#1,w7    ;w7=7fff, OV=1, N=0, C=1
							x"888127", -- mov w7, 0x1024   ;7fff
							x"37FFF3", -- bra LOOP         ;return to start
							x"37FFFF", -- STOP: bra STOP   ;infinite loop
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
