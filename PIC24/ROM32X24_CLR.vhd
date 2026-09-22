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
							x"808101", -- mov 0x1020, w1   ;INW0=ffff
							x"808112", -- mov 0x1022, w2   ;INW1=0001
							x"888121", -- mov w1, 0x1024   ;ffff before clean
							x"EB0080", -- clr w1           ;w1=0000
							x"888121", -- mov w1, 0x1024   ;0000 after clean
							x"510181", -- sub w2,w1,w3     ;w3=0001, Z=0, C=1
							x"EB0200", -- clr w4           ;w4=0000, same flags
							x"888124", -- mov w4, 0x1024   ;0000
							x"320001", -- bra Z, STOP      ;no jump
							x"370001", -- bra END          ;jump to END
							x"37FFFF", -- STOP: bra STOP   ;infinite loop
							x"37FFF4", -- END: bra LOOP    ;return to start
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