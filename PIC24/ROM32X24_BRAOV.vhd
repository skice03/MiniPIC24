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
							x"808101",  -- mov 0x1020, w1   ;INW0=7fff
							x"808112",  -- mov 0x1022, w2   ;INW1=0001
							x"410382",  -- add w2,w2,w7     ;w7=0002, OV=0 (pos+pos=pos)
							x"300002",  -- BRA OV, STOP     ;no jump
							x"408182",  -- add w1,w2,w3     ;w3=8000, OV=1, (pos+pos=neg)
							x"300001",  -- bra OV, END      ;jump to END
							x"37FFFF",  -- STOP: bra STOP   ;infinite loop
							x"37FFF8",  -- END: bra LOOP    ;return to start
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
							x"000000",
							x"000000",
							x"000000",
							x"000000",
							x"000000" 
							);
begin

	Data <= ROM(conv_integer(Addr));

end ROM32x24;