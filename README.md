# MiniPIC24

A single-cycle 16-bit processor implementing a subset of the **Microchip PIC24** instruction set, written in **VHDL** and simulated in **Xilinx ISE**.

Every instruction is fetched, decoded, executed and written back in a single clock cycle. The instruction encodings follow the real PIC24 format, so the program ROMs contain genuine PIC24 machine code.

## Features

- 16 general-purpose 16-bit registers (W0–W15)
- ALU with four status flags: **N** (negative), **OV** (overflow), **Z** (zero), **C** (carry)
- 32 × 24-bit program ROM, 16 × 16-bit data RAM
- Memory-mapped I/O: two input ports (INW0, INW1) and one output port (OUTW0)
- Conditional and unconditional branches with signed relative offsets

## Instruction set

| Instruction | Operation | Flags |
|---|---|---|
| `ADD Wb, Ws, Wd` | Wd = Wb + Ws | N, OV, Z, C |
| `SUB Wb, Ws, Wd` | Wd = Wb − Ws | N, OV, Z, C |
| `AND Wb, Ws, Wd` | Wd = Wb and Ws | N, Z |
| `IOR Wb, Ws, Wd` | Wd = Wb or Ws | N, Z |
| `MOV f, Wnd` | load from memory / input port | — |
| `MOV Wns, f` | store to memory / output port | — |
| `BRA Expr` | unconditional branch | — |
| `BRA Z/N/C/OV, Expr` | branch if flag is set | — |
| `BTG Ws, #bit4` | toggle one bit of Ws | — |
| `CLR Wd` | Wd = 0 | — |
| `NEG Ws, Wd` | Wd = −Ws (two's complement) | N, OV, Z, C |
| `SUBB Wb, #lit5, Wd` | Wd = Wb − lit5 − borrow (sticky Z) | N, OV, Z, C |

## Architecture

The top level is the schematic `PIC24.sch`, built from these blocks:

| Block | File | Role |
|---|---|---|
| ProgCnt | `ProgCnt.vhd` | Program counter |
| PC_Update | `PC_Update.vhd` | Next-PC logic and branch conditions |
| ROM32x24 | `ROM32x24.vhd` | Program memory |
| ctrl | `Ctrl.vhd` | Control unit |
| File_Regs | `File_Reg.vhd` | Register file |
| ALU | `ALU.vhd` | Arithmetic/logic unit and flags |
| DataMem | `DataMem.vhd` | Data RAM and I/O ports |
| MUX2V4 / MUX2V16 | `MUX2V4.vhd`, `MUX2V16.vhd` | Register and write-back selection |

## Verification

The design was verified with 13 behavioural simulations, each pairing a test program (ROM) with a testbench (`.tbw`):

| Test | ROM | Checks |
|---|---|---|
| All | `ROM32x24.vhd` | All common instructions |
| Z / N / C / OV | `ROM32X24_Z.vhd`, `_N`, `_C`, `_OV` | Each flag set to both 0 and 1 |
| BRA Z / N / C / OV | `ROM32x24_BRAZ.vhd`, `_BRAN`, `_BRAC`, `_BRAOV` | Branch taken and not taken |
| BTG | `ROM32X24_BTG_BIT4.vhd` | Toggling bits 0, 15 and 4; flags unchanged |
| CLR | `ROM32X24_CLR.vhd` | Clearing registers; flags unchanged |
| NEG | `ROM32X24_NEG.vhd` | All four flags, including the 0x8000 overflow case |
| SUBB | `ROM32X24_SUBB_LIT5.vhd` | Borrow propagation, sticky Z, overflow |

All ROM files declare the same entity (`ROM32x24`), so only one is included in the project at a time.

## Running a simulation

1. Open `PIC24.xise` in Xilinx ISE.
2. Make sure the desired `ROM32X24_*.vhd` is the ROM source in the project.
3. Switch to the **Simulation** view (Behavioral) and select the matching `TBW_*.tbw` testbench.
4. Run **Simulate Behavioral Model**.

## Documentation

The full documentation — instruction encodings, control signal table, block descriptions and simulation waveforms — is in [`Documentation.pdf`](Documentation.pdf).

---

Developed as a university project at the Faculty of Automation, Computers and Electronics, University of Craiova.
