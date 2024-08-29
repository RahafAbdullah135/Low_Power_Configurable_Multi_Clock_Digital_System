# RTL to GDS Implementation of Low Power Configurable Multi Clock Digital System
## Overview
This project focuses on the design and implementation of a low-power, configurable multi-clock digital system. The system is designed to receive commands through a UART receiver, execute different functions (such as reading/writing to a register file or processing data using an ALU), and send the results back through a UART transmitter. An asynchronous FIFO is used to handle different clock rates and prevent data loss during transmission.
## Project Phases
### 1. RTL Design:
  **Design and implementation of the following system blocks:**
  - ALU (Arithmetic Logic Unit)
  - Register File
  - Synchronous FIFO
  - Integer Clock Divider
  - Clock Gating
  - Synchronizers
  - Main Controller
  - UART Transmitter (UART TX)
  - UART Receiver (UART RX)
### 2.  Integration and Verification:
Integrate the designed blocks and verify their functionality using a self-checking testbench.
### 3.  Synthesis:
Apply constraints to the system using synthesis TCL scripts.
Synthesize and optimize the design using the Design Compiler tool.
### 4.  Timing Analysis:
Analyze timing paths to identify and fix setup and hold violations.
### 5.  Equivalence Checking:
Verify functional equivalence of the synthesized design using the Formality tool.
### 6.  Physical Implementation:
Perform the physical implementation of the system, following the standard ASIC flow to generate the GDS file.
### 7.  Post-Layout Verification:
Verify the system's functionality after layout, taking into account actual delays.

# Tools Used
- Design Compiler: For synthesis and optimization.
- Formality: For equivalence checking.
- ASIC Tools: For physical implementation and GDS file generation.

## System Architecture
![system](https://github.com/user-attachments/assets/c46b4f86-f469-44cc-8495-fe829af898f5)

## System operations:
**Supported Commands**
- Register File Write command
- Register File Read command
- ALU Operation command with operand
- ALU Operation command with No operand

## System Specifications:
- Reference Clock (REF_CLK): 50 MHz
- UART Clock (UART_CLK): 3.6864 MHz
- Clock Divider: Always enabled (clock divider enable = 1)
