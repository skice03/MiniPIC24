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
						   x"808101", -- mov 0x1020, w1  ;INW0 = aaab 
	                  x"808112", -- mov 0x1022, w2  ;INW1 = 5555 
						   x"408182", -- add w1,w2,w3    ;W3 = 0000
							x"508202", -- sub w1,w2,w4    ;W4 = 5556
							x"608282", -- and w1,w2,w5    ;W5 = 0001
							x"708302", -- ior w1,w2,w6    ;W6 = FFFF
							x"888121", -- mov w1, 0x1024	;(1024) = AAAB
							x"888122", -- mov w2, 0x1024	;(1024) = 5555
							x"888123", -- mov w3, 0x1024	;(1024) = 0000
							x"888124", -- mov w4, 0x1024	;(1024) = 5556
							x"888125", -- w5, 0x1024		;(1024) = 0001
							x"888126", -- w6, 0x1024  	   ;(1024) = FFFF
							x"37FFF3", -- bra LOOP
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