library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( RdData1 : in  STD_LOGIC_VECTOR (15 downto 0);  	-- Wb
           Clk     : in  STD_LOGIC;
           RdData2 : in  STD_LOGIC_VECTOR (15 downto 0);  	-- Ws
           ALUOP   : in  STD_LOGIC_VECTOR (2 downto 0);
           CE_ZF   : in  std_logic;
           CE_NF   : in  std_logic;
           CE_OVF  : in  std_logic;
           CE_CF   : in  std_logic;
           NF      : out STD_LOGIC;                       	-- Negative
           CF      : out std_logic;                       	-- Carry
           OVF     : out std_logic;                       	-- Overflow
           ZF      : out STD_LOGIC;                       	-- Zero
           Y       : out STD_LOGIC_VECTOR (15 downto 0);
           lit5    : in  STD_LOGIC_VECTOR (4 downto 0);   	-- Instr(4:0)   - SUBB
           bit4    : in  std_logic_vector (3 downto 0)    	-- Instr(15:12) - BTG
    );
end ALU;

architecture Behavioral of ALU is
   signal result   : std_logic_vector(16 downto 0);
   signal lit5_ext : std_logic_vector(15 downto 0);
   signal mask     : std_logic_vector(15 downto 0);
   signal N_temp, Z_temp, C_temp, OV_temp, Z_res : std_logic;  -- computed flag values
   signal N_ff, Z_ff, C_ff, OV_ff : std_logic;					  	-- stored flag 
begin

   lit5_ext <= "00000000000" & lit5;

   -- BTG mask: 1 shifted left by bit4
   mask <= x"0001" when bit4 = x"0" else
           x"0002" when bit4 = x"1" else
           x"0004" when bit4 = x"2" else
           x"0008" when bit4 = x"3" else
           x"0010" when bit4 = x"4" else
           x"0020" when bit4 = x"5" else
           x"0040" when bit4 = x"6" else
           x"0080" when bit4 = x"7" else
           x"0100" when bit4 = x"8" else
           x"0200" when bit4 = x"9" else
           x"0400" when bit4 = x"A" else
           x"0800" when bit4 = x"B" else
           x"1000" when bit4 = x"C" else
           x"2000" when bit4 = x"D" else
           x"4000" when bit4 = x"E" else
           x"8000";

   -- operation table
   with ALUOP select
      result <=
         ('0'&RdData1) + ('0'&RdData2)                when "000", 	-- ADD  Wb + Ws
         ('0'&RdData1) + ('0'&(not RdData2)) + 1      when "001", 	-- SUB  Wb - Ws
         ('0'&(RdData1 and RdData2))                  when "010", 	-- AND
         ('0'&(RdData1 or  RdData2))                  when "011", 	-- IOR
         ('0'&RdData1) + ('0'&(not lit5_ext)) + C_ff  when "100", 	-- SUBB Wb - lit5 - borrow
         ('0'&x"0000") + ('0'&(not RdData2)) + 1      when "101", 	-- NEG  0 - Ws
         ('0'&x"0000")                                when "110", 	-- CLR  Wd = 0
         ('0'&(RdData2 xor mask))                     when "111", 	-- BTG  toggle bit4 of Ws
         (others => '0')                              when others;

   Y <= result(15 downto 0);
	
	-- flag values
   N_temp <= result(15);		
   C_temp <= result(16);
   Z_res  <= '1' when result(15 downto 0) = x"0000" else '0';

   -- SUBB has a borrow input so Z can only be cleared
   Z_temp <= (Z_res and Z_ff) when ALUOP = "100" else Z_res;

   OV_temp <= '1' when
        (ALUOP = "000" and RdData1(15)  = RdData2(15)  and result(15) /= RdData1(15)) or
        (ALUOP = "001" and RdData1(15) /= RdData2(15)  and result(15) /= RdData1(15)) or
        (ALUOP = "100" and RdData1(15) /= lit5_ext(15) and result(15) /= RdData1(15)) or
        (ALUOP = "101" and RdData2(15) = '1' and result(15) = '1')  
        else '0';

	-- flag flip-flops enabled by the control unit
   N_ff  <= N_temp  when rising_edge(Clk) and CE_NF  = '1';   
   Z_ff  <= Z_temp  when rising_edge(Clk) and CE_ZF  = '1';
   C_ff  <= C_temp  when rising_edge(Clk) and CE_CF  = '1';
   OV_ff <= OV_temp when rising_edge(Clk) and CE_OVF = '1';

   NF <= N_ff;   ZF <= Z_ff;   CF <= C_ff;   OVF <= OV_ff;

end Behavioral;