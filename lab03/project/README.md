# Lab 03 Mini-Project — 8-bit Saturating Arithmetic Unit

## 專案說明

本 Mini-Project 延伸 Lab03 的 Adder、Signed Addition、Subtraction 與 Overflow Detection，設計一個 **8-bit signed Saturating Arithmetic Unit**。

系統支援：

- Signed Addition / Subtraction
- Signed Overflow Detection
- Wrap-around Arithmetic
- Saturating Arithmetic
- `zero` / `negative` Status Flags

整體設計皆為 **Combinational Logic**，不使用 Clock、Flip-Flop、Register 或 FSM。

---

## 功能說明

### Arithmetic Operation

`OP` 用來選擇運算模式：

```text
OP = 0 → A + B
OP = 1 → A - B
```

Addition 與 Subtraction 共用同一組 arithmetic datapath。

Subtraction 利用 two's complement：

```text
B_in      = B XOR OP
raw_result = A + B_in + OP
```

因此：

```text
OP = 0 → B_in = B  → A + B
OP = 1 → B_in = ~B → A + ~B + 1 = A - B
```

---

### Saturation Mode

`sat_enable` 用來決定 Overflow 發生時的處理方式：

```text
sat_enable = 0 → Wrap-around Mode
sat_enable = 1 → Saturation Mode
```

當 `sat_enable = 0` 時，保留一般 8-bit two's complement 的 wrap-around result。

當 `sat_enable = 1` 且發生 signed overflow 時：

```text
Positive Overflow → result = +127 = 8'b0111_1111
Negative Overflow → result = -128 = 8'b1000_0000
```

---

## Status Flags

| Signal | 說明 |
|---|---|
| `overflow` | 原始 signed arithmetic operation 是否超出 8-bit signed range |
| `saturated` | 最終輸出是否實際經過 saturation |
| `zero` | 最終 `result` 是否為 0 |
| `negative` | 最終 `result` 是否為負數 |

其中：

- `overflow` 反映的是 saturation 前的原始 arithmetic result。
- `zero` 與 `negative` 則根據 saturation 後的最終 `result` 判斷。

---

## 系統架構

```text
      A, B, OP
          │
          ▼
 ┌────────────────────┐
 │ Arithmetic_Unit_8  │
 │                    │
 │ ADD / SUB          │
 │ Overflow Detection │
 └─────────┬──────────┘
           │
     raw_result
      overflow
           │
           ▼
 ┌──────────────────────┐
 │ Saturation_Control_8 │
 │                      │
 │ Wrap / Saturate      │
 └──────────┬───────────┘
            │
      result, saturated
            │
            ▼
 ┌────────────────────┐
 │ Saturating_ALU_8   │
 │                    │
 │ zero / negative    │
 └────────────────────┘
```

### Module 分工

#### `Arithmetic_Unit_8.v`

負責：

- Signed Addition / Subtraction
- 產生 `raw_result`
- Signed Overflow Detection

#### `Saturation_Control_8.v`

負責：

- Wrap-around / Saturation Mode 選擇
- Positive / Negative Overflow 的飽和處理
- 產生 `saturated`

#### `Saturating_ALU_8.v`

Top module，負責：

- 整合 `Arithmetic_Unit_8`
- 整合 `Saturation_Control_8`
- 根據最終 `result` 產生 `zero` 與 `negative`

---

## Project Structure

```text
project/
├── README.md
├── Arithmetic_Unit_8.v
├── Saturation_Control_8.v
├── Saturating_ALU_8.v
└── tb_Saturating_ALU_8.v
```

---

## Verification

使用 **self-checking Testbench** 驗證完整系統功能。

測試內容包含：

- Normal Signed Addition
- Normal Signed Subtraction
- Positive / Negative Overflow
- Wrap-around Mode
- Saturation Mode
- Positive / Negative Saturation
- `overflow`
- `saturated`
- `zero`
- `negative`

其中包含代表性的 boundary cases：

```text
+127 + 1
-128 + (-1)
+127 - (-1)
-128 - 1
```

Overflow cases 皆分別測試：

```text
sat_enable = 0
sat_enable = 1
```

以確認 Wrap-around 與 Saturation behavior 都正確。

---

## Result

XSim self-checking simulation 結果：

```text
test 1-1 passed
test 1-2 passed
test 1-3 passed

test 2-1 passed
test 2-2 passed
test 2-3 passed
test 2-4 passed

test 3-1 passed
test 3-2 passed
test 3-3 passed

test 4-1 passed
test 4-2 passed
test 4-3 passed
test 4-4 passed
```

所有設定的 test cases 皆通過。

本 Mini-Project 完成了從 Lab03 基本 Add/Sub datapath 延伸至具備 **signed overflow handling、optional saturation 與 status flags** 的完整 combinational arithmetic unit。
