# Logic System Lab

國立成功大學電機工程學系 **邏輯系統實驗 (Logic System Lab)** 的學習、複習與實作紀錄。

本 repository 整理課程中的 **Digital Logic Design、Verilog、Simulation 與 FPGA** 實作內容，並重新完成部分 Lab 與額外 Project。

重點不只是保存原本的課程作業，而是重新建立一套完整的 Digital Hardware Design workflow：

> **Specification → Architecture → Verilog → Testbench → Simulation → Waveform Verification → Debug → FPGA Implementation**

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

## Review Progress

| Lab | Status |
|---|---|
| Lab 01 — Mux & Demux | ✅ Completed |
| Lab 02 — Encoder & Decoder | 🔄 Reviewing |
| Lab 03 — Adder | ⏳ |
| Lab 04 — Sequential Circuits + Testbench | ⏳ |
| Lab 05 — LED & Button | ⏳ |
| Lab 06 — LED & PWM | ⏳ |
| Lab 07 — Whack-A-Mole & LFSR | ⏳ |
| Lab 08 — Dot-Matrix Display | ⏳ |

---

## Design Workflow

重新複習每個 Lab 時，主要依照以下流程完成設計與驗證：

```text
Specification
      │
      ▼
Architecture / Module Decomposition
      │
      ▼
Verilog Implementation
      │
      ▼
Testbench
      │
      ▼
Pre-Simulation
      │
      ▼
Waveform Verification
      │
      ▼
Debug & Re-Verification
      │
      ▼
FPGA Implementation
```

### Design

根據 Specification 確認：

- Input / Output
- Functional Requirement
- Signal Width
- Module Interface
- Module Hierarchy
- Combinational / Sequential Behavior

再將系統拆分成適當的 hardware modules 並完成 Verilog implementation。

### Verification

完成設計後撰寫 Testbench，透過 simulation 與 waveform 確認：

- Input stimulus 是否正確
- Output 是否符合 Specification
- Internal signal 是否符合預期
- Module connection 是否正確
- 是否出現非預期的 `X` / `Z`
- Clock / Reset behavior 是否正確

若結果錯誤，根據 waveform 定位問題並重新驗證，而不是只以 compile 或 synthesis 成功作為完成標準。

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

部分複習內容以 simulation 為主要驗證方式；需要實機的內容則視 FPGA 硬體環境進行 implementation 與 verification。

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

除了原本課程的 Practice 外，部分 Lab 會加入額外的小型 Project，使用該 Lab 學到的核心概念完成新的 Specification。

目的在於確認能否脫離原本題目，獨立完成：

```text
Read Specification
        ↓
Design Architecture
        ↓
Decompose Modules
        ↓
Implement Verilog
        ↓
Write Testbench
        ↓
Verify Waveform
        ↓
Debug
```

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

## Learning Goal

這次重新整理課程的主要目標，是從「能完成 Lab」進一步提升成能夠獨立完成 Digital Hardware Design：

> **看懂 Specification → 自行拆 Module → 寫 Verilog → 寫 Testbench → 看 Waveform → Debug → 完成 System Integration**

並以這些能力作為後續學習 **Computer Organization、RTL Design、VLSI Design、Digital IC Design 與 FPGA Design** 的基礎。

---

## Note

本 repository 主要保存自行撰寫、重新實作與整理的學習成果。

課程官方講義、原始完整結報、TA 提供的程式碼，以及其他非自行撰寫的教材不收錄於此 repository。

部分實作基於課程 Lab 的 Specification，程式碼、Testbench、驗證紀錄與 Additional Project 則以自行重新實作的版本為主。
