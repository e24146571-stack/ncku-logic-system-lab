# Logic System Lab

國立成功大學電機工程學系 **Logic System Lab** 學習、複習與實作紀錄。

本 repository 主要整理課程中的 Verilog、Digital Logic Design、Simulation 與 FPGA 實作內容。

除了重新完成原本 Lab 的設計外，也會加入額外的小型 Project，練習從 Specification 出發，自行完成：

> **Specification → Architecture → Verilog → Testbench → Simulation → Waveform Verification → Debug → FPGA Implementation**

目標不是單純保存作業，而是建立完整且可獨立完成的 Digital Hardware Design workflow。

---

## Course Overview

整門課從基本的 Combinational Logic 開始，逐步進入 Sequential Circuit、RTL Design、Verification 與 FPGA Application。

```text
Combinational Logic
        │
        ▼
Mux / Demux / Encoder / Decoder / Adder
        │
        ▼
Sequential Circuit
        │
        ▼
Flip-Flop / Register / Counter / Clock
        │
        ▼
RTL System Design
        │
        ▼
Timer / Button / PWM / LFSR
        │
        ▼
FPGA Application & System Integration
```

---

## Lab Overview

| Lab | Topic | 主要內容 |
|---|---|---|
| [Lab 1](./lab1) | **Mux & Demux** | Logic Gate、Universal Gate、Mux、Demux、Gate Level / Behavioral Level、Hierarchical Design、Basic Testbench |
| Lab 2 | **Encoder & Decoder** | Encoder、Decoder、7-Segment Display、IC Design Flow、FPGA、LUT |
| Lab 3 | **Adder** | Half Adder、Full Adder、Ripple Carry Adder、Carry Lookahead Adder、Signed Addition、Subtraction |
| Lab 4 | **Sequential Circuits + Testbench** | Combinational vs Sequential Circuit、Latch、Flip-Flop、Register、Counter、Clock、Testbench |
| Lab 5 | **LED & Button** | RTL Design、Always Block、Blocking / Non-blocking、Application Circuit、LED、Button |
| Lab 6 | **LED & PWM** | Sequential System Review、Timer、LED Control、PWM |
| Lab 7 | **Whack-A-Mole & LFSR** | Pseudo-Randomness、LFSR、Random Timing、Pre-Simulation、System Integration |
| Lab 8 | **Dot-Matrix Display** | 8×8 Dot-Matrix、Matrix Scanning、Frequency Divider、Display Control、3-Lane Car Runner Game |

---

## Repository Status

| Lab | Status |
|---|---|
| Lab 1 — Mux & Demux | ✅ Completed |
| Lab 2 — Encoder & Decoder | 🔄 Reviewing |
| Lab 3 — Adder | ⏳ |
| Lab 4 — Sequential Circuits + Testbench | ⏳ |
| Lab 5 — LED & Button | ⏳ |
| Lab 6 — LED & PWM | ⏳ |
| Lab 7 — Whack-A-Mole & LFSR | ⏳ |
| Lab 8 — Dot-Matrix Display | ⏳ |

---

## Environment

### Software

- **AMD Vivado**
  - Verilog design
  - Behavioral Simulation
  - Synthesis
  - Implementation
  - Bitstream Generation

- **Visual Studio Code**
  - Verilog source code editing

- **Git / GitHub**
  - Version control
  - Lab documentation
  - Source code management

### Hardware

- **PYNQ-Z2 FPGA**

部分複習內容以 simulation 為主要驗證方式；需要 FPGA 的內容則依實際硬體環境進行實作。

---

## Repository Structure

```text
Logic_System_Lab/
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
│   └── README.md
│
├── lab3/
│   └── README.md
│
├── lab4/
│   └── README.md
│
├── lab5/
│   └── README.md
│
├── lab6/
│   └── README.md
│
├── lab7/
│   └── README.md
│
└── lab8/
    └── README.md
```

各 Lab 依實際內容可能包含：

```text
README.md
*.v
testbench
waveform
*.xdc
images
project/
```

每個 Lab 的詳細 Specification、設計架構、實作內容與驗證結果會記錄於各自的 `README.md`。

---

## Design Workflow

### 1. Specification

先確認：

- Input / Output
- Functional Requirement
- Timing Requirement
- Module Requirement
- Special Constraints

---

### 2. Architecture Design

根據 Specification 將系統拆分成適當的 hardware modules，並確認：

- 每個 module 負責的功能
- Module interface
- Signal width
- Module hierarchy
- Data flow

---

### 3. Verilog Implementation

依電路需求使用：

- Gate Level
- Continuous Assignment
- Behavioral Level
- Always Block
- Module Instantiation
- Hierarchical Design

完成 RTL / logic implementation。

---

### 4. Testbench

為主要 module 或 top module 建立 Testbench，設計足以涵蓋重要功能與 corner cases 的 input stimulus。

---

### 5. Pre-Simulation

在進行 synthesis 或 FPGA implementation 前，先確認 behavioral simulation 的功能正確。

主要檢查：

- Input stimulus 是否符合預期
- Output 是否正確
- Timing / Clock behavior 是否合理
- 是否出現非預期的 `X` / `Z`
- Module 之間的 signal connection 是否正確

---

### 6. Waveform Verification

不只確認 simulation 能執行，而是實際根據 waveform：

```text
Input
  ↓
Internal Signal
  ↓
State / Data Processing
  ↓
Output
```

逐段驗證 hardware behavior。

---

### 7. Debug

若結果不符合預期，依序檢查：

- Specification interpretation
- Boolean logic
- Signal width
- Port connection
- Module hierarchy
- Combinational / Sequential behavior
- Blocking / Non-blocking assignment
- Clock / Reset
- Testbench stimulus

---

### 8. FPGA Implementation

需要實機驗證的 Lab 會進一步執行：

```text
Verilog Design
      ↓
Pre-Simulation
      ↓
Synthesis
      ↓
Implementation
      ↓
Generate Bitstream
      ↓
Program FPGA
      ↓
Hardware Verification
```

---

## Main Topics

### Combinational Logic

- Logic Gate
- Boolean Logic
- NAND / NOR Universal Gate
- Multiplexer
- Demultiplexer
- Encoder
- Decoder
- Half Adder
- Full Adder
- Ripple Carry Adder
- Carry Lookahead Adder
- Comparator

---

### Sequential Logic

- Latch
- Flip-Flop
- Register
- Counter
- Clock
- Reset
- Timer
- Synchronous System

---

### Verilog / RTL

- Module
- Port
- Wire / Reg
- Vector
- Bit Select / Part Select
- Continuous Assignment
- Gate Primitive
- Always Block
- Blocking Assignment
- Non-blocking Assignment
- Case / If-Else
- Module Instantiation
- Hierarchical Design

---

### Verification

- Testbench
- Input Stimulus
- Behavioral Simulation
- Pre-Simulation
- Waveform Analysis
- Functional Verification
- Debugging

---

### FPGA

- FPGA Design Flow
- LUT
- Constraint File
- Synthesis
- Implementation
- Bitstream
- PYNQ-Z2
- LED
- Button
- 7-Segment Display
- PWM
- LFSR
- Dot-Matrix Display

---

## Additional Projects

除了課程原本的 Practice 外，我也會在部分 Lab 加入額外的小型 Project，作為該階段的能力驗收。

這些 Project 不以重複原題為目的，而是使用相同的核心知識完成新的 Specification。

### Lab 1

**Programmable Bit Router**

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

練習內容：

- Module Decomposition
- Mux / Demux
- Combinational Logic
- Hierarchical Design
- Testbench
- Waveform Verification

詳細內容請見：

[Lab 1](./lab1)

---

## Learning Goal

這次重新整理 Logic System Lab 的主要目的，是從原本「完成作業」進一步提升成能夠獨立完成 Digital Hardware Design。

希望最後能穩定做到：

```text
看到 Specification
        ↓
理解 Hardware Behavior
        ↓
自行拆 Module
        ↓
設計 Interface
        ↓
撰寫 Verilog
        ↓
撰寫 Testbench
        ↓
分析 Waveform
        ↓
找到 Bug
        ↓
修改並重新驗證
        ↓
完成 System Integration
```

並將這些能力作為後續學習：

- Computer Organization
- VLSI Design
- RTL Design
- Digital IC Design
- FPGA Design

的基礎。

---

## Note

本 repository 主要保存自行撰寫、重新實作與整理的學習成果。

課程官方講義、完整原始作業文件、原始報告，以及其他非自行撰寫的教材不收錄於此 repository。

部分內容源自課程 Lab 的 Specification，但程式碼、Testbench、整理與額外 Project 以自行重新實作的版本為主。
