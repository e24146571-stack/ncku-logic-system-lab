# Logic System Lab

本 repository 用來記錄 **Logic System Lab** 的學習、複習與實作成果。

課程內容以 **Verilog、Digital Logic Design 與 FPGA** 為主，從基礎的 combinational circuit 開始，逐步進入 sequential circuit、RTL design、testbench、simulation，以及較完整的 FPGA application。

除了重新整理原本課程中的 Lab，我也會加入額外的小型 Project，練習從 Specification 出發，獨立完成 hardware architecture、Verilog implementation 與 verification。

---

## Lab Overview

| Lab | Topic | 主要內容 |
|---|---|---|
| Lab 1 | Mux & Demux | Logic Gate、Mux、Demux、Hierarchical Design、Verilog Basics |
| Lab 2 | Encoder & Decoder | Encoder、Decoder、7-Segment Display、FPGA、LUT |
| Lab 3 | Adder | Half Adder、Full Adder、RCA、CLA、Signed Addition、Subtraction |
| Lab 4 | Sequential Circuits + Testbench | Latch、Flip-Flop、Register、Counter、Clock、Testbench |
| Lab 5 | LED & Button | RTL Design、Always Block、Blocking / Non-blocking、LED / Button Application |
| Lab 6 | LED & PWM | Timer、Application Circuit、PWM |
| Lab 7 | Whack-A-Mole & LFSR | LFSR、Pseudo-Randomness、Random Timing、System Integration |
| Lab 8 | Dot-Matrix Display | Matrix Scanning、Frequency Divider、Display Control、3-Lane Car Runner Game |

---

## Repository Structure

```text
Logic_System_Lab/
│
├── README.md
│
├── lab1/
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
- 額外練習或小型 Project

各 Lab 的詳細內容會記錄於對應資料夾中的 `README.md`。

---

## Design Workflow

重新複習這門課時，主要使用以下流程完成每個設計：

```text
Specification
      ↓
Architecture / Module Decomposition
      ↓
Verilog Implementation
      ↓
Testbench
      ↓
Pre-Simulation
      ↓
Waveform Verification
      ↓
Debug
      ↓
FPGA Implementation
```

重點不只是讓程式能夠 compile，而是確認自己能夠從功能需求開始，逐步設計出正確的硬體架構，並透過 simulation 驗證設計。

---

## Main Topics

### Combinational Logic

- Logic Gate
- Multiplexer / Demultiplexer
- Encoder / Decoder
- Adder / Subtractor
- Boolean Logic
- Hierarchical Design

### Sequential Logic

- Latch
- Flip-Flop
- Register
- Counter
- Clock
- Reset
- Synchronous System

### Verilog / RTL Design

- Gate Level
- Behavioral Level
- Continuous Assignment
- Always Block
- Blocking Assignment
- Non-blocking Assignment
- Vector
- Module Instantiation
- Hierarchical Module Design

### Verification

- Testbench
- Pre-Simulation
- Waveform Analysis
- Functional Verification
- Debugging

### FPGA Application

- PYNQ-Z2 FPGA
- 7-Segment Display
- LED
- Button
- PWM
- LFSR
- Dot-Matrix Display
- FPGA Implementation

---

## Tools

本 repository 主要使用：

- **Verilog**
- **AMD Vivado**
- **PYNQ-Z2 FPGA**
- **Visual Studio Code**
- **Git**
- **GitHub**

---

## Additional Projects

除了原本 Lab 的 Practice 外，也會加入額外的小型 Project，作為各階段的能力驗收。

這些 Project 主要練習：

- 閱讀 Specification
- Hardware Architecture Design
- Module Decomposition
- Module Interface Design
- Verilog Implementation
- Hierarchical Design
- Testbench Development
- Simulation
- Waveform Verification
- Debugging

額外 Project 會放在對應 Lab 的 `project/` 資料夾中。

---

## Goal

這份 repository 不只是保存課堂作業，而是重新建立完整的 Digital Hardware Design 能力。

希望能逐步做到：

> **看懂 Specification → 自行拆解 Hardware Modules → 撰寫 Verilog → 建立 Testbench → 分析 Waveform → Debug → 完成 System Integration**

並以此作為後續學習 Computer Organization、VLSI、Digital IC Design 與更大型 RTL Project 的基礎。

---

## Note

本 repository 主要保存自行撰寫、重新實作與整理的學習成果。

課程官方講義、完整原始作業文件，以及其他非自行撰寫的教材不收錄於此 repository。
