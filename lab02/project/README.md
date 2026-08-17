# Lab 02 Mini-Project — Dual-Mode Priority Keypad Display

## Project Description

設計一個 **16-key Priority Keypad Display System**。

系統接收 `key[15:0]`，當一個或多個 key 同時 active 時，依照 `priority_mode` 選出其中一個 key，並將其 index 輸出為 `code[3:0]`。

另外可透過 `display_mode` 切換 HEX / Decimal 顯示方式。

整個系統為 **Combinational Logic**，不使用 clock、Flip-Flop 或 FSM。

---

## Top Module

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

## Functional Requirements

### Priority Mode

```text
priority_mode = 0
→ High-index priority
→ key[15] > key[14] > ... > key[0]

priority_mode = 1
→ Low-index priority
→ key[0] > key[1] > ... > key[15]
```

例如：

```text
key[14] = 1
key[7]  = 1
key[4]  = 1
```

則：

```text
priority_mode = 0 → code = 14
priority_mode = 1 → code = 4
```

---

### Enable / Valid

若至少有一個 key active 且：

```text
enable = 1
```

則：

```text
valid = 1
code  = selected key index
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
code  = 0
```

此時：

```text
seg_tens = 7'b1111111
seg_ones = 7'b1111111
```

---

### HEX Mode

```text
display_mode = 0
```

將 `code` 顯示為：

```text
0 ~ 9, A, b, c, d, E, F
```

其中：

```text
seg_tens → blank
seg_ones → HEX digit
```

---

### Decimal Mode

```text
display_mode = 1
```

將 `code` 顯示為：

```text
0 ~ 15
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

7-Segment Display 使用 active-low encoding。

---

## Project Structure

```text
project/
├── README.md
├── Priority_Encoder16.v
├── Decoder_7S.v
├── top_keypad_display.v
└── tb_top_keypad_display.v
```

### Modules

- `Priority_Encoder16.v`
  - 16-input Priority Encoder
  - 支援 High-index / Low-index priority
  - 輸出 selected code 與 valid information

- `Decoder_7S.v`
  - HEX / Decimal display conversion
  - 輸出兩組 active-low 7-Segment signals

- `top_keypad_display.v`
  - 整合 Encoder、enable control 與 Decoder

- `tb_top_keypad_display.v`
  - Top-level Testbench

---

## Verification Requirements

Testbench 至少驗證：

- `key = 0`
- `enable = 0`
- Single active key
- `key[0]`
- `key[15]`
- Multiple active keys
- High-index priority
- Low-index priority
- `key[0] ~ key[15]` single-key verification
- HEX mode
- Decimal mode
- Decimal `9 → 10` boundary
- Decimal upper boundary `15`
- `valid = 0` 時兩個 display 都 blank

---

## Result

Project 已完成並使用 **self-checking Testbench** 驗證。

Final XSim simulation 中：

```text
test 1 ~ test 13 passed
single-key test 0 ~ 15 passed
```

所有設定的 test cases 皆通過。

本 Project 未另外保存完整 waveform screenshot，主要以 Testbench console 的 PASS / FAIL result 作為 verification。
