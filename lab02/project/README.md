# Lab 02 Mini-Project — Dual-Mode Priority Keypad Display

## 一、Project Overview

本 Mini-Project 使用 Verilog 實作一個 **16-key Priority Keypad Display System**。

系統接收 `key[15:0]`，當一個或多個 key 同時 active 時，依照 `priority_mode` 選出 priority 最高的 key，並將其 index 輸出為 `code[3:0]`。

另外，系統可透過 `display_mode` 切換：

- HEX mode：顯示 `0 ~ 9, A, b, c, d, E, F`
- Decimal mode：顯示 `0 ~ 15`

整個系統皆為 **Combinational Logic**，不使用 clock、Flip-Flop 或 FSM。

本 Project 主要整合：

- Priority Encoder
- 7-Segment Decoder
- Combinational `always @(*)`
- `if / else if`
- `case`
- Reduction Operator
- `wire` / `reg`
- `localparam`
- Module Instantiation
- Hierarchical Design
- Self-Checking Testbench

---

## 二、System Interface

Top module：

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

### Input

| Signal | Description |
|---|---|
| `key[15:0]` | 16 個 request / key inputs |
| `enable` | 控制整個 system 是否啟用 |
| `priority_mode` | 切換 High-index / Low-index priority |
| `display_mode` | 切換 HEX / Decimal display |

### Output

| Signal | Description |
|---|---|
| `code[3:0]` | 被選中的 key index |
| `valid` | 是否存在有效的 selected key |
| `seg_tens[6:0]` | 十位 7-Segment output |
| `seg_ones[6:0]` | 個位 7-Segment output |

---

## 三、System Behavior

### Priority Selection

`priority_mode = 0`：

```text
key[15] > key[14] > ... > key[0]
```

高 index 具有較高 priority。

`priority_mode = 1`：

```text
key[0] > key[1] > ... > key[15]
```

低 index 具有較高 priority。

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

### Enable and Valid

Priority Encoder 會另外產生 `raw_valid`：

```verilog
assign raw_valid = |key;
```

`|key` 為 reduction OR。

只要 `key[15:0]` 中至少一個 bit 為 `1`：

```text
raw_valid = 1
```

若：

```text
key = 16'b0
```

則：

```text
raw_valid = 0
```

Top module 再利用 `enable` 決定最終 system output：

```verilog
assign code  = enable ? raw_code  : 4'd0;
assign valid = enable ? raw_valid : 1'b0;
```

因此當 system disabled：

```text
enable = 0

→ code  = 0
→ valid = 0
```

---

## 四、Display Modes

### HEX Mode

```text
display_mode = 0
```

使用 `seg_ones` 顯示：

```text
0 ~ 9, A, b, c, d, E, F
```

`seg_tens` 保持 blank。

例如：

```text
code = 11 → b
code = 14 → E
code = 15 → F
```

---

### Decimal Mode

```text
display_mode = 1
```

將 `code` 顯示為十進位：

```text
0 ~ 15
```

當：

```text
code = 0 ~ 9
```

只使用 `seg_ones`：

```text
7 → 7
9 → 9
```

當：

```text
code = 10 ~ 15
```

使用兩個 7-Segment outputs：

```text
10 → 10
12 → 12
15 → 15
```

本 Project 使用 active-low 7-Segment pattern：

```text
0 → segment ON
1 → segment OFF
```

Blank pattern：

```verilog
7'b1111111
```

---

## 五、Architecture

最終實作採用以下架構：

```text
key[15:0]
priority_mode
    │
    ▼
Priority_Encoder16
    │
    ├── raw_code[3:0]
    └── raw_valid
            │
            ▼
       Top-Level Control
          + enable
            │
            ├── code[3:0]
            └── valid
                  │
                  ▼
              Decoder_7S
             + display_mode
                  │
          ┌───────┴───────┐
          ▼               ▼
      seg_tens         seg_ones
```

### `Priority_Encoder16`

負責：

- 判斷 active keys
- 根據 `priority_mode` 選出 highest-priority key
- 輸出 `raw_code`
- 利用 reduction OR 產生 `raw_valid`

Source：

[`Priority_Encoder16.v`](./Priority_Encoder16.v)

---

### `top_keypad_display`

負責：

- Module Integration
- 接收 Encoder 的 `raw_code` / `raw_valid`
- 使用 `enable` 控制最終 `code` / `valid`
- 將結果送入 Decoder

Source：

[`top_keypad_display.v`](./top_keypad_display.v)

---

### `Decoder_7S`

負責：

- 根據 `valid` 決定 display 是否 blank
- 根據 `display_mode` 選擇 HEX / Decimal mode
- 將 `code` 轉換為兩組 active-low 7-Segment outputs

Source：

[`Decoder_7S.v`](./Decoder_7S.v)

---

## 六、Verification

本 Project 使用 **Self-Checking Testbench** 進行驗證。

與單純輸入 stimulus 後人工閱讀 waveform 不同，Testbench 會直接比較：

```text
Actual Output
     vs.
Expected Output
```

並在 XSim console 輸出：

```text
passed
```

或：

```text
failed
```

Testbench：

[`tb_top_keypad_display.v`](./tb_top_keypad_display.v)

### Test Coverage

測試內容包含：

- No active key
- `enable = 0`
- Single active key
- `key[0]`
- `key[15]`
- Multiple active keys
- High-index priority
- Low-index priority
- Exhaustive single-key test：`key[0] ~ key[15]`
- HEX mode
- Decimal mode
- Decimal `9 → 10` boundary
- Decimal upper boundary `15`
- Blank display when `valid = 0`

Single-key test 使用 `for` loop 依序驗證：

```text
key[0]  → code = 0
key[1]  → code = 1
...
key[15] → code = 15
```

### Simulation Result

Final XSim simulation：

```text
test 1 passed
test 2 passed
test 3 passed
test 4 passed
test 5 passed
test 6 passed
test 7 passed
test 8 passed

(test 9) single key 0 passed
...
(test 9) single key 15 passed

(test 10) single key 0 passed
...
(test 10) single key 15 passed

test 11 passed
test 12 passed
test 13 passed
```

所有測試皆通過。

本 Project 主要使用 **self-checking console output** 作為 verification result，因此未另外保存完整 waveform screenshot。

---

## 七、Key Observations

### `code = 0` 不代表沒有有效輸入

`key[0]` 被選中時：

```text
code = 0
valid = 1
```

沒有任何 key active 時：

```text
code = 0
valid = 0
```

因此 `code` 本身不足以判斷是否存在有效 input，需要額外的 `valid` signal。

---

### Top Module 可以包含 Glue Logic

Top module 不只負責 Module Instantiation，也可以處理少量 system-level control。

本 Project 中：

```text
Priority Encoder
→ raw_code / raw_valid

Top + enable
→ code / valid
```

`enable` 屬於整個 system 的控制，因此放在 Top 中處理。

---

### Procedural Code 仍然是在描述 Hardware

在同一個 combinational `always @(*)` block 中，procedural statements 具有執行順序。

例如：

```verilog
always @(*) begin
    code = 4'd0;

    if (condition)
        code = 4'd5;
end
```

simulation 中後面的 assignment 可以覆寫前面的 default value。

Synthesis 最終仍會建立具有相同行為的 combinational hardware，而不是建立一個逐行執行程式碼的 processor。

---

### Self-Checking Testbench

隨著 system complexity 增加，只依靠 waveform 人工檢查會逐漸變得低效率。

本 Project 開始使用：

```text
Stimulus
   ↓
DUT
   ↓
Automatic Comparison
   ↓
PASS / FAIL
```

waveform 可保留作為 debug 工具，而大量 functional verification 可以交由 Testbench 自動判斷。

---

## 八、Project Structure

```text
project/
│
├── README.md
├── Priority_Encoder16.v
├── Decoder_7S.v
├── top_keypad_display.v
└── tb_top_keypad_display.v
```

---

## 九、Result

本 Mini-Project 完成：

- 16-key Priority Encoder
- Configurable High / Low Priority
- Enable / Valid Control
- HEX / Decimal Display Mode
- Two-Digit 7-Segment Output
- Hierarchical Design
- Self-Checking Testbench
- Exhaustive Single-Key Verification

Final simulation passed all defined test cases.
