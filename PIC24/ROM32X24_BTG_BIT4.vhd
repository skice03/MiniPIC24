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
							x"808101", -- mov 0x1020, w1   ;INW0=aaab
							x"808112", -- mov 0x1022, w2   ;INW1=0001
							x"888121", -- mov w1, 0x1024   ;aaab before toggle
							x"A20001", -- btg w1, #0       ;w1=aaaa
							x"888121", -- mov w1, 0x1024   ;aaaa after bit 0
							x"A2F001", -- btg w1, #15      ;w1=2aaa
							x"888121", -- mov w1, 0x1024   ;2aaa after bit 15
							x"510181", -- sub w2,w1,w3     ;w3=d557, Z=0, N=1, C=0
							x"A24001", -- btg w1, #4       ;w1=2aba, same flags
							x"888121", -- mov w1, 0x1024   ;2aba after bit 4
							x"320001", -- bra Z, STOP      ;no jump
							x"370001", -- bra END          ;jump to END
							x"37FFFF", -- STOP: bra STOP   ;infinite loop
							x"37FFF2", -- END: bra LOOP    ;return to start
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