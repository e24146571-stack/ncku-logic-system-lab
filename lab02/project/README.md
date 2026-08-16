# Lab 02 Mini-Project — Dual-Mode Priority Keypad Display

## 一、作業目的

設計一個 **16-key Priority Keypad Display System**。

系統接收 `key[15:0]`，當一個或多個 key 被按下時，依照可切換的 priority 規則選出其中一個 key，並將其編號顯示在兩個 7-Segment Display 上。

本題希望整合 Lab 02 的主要內容：

- Priority Encoder
- Decoder
- 7-Segment Display
- `always @(*)`
- `if / else`
- `case`
- `wire` / `reg`
- `localparam`
- Module Instantiation
- Hierarchical Design
- Testbench
- Waveform Verification

整個系統維持 **Combinational Logic**，不使用 clock 或 sequential circuit。

---

## 二、Top Module Interface

Top module 名稱：

```verilog
top_keypad_display
```

Port：

```verilog
module top_keypad_display (
    input  [15:0] key,
    input         enable,
    input         priority_mode,
    input         display_mode,
    output [3:0]  code,
    output        valid,
    output [6:0]  seg_tens,
    output [6:0]  seg_ones
);
```

---

## 三、功能規格

### 3.1 Priority Selection

`key[15:0]` 代表 16 個按鍵。

當多個 key 同時為 `1` 時，由 `priority_mode` 決定哪一個 key 被選中：

```text
priority_mode = 0
→ 高 index 優先
→ key[15] > key[14] > ... > key[0]

priority_mode = 1
→ 低 index 優先
→ key[0] > key[1] > ... > key[15]
```

被選中的 key index 輸出至：

```text
code[3:0]
```

例如：

```text
key[12] = 1
key[5]  = 1
key[2]  = 1
```

則：

```text
priority_mode = 0 → code = 12
priority_mode = 1 → code = 2
```

---

### 3.2 Valid / Enable

若至少有一個有效 key 被選中：

```text
valid = 1
```

若：

```text
key = 16'b0
```

或：

```text
enable = 0
```

則：

```text
valid = 0
code  = 4'b0000
```

此時兩個 7-Segment Display 都必須 blank。

Blank pattern：

```text
7'b1111111
```

---

### 3.3 Display Mode

`display_mode` 決定顯示方式。

#### HEX Mode

```text
display_mode = 0
```

將 `code` 顯示為：

```text
0 ~ 9, A, b, c, d, E, F
```

只使用 `seg_ones`：

```text
seg_tens → blank
seg_ones → HEX digit
```

例如：

```text
code = 12
→ display = c
```

---

#### Decimal Mode

```text
display_mode = 1
```

將 `code` 以十進位方式顯示：

```text
0 ~ 15
```

例如：

```text
code = 7  → display = 7
code = 12 → display = 12
code = 15 → display = 15
```

對於 `0 ~ 9`：

```text
seg_tens → blank
seg_ones → corresponding digit
```

對於 `10 ~ 15`：

```text
seg_tens → 1
seg_ones → 0 ~ 5
```

---

## 四、建議架構

內部 module 如何拆分可以自行設計。

一種可能的架構：

```text
key[15:0]
    │
    ▼
Priority Encoder
    │
    ├── code[3:0]
    └── valid
          │
          ▼
     Display Control
       ┌──┴──┐
       │     │
     HEX   Decimal
       │     │
       └──┬──┘
          │
          ▼
     7-Segment Output
```

不要求一定按照此架構實作，只要 top-level behavior 符合規格即可。

---

## 五、Testbench 要求

建立：

```text
tb_top_keypad_display.v
```

至少驗證：

- `key = 0`
- `enable = 0`
- 單一 key input
- `key[0]`
- `key[15]`
- 多個 key 同時 active
- High-index priority
- Low-index priority
- HEX mode 的 `0 ~ F`
- Decimal mode 的 `0 ~ 15`
- `9 → 10` 的 decimal boundary
- `valid = 0` 時兩個 display 都 blank

最後使用 waveform 驗證完整 system behavior。

---

## 六、限制

本題只使用 Lab 02 以前學過的 combinational logic 概念。

不需要：

- Clock
- Flip-Flop
- Register-based state
- Sequential Logic
- FSM

---

## 七、建議 Project Structure

```text
project/
├── README.md
├── Priority_Encoder16.v
├── Display_Controller.v
├── Decoder_7S.v
├── top_keypad_display.v
└── tb_top_keypad_display.v
```

檔名與內部 module 劃分可自行調整，只有 top module interface 建議保持一致。

完成後加入 final simulation waveform。
