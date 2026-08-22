# Lab 03 Mini-Project — 8-bit Saturating Arithmetic Unit

## Overview

This mini-project extends the arithmetic concepts from Lab03 into an
**8-bit signed Saturating Arithmetic Unit**.

The design supports:

- Signed addition and subtraction
- Signed overflow detection
- Wrap-around arithmetic
- Saturating arithmetic
- `zero` and `negative` status flags

The entire design is implemented using **combinational logic**.

---

## Function

### Arithmetic Operation

`OP` selects the arithmetic operation:

```text
OP = 0 → A + B
OP = 1 → A - B
```

Addition and subtraction share the same arithmetic datapath.

For subtraction:

```text
B_in = B XOR OP
raw_result = A + B_in + OP
```

---

### Saturation Mode

`sat_enable` controls how signed overflow is handled.

```text
sat_enable = 0 → Wrap-around mode
sat_enable = 1 → Saturation mode
```

When saturation is enabled:

```text
Positive overflow → result = +127 (0111_1111)
Negative overflow → result = -128 (1000_0000)
```

When saturation is disabled, the original 8-bit wrap-around result is preserved.

---

## Status Flags

The design provides four status outputs:

| Signal | Description |
|---|---|
| `overflow` | Original signed arithmetic operation exceeds the 8-bit signed range |
| `saturated` | Saturation was actually applied |
| `zero` | Final result is zero |
| `negative` | Final result is negative |

`overflow` represents the original arithmetic result, while `zero` and
`negative` are determined from the final output after saturation control.

---

## Architecture

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

### Module Responsibilities

- `Arithmetic_Unit_8.v`
  - Performs signed addition / subtraction
  - Generates the raw 8-bit result
  - Detects signed overflow

- `Saturation_Control_8.v`
  - Selects between wrap-around and saturation behavior
  - Clamps overflow results to `+127` or `-128`
  - Generates the `saturated` flag

- `Saturating_ALU_8.v`
  - Top-level integration
  - Generates `zero` and `negative` flags

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

A self-checking testbench was used to verify:

- Normal signed addition
- Normal signed subtraction
- Positive and negative overflow
- Wrap-around behavior
- Positive and negative saturation
- `overflow`
- `saturated`
- `zero`
- `negative`

Representative boundary cases include:

```text
+127 + 1
-128 + (-1)
+127 - (-1)
-128 - 1
```

Both saturation-enabled and saturation-disabled overflow cases were tested.

---

## Result

All implemented test cases passed in XSim:

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

The final design successfully implements an 8-bit signed arithmetic datapath
with optional saturation and status flag generation.
