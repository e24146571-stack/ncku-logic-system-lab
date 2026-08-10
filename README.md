# Logic System Lab

本 repository 整理課程中的 **Digital Logic Design、Verilog、Simulation 與 FPGA** 實作內容與額外練習。

---

## Course Information

| Item | Information |
|---|---|
| Course | 邏輯系統實驗 (Logic System Lab) |
| Semester | 2026 Spring |
| Instructor | 陳中和 |
| Department | 國立成功大學 電機工程學系 |
| Language | Verilog |
| FPGA Board | PYNQ-Z2 |

---

## Lab Overview

| Lab | Topic | 主要內容 |
|---|---|---|
| [Lab 01](./lab1) | **Mux & Demux** | Logic Gate、Universal Gate、Mux、Demux、Gate Level / Behavioral Level、Hierarchical Design、Testbench |
| Lab 02 | **Encoder & Decoder** | Encoder、Decoder、7-Segment Display、FPGA、LUT、IC Design Flow |
| Lab 03 | **Adder** | Half Adder、Full Adder、Ripple Carry Adder、Carry Lookahead Adder、Signed Addition、Subtraction |
| Lab 04 | **Sequential Circuits + Testbench** | Combinational / Sequential Circuit、Latch、Flip-Flop、Register、Counter、Clock、Testbench |
| Lab 05 | **LED & Button** | RTL Design、Always Block、Blocking / Non-blocking、LED / Button Application |
| Lab 06 | **LED & PWM** | Timer、Application Circuit、LED Control、PWM |
| Lab 07 | **Whack-A-Mole & LFSR** | LFSR、Pseudo-Randomness、Random Timing、Pre-Simulation、System Integration |
| Lab 08 | **Dot-Matrix Display** | 8×8 Dot-Matrix、Matrix Scanning、Frequency Divider、Display Control、3-Lane Car Runner Game |

---

## Environment

### Software

- **AMD Vivado**
  - Verilog Design
  - Behavioral Simulation
  - Synthesis
  - Implementation
  - Bitstream Generation

- **Visual Studio Code**
  - Verilog source code editing

- **Git / GitHub**
  - Version Control
  - Source Code Management
  - Documentation

### Hardware

- **PYNQ-Z2 FPGA**

---

## Repository Structure

```text
ncku-logic-system-lab/
│
├── README.md
│
├── lab1/
│   ├── README.md
│   ├── P3/
│   ├── P4/
│   └── project/
│
├── lab2/
├── lab3/
├── lab4/
├── lab5/
├── lab6/
├── lab7/
└── lab8/
```

各 Lab 依實際內容保存：

- Verilog design files
- Testbench
- Simulation results
- Waveform screenshots
- FPGA constraint files (`.xdc`)
- Design / Architecture 說明
- Additional Project

詳細的設計與驗證紀錄會整理在各 Lab 的 `README.md`。

---

## Additional Projects

### Lab 01 — Programmable Bit Router

使用 Lab 01 的 Mux、Demux、Combinational Logic 與 Hierarchical Design 完成一個可程式化的 bit routing system。

```text
src[7:0]
   │
   ▼
Mux_8to1
   │
selected_bit
   │
   ▼
Bit_Controller
   │
channel
   │
   ▼
Demux_1to8
   │
   ▼
dst[7:0]
```

詳細內容請見 [Lab 01](./lab1)。

---

## Note

本 repository 主要保存自行撰寫、重新實作與整理的學習成果。

課程官方講義、原始完整結報、TA 提供的程式碼，以及其他非自行撰寫的教材不收錄於此 repository。

