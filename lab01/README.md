# Lab 01 — Mux & Demux

本 Lab 為 Logic System Lab 的第一個實驗，從基本 Logic Gate 開始，進一步建立 Mux / Demux 的 combinational circuit，並開始使用 Verilog 描述與驗證 Digital Logic。

主要練習從 Boolean Logic 與 Gate-Level circuit 出發，逐步進入：

> **Logic Gate → Mux / Demux → Hierarchical Design → Verilog → Testbench → Simulation**

---

## Topics

- Logic Gate
  - AND / OR / XOR / NOT
  - NAND / NOR
- Functional Completeness
- Universal Gate
- Multiplexer (Mux)
- Demultiplexer (Demux)
- Gate-Level Circuit
- Hierarchical Design
- Area / Speed Comparison
- Critical Path
- Basic Logical Effort
- TTL Noise Margin
- Verilog
  - Gate Level
  - Behavioral Level
  - Vector
  - Wire
  - Continuous Assignment
  - Module Instantiation
- Testbench
- Waveform Verification

---

## Logic Gate & Universal Gate

課程前半部從基本 Logic Gate 的功能開始，並利用不同 control value 觀察：

- AND：Block / Clear 或 Pass
- OR：Keep 或 Set
- XOR：Keep 或 Toggle

接著利用 **Functional Completeness** 的概念，練習只使用：

- NAND
- NOR

實作 AND、OR、XOR 與 NOT，理解 NAND 與 NOR 作為 Universal Gate 的特性。

---

## Mux & Demux

本 Lab 的主要 combinational system 為：

```text
src
 │
 ▼
Mux
 │
 ▼
channel
 │
 ▼
Demux
 │
 ▼
dst
```

Mux 根據 `src_sel` 從多個 source 中選出一個訊號送入 `channel`。

Demux 則根據 `dst_sel` 將 `channel` 導向指定的 destination。

---

## Architecture Comparison

課程中分別使用兩種 architecture 實作 4:1 Mux 與 1:4 Demux，並比較不同電路結構的 Area 與 Speed。

### 4:1 Mux

- **v1**：直接利用 selection condition、AND 與 OR 建構
- **v2**：以多層 2:1 Mux 組成 hierarchical structure

| Design | Area | Estimated Delay |
|---|---:|---:|
| Mux v1 | 70 | ≈ 28.64 |
| Mux v2 | 58 | ≈ 28.64 |

在此分析條件下，兩種 architecture 的 estimated delay 相同，但 v2 使用較少的 hardware area。

### 1:4 Demux

- **v1**：直接產生四組 selection condition 並控制四個 output
- **v2**：以兩層 1:2 Demux 建構 hierarchical structure

| Design | Area | Estimated Delay |
|---|---:|---:|
| Demux v1 | 52 | ≈ 18.03 |
| Demux v2 | 40 | ≈ 17.07 |

v2 不只使用較少的 hardware area，在此分析條件下也具有較小的 estimated delay。

> 此處 Area 依 Lab Appendix 以 transistor count 估算；Speed 則根據 Critical Path 與 Logical Effort 進行比較。

---

## Practice

## Practice 3 — 4:1 Mux + 1:4 Demux

[查看 Practice 3](./P3)

使用 Verilog 建立：

```text
src[3:0]
    │
    ▼
GL_Mux_4to1
    │
  channel
    │
    ▼
CB_Demux_1to4
    │
    ▼
dst[3:0]
```

### Design

Mux 使用 **Gate Level** 實作：

```text
GL_Mux_4to1
```

Demux 則使用 hierarchical design：

```text
CB_Demux_1to4
      │
      ├── Demux_1to2
      ├── Demux_1to2
      └── Demux_1to2
```

最後由：

```text
top_4
```

整合 Mux 與 Demux。

### Files

```text
P3/
├── GL_Mux_4to1.v
├── Demux_1to2.v
├── CB_Demux_1to4.v
├── top_4.v
├── tb_GL_Mux_4to1.v
├── tb_CB_Demux_1to4.v
└── tb_top_4.v
```

---

## Practice 4 — 8:1 Mux + 1:8 Demux

[查看 Practice 4](./P4)

將 P3 的 system 擴充為：

```text
src[7:0]
    │
    ▼
BL_Mux_8to1
    │
  channel
    │
    ▼
BL_Demux_1to8
    │
    ▼
dst[7:0]
```

Mux 與 Demux 皆以課程中的 **Behavior Level** 方式實作。

### Files

```text
P4/
├── BL_Mux_8to1.v
├── BL_Demux_1to8.v
├── top_8.v
└── tb_top_8.v
```

透過 `tb_top_8.v` 驗證不同 `src_sel`、`dst_sel` 與 source value 下的完整 routing behavior。

---

## Additional Project — Programmable Bit Router

[查看 Programmable Bit Router](./project)


系統除了 Mux / Demux 外，再加入 `enable` 與 `invert` control：

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

主要 modules：

```text
Mux_8to1
Bit_Controller
Demux_1to8
top_router
```

此 Project 練習將 Lab 01 的概念應用到新的 Specification，並獨立完成：

- Module Decomposition
- Module Interface Design
- Combinational Logic
- Hierarchical Design
- Verilog Implementation
- Testbench
- Waveform Verification

---

## Repository Structure

```text
lab1/
│
├── README.md
│
├── P3/
│   ├── GL_Mux_4to1.v
│   ├── Demux_1to2.v
│   ├── CB_Demux_1to4.v
│   ├── top_4.v
│   └── testbench...
│
├── P4/
│   ├── BL_Mux_8to1.v
│   ├── BL_Demux_1to8.v
│   ├── top_8.v
│   └── tb_top_8.v
│
└── project/
    ├── README.md
    ├── Mux_8to1.v
    ├── Bit_Controller.v
    ├── Demux_1to8.v
    ├── top_router.v
    └── tb_top_router.v
```

