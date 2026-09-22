library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity File_Regs is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           RdReg1 : in  STD_LOGIC_VECTOR (3 downto 0);
           RdReg2 : in  STD_LOGIC_VECTOR (3 downto 0);
           WrReg : in  STD_LOGIC_VECTOR (3 downto 0);
           WRData : in  STD_LOGIC_VECTOR (15 downto 0);
           RdData1 : out  STD_LOGIC_VECTOR (15 downto 0);
           RdData2 : out  STD_LOGIC_VECTOR (15 downto 0));
end File_Regs;

architecture Behavioral of File_Regs is
	type tRegs is array (0 to 15) of std_logic_vector(15 downto 0);
	signal s16Regs16 : tRegs;

begin
	-- write WrData at reg if clock is on high level and write signal is 1
	s16Regs16 (conv_integer(WrReg) ) <= WrData when rising_edge(Clk) and WrEn= '1';
	-- reading regs via muxes
	RdData1 <= s16Regs16(conv_integer(RdReg1));
	RdData2 <= s16Regs16(conv_integer(RdReg2));

end Behavioral;
