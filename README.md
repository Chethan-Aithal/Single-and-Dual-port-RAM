# Memory Design using Verilog HDL

This repository contains Verilog implementations of **Single Port RAM** and **Dual Port RAM** with parameterized memory size and data width.

## Overview

Memory blocks are essential components in digital systems. This project demonstrates the implementation and simulation of RAM architectures using Verilog HDL.

### Features

- Parameterized design
- Configurable data width
- Configurable address width
- Synthesizable Verilog code
- Simple testbenches for simulation
- FPGA-friendly implementation

---

# Single Port RAM

## Description

Single Port RAM uses a single address port for both read and write operations. At any given clock cycle, the memory can either perform a read operation or a write operation.

## Parameters

| Parameter | Description |
|------------|------------|
| DATA_WIDTH | Width of each memory location |
| ADDR_WIDTH | Number of address bits |

## Ports

| Signal | Direction | Description |
|----------|----------|-------------|
| data | Input | Data to be written |
| addr | Input | Memory address |
| wr | Input | Write enable |
| clk | Input | System clock |
| q | Output | Data read from memory |

## Operation

### Write

```text
wr = 1
mem[addr] <= data
```

### Read

```text
wr = 0
q = mem[addr]
```

---

# Dual Port RAM

## Description

Dual Port RAM provides two independent ports that can access the same memory simultaneously. Each port has its own address, data, and write control signals.

## Parameters

| Parameter | Description |
|------------|------------|
| DATA_WIDTH | Width of each memory location |
| ADDR_WIDTH | Number of address bits |
| MEM_WIDTH | Total memory locations |

## Ports

### Port A

| Signal | Description |
|----------|-------------|
| data_a | Input data |
| addr_a | Address |
| wr_a | Write enable |
| q_a | Output data |

### Port B

| Signal | Description |
|----------|-------------|
| data_b | Input data |
| addr_b | Address |
| wr_b | Write enable |
| q_b | Output data |

### Common Signals

| Signal | Description |
|----------|-------------|
| clk | System clock |

## Operation

### Port A

```text
wr_a = 1  -> Write data_a to addr_a
wr_a = 0  -> Read data from addr_a
```

### Port B

```text
wr_b = 1  -> Write data_b to addr_b
wr_b = 0  -> Read data from addr_b
```

Both ports can operate independently on the same clock.

---

# Simulation

The repository includes simple testbenches demonstrating:

### Single Port RAM

- 2 Write operations
- 2 Read operations

### Dual Port RAM

- 2 Writes through Port A
- 2 Writes through Port B
- 2 Reads through Port A
- 2 Reads through Port B

Waveforms can be viewed using:

- Vivado Simulator
- Icarus Verilog + GTKWave

---

# Applications

- FPGA Design
- Embedded Systems
- Cache Memory Prototypes
- Buffer Storage
- Digital Signal Processing
- Computer Architecture Labs

---

# Author
Created by **Chethan Aithal**
Verilog HDL Memory Design Project for Digital Design and FPGA Learning.
