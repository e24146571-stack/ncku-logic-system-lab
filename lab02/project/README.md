# Lab 02 Mini-Project：可切換優先順序的請求顯示系統

## 一、作業目的

本作業要求使用 Verilog 設計一個 **8-input Priority Request Display System**。

系統需要先根據 `mask` 與 `enable` 決定哪些 request 有效，再依照 `priority_mode` 選出 priority 最高的 request，最後將選中的編號輸出成 binary code，並顯示在 7-Segment Display 上。

本作業主要整合 Lab 02 已學過的內容：

- Priority Encoder
- Decoder
- 7-Segment Display
- Combinational Logic
- `always @(*)`
- `if / else`
- `case`
- `wire` / `reg`
- `localparam`
- Module Instantiation
- Hierarchical Design
- Testbench
- Waveform Verification

---

## 二、系統介面

Top module 名稱固定為：

```verilog
top_priority_display
```

Port 定義如下：

```verilog
module top_priority_display (
    input  [7:0] request,
    input  [7:0] mask,
    input        enable,
    input        priority_mode,
    output [2:0] selected,
    output       valid,
    output [6:0] seg
);
```

> Module 名稱與 port 名稱請保持一致。

---

## 三、功能規格

### 3.1 Request 與 Mask

系統共有 8 個 request：

```text
request[7:0]
```

每個 request 都有對應的 `mask` bit：

```text
mask[7:0]
```

只有在：

```text
request[i] = 1
mask[i]    = 1
```

時，該 request 才能參與 Priority Encoder 的判斷。

例如：

```text
request = 8'b0010_1010
mask    = 8'b1111_0011
```

則只有沒有被 mask 掉的 request 會進入後續 priority selection。

---

### 3.2 Enable

`enable` 控制整個系統是否啟用。

```text
enable = 0 → 系統停用
enable = 1 → 正常進行 priority selection
```

當 `enable = 0` 時：

```text
valid    = 0
selected = 3'b000
seg      = 7'b1111111
```

---

### 3.3 Priority Mode

`priority_mode` 用來決定 Priority Encoder 的優先方向。

```text
priority_mode = 0
→ index 越大 priority 越高

priority_mode = 1
→ index 越小 priority 越高
```

例如：

```text
request = 8'b0010_1010
mask    = 8'b1111_1111
```

active requests 為：

```text
request[5]
request[3]
request[1]
```

則：

```text
priority_mode = 0 → selected = 5
priority_mode = 1 → selected = 1
```

---

### 3.4 Selected 與 Valid

`selected[2:0]` 輸出被選中的 request index。

例如：

```text
request[6] 被選中
→ selected = 3'd6
```

`valid` 表示目前是否存在有效 request：

```text
valid = 1 → 有 request 被選中
valid = 0 → 沒有有效 request
```

當沒有有效 request 時：

```text
selected = 3'b000
```

---

### 3.5 7-Segment Output

`seg[6:0]` 用來顯示 `selected` 的數字：

```text
0 ~ 7
```

使用與 Lab 02 相同的 **active-low 7-Segment pattern**：

```text
0 → segment ON
1 → segment OFF
```

當：

```text
valid = 0
```

時，7-Segment Display 必須關閉：

```text
seg = 7'b1111111
```

---

## 四、建議系統架構

整體可以拆成：

```text
request[7:0] ──┐
               │
mask[7:0] ─────┼──> Request Filter
               │
enable ────────┘
                     │
                     ▼
              filtered_request
                     │
                     ▼
             Priority Encoder
                     │
            selected + valid
                     │
                     ▼
            7-Segment Decoder
                     │
                     ▼
                  seg[6:0]
```

建議至少拆成以下 modules：

```text
Request_Filter
Priority_Encoder8
Decoder_7S
top_priority_display
```

內部實作方式可以自行決定。

---

## 五、Testbench 要求

請建立：

```text
tb_top_priority_display.v
```

並對完整 system 進行 simulation。

測試內容至少需涵蓋：

- 沒有任何 active request
- `enable = 0`
- 單一 active request
- 多個 active requests，使用高 index priority
- 多個 active requests，使用低 index priority
- 高 priority request 被 `mask` 擋掉
- `request[0]` 與 `request[7]` 的 boundary case
- `selected` 是否正確
- `valid` 是否正確
- 7-Segment Display 是否顯示正確
- `valid = 0` 時 display 是否 blank

完成後需使用 simulation waveform 驗證輸出結果。

---

## 六、限制

本題只需要使用 Lab 02 已學過的 combinational logic 概念。

不需要使用：

- Clock
- Flip-Flop
- Sequential Logic
- FSM

---

## 七、建議檔案

完成後 project 可以包含：

```text
Request_Filter.v
Priority_Encoder8.v
Decoder_7S.v
top_priority_display.v
tb_top_priority_display.v
README.md
```

並附上最終 simulation waveform 截圖。

---

## 八、完成目標

整體 data path 應能正確完成：

```text
request
   ↓
mask / enable
   ↓
priority selection
   ↓
selected + valid
   ↓
7-Segment Decoder
   ↓
display output
```

當 top-level Testbench 與 waveform 都能正確驗證上述功能，即完成此 Mini-Project。
