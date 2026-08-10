# Lab 1 回家作業小 Project：可程式化位元路由器

## 一、作業目的

本作業要求使用 Verilog 設計一個 **8-source to 8-destination programmable bit router**。

系統需先從 `src[7:0]` 中選出 1 個 bit，接著根據控制訊號決定是否將該 bit 反相、是否允許輸出，最後再將處理後的訊號送到 `dst[7:0]` 中指定的位置。

本作業主要練習：

- Multiplexer / Demultiplexer
- Combinational Logic
- Vector
- Continuous Assignment
- Module Instantiation
- Hierarchical Design
- Testbench
- Waveform Verification

---

## 二、系統介面

Top module 名稱固定為：

```verilog
top_router
```

Port 定義如下：

```verilog
module top_router (
    input  [7:0] src,
    input  [2:0] src_sel,
    input  [2:0] dst_sel,
    input        enable,
    input        invert,
    output       channel,
    output [7:0] dst
);
```

> Module 名稱與 port 名稱不得更改。

---

## 三、功能規格

### 3.1 Source Selection

`src_sel` 用來決定從 `src[7:0]` 中選出哪一個 bit。

| `src_sel` | 選取來源 |
|---|---|
| `3'b000` | `src[0]` |
| `3'b001` | `src[1]` |
| `3'b010` | `src[2]` |
| `3'b011` | `src[3]` |
| `3'b100` | `src[4]` |
| `3'b101` | `src[5]` |
| `3'b110` | `src[6]` |
| `3'b111` | `src[7]` |

選出的 bit 定義為 `selected_bit`。

---

### 3.2 Invert Control

`invert` 用來決定是否將 `selected_bit` 反相。

| `invert` | 功能 |
|---|---|
| `1'b0` | 保持原值 |
| `1'b1` | 將數值反相 |

例如：

```text
selected_bit = 1, invert = 0 → 1
selected_bit = 1, invert = 1 → 0
selected_bit = 0, invert = 0 → 0
selected_bit = 0, invert = 1 → 1
```

---

### 3.3 Enable Control

`enable` 用來控制處理後的訊號是否允許輸出至 `channel`。

| `enable` | 功能 |
|---|---|
| `1'b0` | `channel` 強制為 `0` |
| `1'b1` | 正常輸出經過 invert 處理後的訊號 |

因此，只要：

```verilog
enable = 1'b0;
```

就必須滿足：

```verilog
channel = 1'b0;
```

---

### 3.4 Destination Selection

`dst_sel` 用來決定 `channel` 要送到 `dst[7:0]` 中的哪一個位置。

當 `channel = 1'b1` 時：

| `dst_sel` | `dst` |
|---|---|
| `3'b000` | `8'b0000_0001` |
| `3'b001` | `8'b0000_0010` |
| `3'b010` | `8'b0000_0100` |
| `3'b011` | `8'b0000_1000` |
| `3'b100` | `8'b0001_0000` |
| `3'b101` | `8'b0010_0000` |
| `3'b110` | `8'b0100_0000` |
| `3'b111` | `8'b1000_0000` |

當 `channel = 1'b0` 時，不論 `dst_sel` 為何，都必須：

```verilog
dst = 8'b0000_0000;
```

---

## 四、Module 要求

整體設計必須至少包含下列四個 modules：

```text
Mux_8to1
Bit_Controller
Demux_1to8
top_router
```

### 4.1 `Mux_8to1`

```verilog
module Mux_8to1 (
    input  [7:0] src,
    input  [2:0] src_sel,
    output       selected_bit
);
```

功能：

- 根據 `src_sel`
- 從 `src[7:0]` 中選出一個 bit
- 將結果輸出至 `selected_bit`

---

### 4.2 `Bit_Controller`

```verilog
module Bit_Controller (
    input  selected_bit,
    input  enable,
    input  invert,
    output channel
);
```

功能：

- 根據 `invert` 決定是否將 `selected_bit` 反相
- 根據 `enable` 決定是否允許訊號輸出
- 最終結果輸出至 `channel`

---

### 4.3 `Demux_1to8`

```verilog
module Demux_1to8 (
    input        channel,
    input  [2:0] dst_sel,
    output [7:0] dst
);
```

功能：

- 根據 `dst_sel`
- 將 `channel` 送至指定的 `dst` bit
- 其餘 `dst` bits 必須為 `0`

---

### 4.4 `top_router`

`top_router` 必須使用 module instantiation 將前三個 modules 連接起來。

整體架構如下：

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

---

## 五、Verilog 撰寫要求

本題僅使用 Lab 1 已學過的 combinational logic 概念完成。

可使用的語法與概念包含：

```verilog
assign
? :
&
|
^
~
wire
vector
module instantiation
```

本題不需要使用：

- Clock
- Sequential Logic
- Flip-Flop
- FSM

---

## 六、Testbench 要求

請建立：

```text
tb_top_router.v
```

並對完整的 `top_router` 進行 simulation。

測試內容至少需涵蓋：

- `src_sel = 3'b000`
- `src_sel = 3'b111`
- `dst_sel = 3'b000`
- `dst_sel = 3'b111`
- `enable = 0`
- `enable = 1`
- `invert = 0`
- `invert = 1`
- 選到的 `src` bit 為 `0`
- 選到的 `src` bit 為 `1`
- 選到 `0` 後，經過 `invert = 1` 使輸出變為 `1`

完成後需使用 simulation waveform 驗證輸出結果。

---

## 七、繳交檔案

專案需包含以下檔案：

```text
Mux_8to1.v
Bit_Controller.v
Demux_1to8.v
top_router.v
tb_top_router.v
README.md
```

並附上最終 simulation waveform 截圖。

---

## 八、評分標準

| 項目 | 配分 |
|---|---:|
| `Mux_8to1` 功能正確 | 15 |
| `Bit_Controller` 功能正確 | 15 |
| `Demux_1to8` 功能正確 | 15 |
| Hierarchical Design 與模組接線 | 20 |
| Verilog 語法與 Signal 使用 | 10 |
| Testbench 測試完整度 | 15 |
| 程式可讀性 | 10 |
| **總分** | **100** |

---

## 九、完成狀態

- [x] `Mux_8to1`
- [x] `Bit_Controller`
- [x] `Demux_1to8`
- [x] `top_router`
- [x] Testbench
- [x] Simulation Passed
