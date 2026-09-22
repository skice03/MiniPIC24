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
							x"808101", -- mov 0x1020, w1  ;INW0=ffff 
							x"808112", -- mov 0x1022, w2  ;INW1=0001
							x"408182", -- add w1,w2,w3 	;0000, C=1
							x"608282", -- and w1,w2,w5 	;C unchanged
							x"418182", -- add w3,w2,w3    ;0001, C=0
							x"518202", -- sub w3,w2,w4    ;0000, C=1
							x"708302", -- ior w1,w2,w6    ;C unchanged
							x"520202", -- sub w4,w2,w4    ;ffff, C=0
							x"888121", -- mov w1, 0x1024
							x"888122", -- mov w2, 0x1024
							x"888123", -- mov w3, 0x1024
							x"888124", -- mov w4, 0x1024
							x"888125", -- mov w5, 0x1024
							x"888126", -- mov w6, 0x1024
							x"37FFF1", -- bra LOOP
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