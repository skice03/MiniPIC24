library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity ctrl is
    Port ( OP       : in  std_logic_vector (7 downto 0);   -- Instr(23:16)
           ALUOP    : out std_logic_vector (2 downto 0);
           MemWr    : out std_logic;
           Mem2Reg  : out std_logic;
           RegWr    : out std_logic;
           RegDest  : out std_logic;
           RegBase  : out std_logic;
           Branch   : out std_logic;
           CE_ZF    : out std_logic;
           CE_NF    : out std_logic;
           CE_OVF   : out std_logic;
           CE_CF    : out std_logic
    );
end ctrl;
 
architecture Behavioral of ctrl is
   signal op5 : std_logic_vector(4 downto 0);   -- Instr(23:19)
begin
 
   op5 <= OP(7 downto 3);
 
   MemWr   <= '1' when op5 = b"10001" else '0';   -- MOV Wns, f
   Mem2Reg <= '1' when op5 = b"10000" else '0';   -- MOV f, Wnd
 
   RegWr <= '1' when (op5 = b"01000" or           -- ADD  Wb,Ws,Wd
                      op5 = b"01010" or           -- SUB  Wb,Ws,Wd
                      op5 = b"01011" or           -- SUBB Wb,#lit5,Wd
                      op5 = b"01100" or           -- AND  Wb,Ws,Wd
                      op5 = b"01110" or           -- IOR  Wb,Ws,Wd
                      op5 = b"10000" or           -- MOV  f,Wnd
                      OP  = b"10100010" or        -- BTG  Ws,#bit4 (writes Ws)
                      OP  = b"11101010" or        -- NEG  Ws,Wd
                      OP  = b"11101011")          -- CLR  Wd
            else '0';
 
   -- dest mux: '0' = Instr(10:7), '1' = Instr(3:0)
   RegDest <= '1' when (op5 = b"10000" or OP = b"10100010") else '0';
 
   -- base mux: '0' = Instr(18:15), '1' = Instr(14:11); instructions with base reg take it from Instr(18:15)
   RegBase <= '0';
 
   -- BRA instructions have Instr(23:19) = 00110 and condition is selected inside PC_Update by BranchType = Instr(18:16)
   Branch <= '1' when op5 = b"00110" else '0';
 
   -- flag enables: ADD/SUB/SUBB/NEG -> N,OV,Z,C; AND/IOR -> N,Z; MOV/BRA/BTG/CLR -> none
   CE_NF <= '1' when (op5 = b"01000" or op5 = b"01010" or op5 = b"01011" or
                      op5 = b"01100" or op5 = b"01110" or OP = b"11101010")
            else '0';
 
   CE_ZF <= '1' when (op5 = b"01000" or op5 = b"01010" or op5 = b"01011" or
                      op5 = b"01100" or op5 = b"01110" or OP = b"11101010")
            else '0';
 
   CE_OVF <= '1' when (op5 = b"01000" or op5 = b"01010" or
                       op5 = b"01011" or OP = b"11101010")
             else '0';
 
   CE_CF <= '1' when (op5 = b"01000" or op5 = b"01010" or
                      op5 = b"01011" or OP = b"11101010")
            else '0';
 
   ALUOP <= "000" when op5 = b"01000"    else   -- ADD  Wb + Ws
            "001" when op5 = b"01010"    else   -- SUB  Wb - Ws
            "010" when op5 = b"01100"    else   -- AND
            "011" when op5 = b"01110"    else   -- IOR
            "100" when op5 = b"01011"    else   -- SUBB Wb - lit5 - borrow
            "101" when OP  = b"11101010" else   -- NEG  0 - Ws
            "110" when OP  = b"11101011" else   -- CLR  Wd = 0
            "111" when OP  = b"10100010" else   -- BTG  Ws xor (1 << bit4)
            "000";                              -- default ('X' in the truth table)
 
end Behavioral;