VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Clk
        SIGNAL New_PC(5:0)
        SIGNAL NF
        SIGNAL OVF
        SIGNAL ZF
        SIGNAL CF
        SIGNAL Branch
        SIGNAL PC(5:0)
        SIGNAL PC(5:1)
        SIGNAL Instr(23:0)
        SIGNAL Instr(18:15)
        SIGNAL Instr(14:11)
        SIGNAL Instr(18:16)
        SIGNAL Instr(10:7)
        SIGNAL Instr(3:0)
        SIGNAL RegDest(3:0)
        SIGNAL RegBase(3:0)
        SIGNAL WrData(15:0)
        SIGNAL MEMout(15:0)
        SIGNAL XLXN_84(15:0)
        SIGNAL ALUout(15:0)
        SIGNAL OUTW0(15:0)
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL MemWr
        SIGNAL Instr(8:4)
        SIGNAL XLXN_96(15:0)
        SIGNAL Mem2Reg
        SIGNAL RegWr
        SIGNAL CE_ZF
        SIGNAL CE_NF
        SIGNAL CE_OVF
        SIGNAL CE_CF
        SIGNAL ALUOP(2:0)
        SIGNAL Instr(4:0)
        SIGNAL Instr(15:12)
        SIGNAL DestSel
        SIGNAL BaseSel
        SIGNAL Instr(23:16)
        PORT Input Clk
        PORT Output OUTW0(15:0)
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2026 8 25 16 6 38
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2026 8 25 16 6 30
            LINE N 64 480 0 480 
            LINE N 64 512 0 512 
            LINE N 64 544 0 544 
            LINE N 64 576 0 576 
            RECTANGLE N 320 436 384 460 
            LINE N 384 448 320 448 
            LINE N 384 352 320 352 
            RECTANGLE N 320 388 384 412 
            LINE N 384 400 320 400 
            LINE N 384 176 320 176 
            RECTANGLE N 320 164 384 188 
            LINE N 0 144 64 144 
            RECTANGLE N 0 132 64 156 
            RECTANGLE N 64 104 320 608 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24
            TIMESTAMP 2026 8 25 17 27 0
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V4
            TIMESTAMP 2026 8 25 18 1 50
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2026 8 25 18 1 38
            RECTANGLE N 64 -384 384 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 384 -364 448 -340 
            LINE N 384 -352 448 -352 
            RECTANGLE N 384 -44 448 -20 
            LINE N 384 -32 448 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2026 8 25 18 1 32
            RECTANGLE N 64 -384 368 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2026 8 25 18 1 46
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2026 8 25 18 22 50
            LINE N 64 32 0 32 
            LINE N 64 96 0 96 
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            RECTANGLE N 0 276 64 300 
            LINE N 64 288 0 288 
            LINE N 320 32 384 32 
            LINE N 320 96 384 96 
            LINE N 320 160 384 160 
            LINE N 320 224 384 224 
            LINE N 64 -608 0 -608 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 64 -640 320 320 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrl
            TIMESTAMP 2026 8 26 23 13 32
            RECTANGLE N 64 -704 320 0 
            RECTANGLE N 0 -684 64 -660 
            LINE N 64 -672 0 -672 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK U_ROM32x24 ROM32x24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK MUX2V4_Dest MUX2V4
            PIN Sel DestSel
            PIN I0(3:0) Instr(10:7)
            PIN I1(3:0) Instr(3:0)
            PIN Y(3:0) RegDest(3:0)
        END BLOCK
        BEGIN BLOCK MUX2V4_Base MUX2V4
            PIN Sel BaseSel
            PIN I0(3:0) Instr(18:15)
            PIN I1(3:0) Instr(14:11)
            PIN Y(3:0) RegBase(3:0)
        END BLOCK
        BEGIN BLOCK U_File_Regs File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdReg1(3:0) RegBase(3:0)
            PIN RdReg2(3:0) Instr(3:0)
            PIN WrReg(3:0) RegDest(3:0)
            PIN WRData(15:0) WrData(15:0)
            PIN RdData1(15:0) XLXN_84(15:0)
            PIN RdData2(15:0) XLXN_96(15:0)
        END BLOCK
        BEGIN BLOCK U_DataMem DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) XLXN_96(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) MEMout(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX2V16 MUX2V16
            PIN Sel Mem2Reg
            PIN I0(15:0) ALUout(15:0)
            PIN I1(15:0) MEMout(15:0)
            PIN Y(15:0) WrData(15:0)
        END BLOCK
        BEGIN BLOCK U_ALU ALU
            PIN Clk Clk
            PIN RdData1(15:0) XLXN_84(15:0)
            PIN RdData2(15:0) XLXN_96(15:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN lit5(4:0) Instr(4:0)
            PIN Y(15:0) ALUout(15:0)
            PIN CE_ZF CE_ZF
            PIN CE_NF CE_NF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN bit4(3:0) Instr(15:12)
            PIN NF NF
            PIN CF CF
            PIN OVF OVF
            PIN ZF ZF
        END BLOCK
        BEGIN BLOCK U_ProgCnt ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK U_PC_Update PC_Update
            PIN Branch Branch
            PIN Offset(4:0) Instr(4:0)
            PIN BranchType(2:0) Instr(18:16)
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
            PIN NF NF
            PIN OVF OVF
            PIN ZF ZF
            PIN CF CF
        END BLOCK
        BEGIN BLOCK U_ctrl ctrl
            PIN OP(7:0) Instr(23:16)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN RegDest DestSel
            PIN RegBase BaseSel
            PIN Branch Branch
            PIN CE_ZF CE_ZF
            PIN CE_NF CE_NF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE U_ProgCnt 288 1328 R0
            BEGIN DISPLAY 128 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_PC_Update 272 384 R0
            BEGIN DISPLAY 112 -8 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Clk
            WIRE 256 1232 288 1232
        END BRANCH
        BEGIN BRANCH New_PC(5:0)
            WIRE 80 528 272 528
            WIRE 80 528 80 912
            WIRE 80 912 80 1296
            WIRE 80 1296 288 1296
            BEGIN DISPLAY 80 912 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NF
            WIRE 240 864 272 864
            BEGIN DISPLAY 240 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OVF
            WIRE 240 896 272 896
            BEGIN DISPLAY 240 896 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ZF
            WIRE 240 928 272 928
            BEGIN DISPLAY 240 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CF
            WIRE 240 960 272 960
            BEGIN DISPLAY 240 960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 656 736 688 736
            BEGIN DISPLAY 688 736 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        IOMARKER 256 1232 Clk R180 28
        BEGIN INSTANCE U_ALU 2192 1920 R0
            BEGIN DISPLAY 144 376 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_MUX2V16 2832 1472 R0
            BEGIN DISPLAY 144 104 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE U_ROM32x24 960 992 R0
            BEGIN DISPLAY 96 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(23:0)
            WIRE 1072 1312 1424 1312
            WIRE 1072 1312 1072 1440
            WIRE 1344 960 1360 960
            WIRE 1360 960 1424 960
            WIRE 1424 960 1424 976
            WIRE 1424 976 1424 1040
            WIRE 1424 1040 1424 1312
            WIRE 1424 256 1424 416
            WIRE 1424 416 1424 624
            WIRE 1424 624 1424 688
            WIRE 1424 688 1424 784
            WIRE 1424 784 1424 832
            WIRE 1424 832 1424 960
            BEGIN DISPLAY 1360 960 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 656 560 800 560
            WIRE 800 560 800 1104
            WIRE 800 1104 800 1232
            WIRE 672 1232 800 1232
            BEGIN DISPLAY 800 1104 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(5:1)
            WIRE 912 960 928 960
            WIRE 928 960 960 960
            BEGIN DISPLAY 912 960 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BUSTAP 1424 976 1520 976
        BEGIN BRANCH Instr(18:15)
            WIRE 1520 976 1536 976
            WIRE 1536 976 1584 976
            BEGIN DISPLAY 1536 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1424 1040 1520 1040
        BEGIN BRANCH Instr(14:11)
            WIRE 1520 1040 1536 1040
            WIRE 1536 1040 1584 1040
            BEGIN DISPLAY 1536 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1424 784 1328 784
        BEGIN BRANCH Instr(4:0)
            WIRE 656 784 768 784
            WIRE 768 784 992 784
            WIRE 992 784 1328 784
            BEGIN DISPLAY 992 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1424 832 1328 832
        BEGIN BRANCH Instr(18:16)
            WIRE 656 832 992 832
            WIRE 992 832 1328 832
            BEGIN DISPLAY 992 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1424 624 1520 624
        BEGIN BRANCH Instr(10:7)
            WIRE 1520 624 1536 624
            WIRE 1536 624 1584 624
            BEGIN DISPLAY 1536 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1424 688 1520 688
        BEGIN BRANCH Instr(3:0)
            WIRE 1520 688 1536 688
            WIRE 1536 688 1584 688
            BEGIN DISPLAY 1536 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_File_Regs 2160 576 R0
            BEGIN DISPLAY 144 72 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BUSTAP 1424 416 1520 416
        BEGIN BRANCH RegDest(3:0)
            WIRE 1968 560 2016 560
            WIRE 2016 560 2064 560
            WIRE 2064 480 2160 480
            WIRE 2064 480 2064 560
            BEGIN DISPLAY 2016 560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase(3:0)
            WIRE 1968 912 2096 912
            WIRE 2096 352 2160 352
            WIRE 2096 352 2096 736
            WIRE 2096 736 2096 912
            BEGIN DISPLAY 2096 736 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2128 544 2128 608
            WIRE 2128 608 3280 608
            WIRE 3280 608 3456 608
            WIRE 3456 608 3456 1312
            WIRE 2128 544 2160 544
            WIRE 3216 1312 3456 1312
            BEGIN DISPLAY 3280 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MEMout(15:0)
            WIRE 2816 1440 2832 1440
            WIRE 2816 1440 2816 1536
            WIRE 2816 1536 3088 1536
            WIRE 3088 1536 3296 1536
            WIRE 3168 1088 3296 1088
            WIRE 3296 1088 3296 1536
            BEGIN DISPLAY 3088 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_84(15:0)
            WIRE 2160 704 2160 1632
            WIRE 2160 1632 2176 1632
            WIRE 2176 1632 2192 1632
            WIRE 2160 704 2640 704
            WIRE 2608 224 2640 224
            WIRE 2640 224 2640 704
        END BRANCH
        BEGIN BRANCH ALUout(15:0)
            WIRE 2576 1824 2592 1824
            WIRE 2592 1824 2736 1824
            WIRE 2736 1376 2832 1376
            WIRE 2736 1376 2736 1600
            WIRE 2736 1600 2736 1824
            BEGIN DISPLAY 2736 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUTW0(15:0)
            WIRE 3168 768 3184 768
            WIRE 3184 768 3200 768
        END BRANCH
        BEGIN BRANCH INW0(15:0)
            WIRE 2560 896 2720 896
            WIRE 2720 896 2736 896
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 2560 960 2720 960
            WIRE 2720 960 2736 960
        END BRANCH
        BEGIN INSTANCE U_DataMem 2736 1120 R0
            BEGIN DISPLAY 128 -488 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        IOMARKER 3200 768 OUTW0(15:0) R0 28
        IOMARKER 2560 960 INW1(15:0) R180 28
        IOMARKER 2560 896 INW0(15:0) R180 28
        BEGIN BRANCH Clk
            WIRE 2720 768 2736 768
            BEGIN DISPLAY 2720 768 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 2720 832 2736 832
            BEGIN DISPLAY 2720 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(8:4)
            WIRE 2592 1024 2704 1024
            WIRE 2704 1024 2736 1024
            BEGIN DISPLAY 2592 1024 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_96(15:0)
            WIRE 2080 1120 2608 1120
            WIRE 2080 1120 2080 1168
            WIRE 2080 1168 2080 1184
            WIRE 2080 1184 2080 1696
            WIRE 2080 1696 2176 1696
            WIRE 2176 1696 2192 1696
            WIRE 2080 1184 2720 1184
            WIRE 2608 544 2608 1120
            WIRE 2720 1088 2736 1088
            WIRE 2720 1088 2720 1184
        END BRANCH
        BEGIN INSTANCE MUX2V4_Base 1584 1072 R0
            BEGIN DISPLAY 112 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN INSTANCE MUX2V4_Dest 1584 720 R0
            BEGIN DISPLAY 96 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(3:0)
            WIRE 1520 416 1776 416
            WIRE 1776 416 2160 416
            BEGIN DISPLAY 1776 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2144 224 2160 224
            BEGIN DISPLAY 2144 224 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2144 288 2160 288
            BEGIN DISPLAY 2144 288 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 2816 1312 2832 1312
            BEGIN DISPLAY 2816 1312 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NF
            WIRE 2576 1952 2592 1952
            BEGIN DISPLAY 2592 1952 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CF
            WIRE 2576 2016 2592 2016
            BEGIN DISPLAY 2592 2016 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OVF
            WIRE 2576 2080 2592 2080
            BEGIN DISPLAY 2592 2080 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ZF
            WIRE 2576 2144 2592 2144
            BEGIN DISPLAY 2592 2144 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 2176 1952 2192 1952
            BEGIN DISPLAY 2176 1952 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 2176 2016 2192 2016
            BEGIN DISPLAY 2176 2016 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 2176 2080 2192 2080
            BEGIN DISPLAY 2176 2080 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 2176 2144 2192 2144
            BEGIN DISPLAY 2176 2144 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2176 1760 2192 1760
            BEGIN DISPLAY 2176 1760 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 2176 1824 2192 1824
            BEGIN DISPLAY 2176 1824 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(15:12)
            WIRE 2176 2208 2192 2208
            BEGIN DISPLAY 2176 2208 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2176 1312 2192 1312
            BEGIN DISPLAY 2176 1312 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DestSel
            WIRE 1568 560 1584 560
            BEGIN DISPLAY 1568 560 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BaseSel
            WIRE 1568 912 1584 912
            BEGIN DISPLAY 1568 912 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ctrl 1248 2112 R0
            BEGIN DISPLAY 160 40 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH MemWr
            WIRE 1632 1440 1648 1440
            BEGIN DISPLAY 1648 1440 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 1632 1504 1648 1504
            BEGIN DISPLAY 1648 1504 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 1632 1568 1648 1568
            BEGIN DISPLAY 1648 1568 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH DestSel
            WIRE 1632 1632 1648 1632
            BEGIN DISPLAY 1648 1632 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BaseSel
            WIRE 1632 1696 1648 1696
            BEGIN DISPLAY 1648 1696 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 1632 1760 1648 1760
            BEGIN DISPLAY 1648 1760 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 1632 1824 1648 1824
            BEGIN DISPLAY 1648 1824 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 1632 1888 1648 1888
            BEGIN DISPLAY 1648 1888 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 1632 1952 1648 1952
            BEGIN DISPLAY 1648 1952 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 1632 2016 1648 2016
            BEGIN DISPLAY 1648 2016 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 1632 2080 1648 2080
            BEGIN DISPLAY 1648 2080 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:16)
            WIRE 1168 1440 1184 1440
            WIRE 1184 1440 1248 1440
            BEGIN DISPLAY 1184 1440 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1072 1440 1168 1440
    END SHEET
END SCHEMATIC
