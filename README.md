# Logic System Lab

本 repository 整理 **邏輯系統實驗 (Logic System Lab)** 的 Verilog、Simulation、FPGA 實作與額外練習。

主要內容涵蓋：

> **Digital Logic Design → Verilog → Testbench → Simulation → FPGA**

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
| [Lab 01](./lab01) | **Mux & Demux** | Logic Gate、Universal Gate、Mux、Demux、Gate Level / Behavioral Level、Hierarchical Design、Testbench |
| Lab 02 | **Encoder & Decoder** | Encoder、Decoder、7-Segment Display、FPGA、LUT、IC Design Flow |
| Lab 03 | **Adder** | Half Adder、Full Adder、Ripple Carry Adder、Carry Lookahead Adder、Signed Addition、Subtraction |
| Lab 04 | **Sequential Circuits + Testbench** | Combinational / Sequential Circuit、Latch、Flip-Flop、Register、Counter、Clock、Testbench |
| Lab 05 | **LED & Button** | RTL Design、Always Block、Blocking / Non-blocking、LED / Button Application |
| Lab 06 | **LED & PWM** | Timer、Application Circuit、LED Control、PWM |
| Lab 07 | **Whack-A-Mole & LFSR** | LFSR、Pseudo-Randomness、Random Timing、Pre-Simulation、System Integration |
| Lab 08 | **Dot-Matrix Display** | 8×8 Dot-Matrix、Matrix Scanning、Frequency Divider、Display Control、3-Lane Car Runner Game |

> 已完成整理的 Lab 會加入對應 repository link。

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

目前已整理的內容：

```text
ncku-logic-system-lab/
│
├── README.md
│
└── lab01/
    ├── README.md
    ├── example/
    ├── images/
    ├── practice3/
    ├── practice4/
    └── project/
```

各 Lab 依實際內容保存：

- Verilog design files
- Testbench
- Simulation waveform
- Circuit / Architecture diagrams
- FPGA constraint files (`.xdc`) when applicable
- Design and verification notes
- Additional Project

詳細設計、程式碼與驗證紀錄請見各 Lab 的 `README.md`。

---

## Additional Projects

### Lab 01 — Programmable Bit Router

在 Lab 01 的 Mux、Demux 與 Hierarchical Design 基礎上，額外完成一個 **8-source to 8-destination programmable bit router**。

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

除了 source / destination selection 外，系統另外加入：

- `enable` — 控制訊號是否輸出
- `invert` — 控制 selected bit 是否反相

詳細內容請見 [Programmable Bit Router](./lab01/project)。

---

## Note

本 repository 主要用於保存自行重新實作、整理與驗證的學習成果。

課程官方講義、原始完整結報及其他完整課程教材不收錄於此 repository。

部分基礎 Verilog examples 依課堂內容重新整理，用於記錄不同描述方式與 hierarchical design 的基本概念。