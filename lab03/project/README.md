# Lab 03 Mini-Project — 8-bit Saturating Arithmetic Unit

## Project Description

設計一個 **8-bit signed Saturating Arithmetic Unit**。

系統需支援：

- Signed Addition
- Signed Subtraction
- Wrap-around arithmetic
- Saturating arithmetic
- Signed overflow detection
- Basic status flags

整個系統為 **Combinational Logic**。

本 Project 僅使用 Lab01 ~ Lab03 已學習的內容，不使用 Clock、Flip-Flop、Register 或 FSM。

---

## Top Module

```verilog
module Saturating_ALU_8 (
    input  [7:0] A,
    input  [7:0] B,
    input        OP,
    input        sat_enable,

    output [7:0] result,
    output       overflow,
    output       saturated,
    output       zero,
    output       negative
);
```

---

## Input Definition

### `A`, `B`

`A` 與 `B` 為 8-bit two's complement signed operands。

Signed 8-bit 可表示範圍：

```text
-128 ~ +127
```

---

### `OP`

選擇 arithmetic operation：

```text
OP = 0 → Addition
OP = 1 → Subtraction
```

即：

```text
OP = 0 → result = A + B
OP = 1 → result = A - B
```

Subtraction 應使用：

```text
A - B = A + (~B) + 1
```

並盡量與 addition 共用相同 arithmetic datapath。

---

### `sat_enable`

控制 overflow 發生時的輸出模式：

```text
sat_enable = 0 → Wrap-around Mode
sat_enable = 1 → Saturation Mode
```

---

## Functional Requirements

### 1. Normal Arithmetic

若 arithmetic operation 未發生 signed overflow：

```text
result = normal 8-bit arithmetic result
overflow = 0
saturated = 0
```

此時 `sat_enable` 不應改變最終結果。

---

### 2. Wrap-around Mode

當：

```text
sat_enable = 0
```

若 arithmetic operation 發生 signed overflow，系統仍輸出一般 8-bit two's complement wrap-around result。

例如：

```text
A = +127
B = +1
OP = 0
```

8-bit raw result 為：

```text
1000_0000
```

因此：

```text
result    = 8'b1000_0000
overflow  = 1
saturated = 0
```

---

### 3. Saturation Mode

當：

```text
sat_enable = 1
```

若 arithmetic operation 發生 signed overflow，必須將輸出限制在 signed 8-bit 可表示範圍。

#### Positive Overflow

若數學上的結果大於：

```text
+127
```

則：

```text
result = 8'b0111_1111
```

即：

```text
result = +127
```

#### Negative Overflow

若數學上的結果小於：

```text
-128
```

則：

```text
result = 8'b1000_0000
```

即：

```text
result = -128
```

當 saturation 實際發生時：

```text
overflow  = 1
saturated = 1
```

---

## Status Flags

### `overflow`

表示原始 arithmetic operation 是否發生 signed overflow。

```text
overflow = 1 → signed overflow occurred
overflow = 0 → no signed overflow
```

`overflow` 必須反映原始 arithmetic result，而不是 saturation 後的結果。

---

### `saturated`

表示最終輸出是否實際經過 saturation。

```text
saturated = 1
```

僅在：

```text
sat_enable = 1
AND
overflow = 1
```

時成立。

若：

```text
overflow = 1
sat_enable = 0
```

則：

```text
saturated = 0
```

---

### `zero`

根據最終輸出的 `result` 判斷：

```text
result == 0 → zero = 1
otherwise   → zero = 0
```

---

### `negative`

根據最終輸出的 `result` 判斷：

```text
result[7] = 1 → negative = 1
result[7] = 0 → negative = 0
```

---

## Design Requirements

系統應以清楚的 combinational datapath 完成。

建議架構概念：

```text
A / B / OP
    |
    v
Arithmetic Datapath
    |
    +--> Raw Result
    |
    +--> Overflow
            |
            v
    Saturation Control
            |
            v
        Final Result
            |
            v
       Status Flags
```

設計時應注意：

- Addition 與 subtraction 應盡量共用 hardware
- Overflow detection 必須同時支援 addition 與 subtraction
- Saturation logic 不可影響沒有 overflow 的正常結果
- 所有輸出皆須由 combinational logic 產生
- 不可使用 sequential logic

---

## Design Constraints

本 Project 不可使用：

- Clock
- Flip-Flop
- Register
- Counter
- FSM
- Sequential `always @(posedge clk)` block

可使用：

- `assign`
- `always @(*)`
- `if / else`
- `case`
- Boolean operators
- Arithmetic operators
- Module hierarchy
- MUX / control logic
- Lab03 已完成的 adder / ALU modules

---

## Required Test Cases

Testbench 必須使用 **self-checking verification**。

至少需涵蓋以下情況。

### Addition — Normal Cases

- Positive + Positive
- Negative + Negative
- Positive + Negative
- Result = 0
- Result = +127
- Result = -128

---

### Addition — Overflow Cases

必須包含：

- Positive overflow
- Negative overflow

每種 overflow case 都需分別測試：

```text
sat_enable = 0
sat_enable = 1
```

並確認：

```text
result
overflow
saturated
zero
negative
```

皆正確。

---

### Subtraction — Normal Cases

至少包含：

- Positive - Positive
- Positive - Negative
- Negative - Positive
- Negative - Negative
- Result = 0

---

### Subtraction — Overflow Cases

必須包含：

- Positive overflow
- Negative overflow

並分別驗證：

```text
Wrap-around Mode
Saturation Mode
```

---

### Boundary Cases

至少驗證：

```text
+127 + 0
-128 + 0
+127 - 0
-128 - 0
+127 - (-1)
-128 - 1
0 + 0
0 - 0
```

---

## Verification Requirements

Testbench 至少應完成：

- Automatic PASS / FAIL checking
- Addition verification
- Subtraction verification
- Overflow verification
- Saturation verification
- Boundary verification
- Status flag verification

Simulation 完成後應能由 console 清楚判斷所有 test cases 是否通過。

---

## Suggested Project Structure

```text
project/
├── README.md
├── Saturating_ALU_8.v
├── ...
└── tb_Saturating_ALU_8.v
```

實際 module 數量與 module hierarchy 可自行設計。

---

## Completion Criteria

Project 完成時至少需滿足：

- [ ] Signed Addition 正確
- [ ] Signed Subtraction 正確
- [ ] Wrap-around Mode 正確
- [ ] Saturation Mode 正確
- [ ] Positive Overflow 正確
- [ ] Negative Overflow 正確
- [ ] `overflow` flag 正確
- [ ] `saturated` flag 正確
- [ ] `zero` flag 正確
- [ ] `negative` flag 正確
- [ ] Self-checking Testbench 完成
- [ ] 所有 required test cases 通過
