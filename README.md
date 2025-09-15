# alu-verilog-design

4-Bit Arithmetic Logic Unit (ALU)

A fully functional and synthesizable 4-bit Arithmetic Logic Unit implemented in Verilog. This project demonstrates core digital design principles, from gate-level modeling to system integration and verification.

## 📋 Features

*   **Arithmetic Operations:** ADD, SUBTRACT, 2's COMPLEMENT, INCREMENT, DECREMENT
*   **Logical Operations:** BITWISE AND, OR, XOR, 1's COMPLEMENT (NOT)
*   **Shift & Rotate Operations:** LOGICAL SHIFT LEFT/RIGHT, ARITHMETIC SHIFT RIGHT, ROTATE LEFT/RIGHT
*   **Flag Generation:** CARRY OUT (`Cout`).
*   **Technology:** Targetable for both FPGA and ASIC design flows.

## 🏗️ Architecture

The ALU is built using a modular, hierarchical design methodology:
1.  **Full Adder (FA):** The basic building block.
2.  **Ripple Carry Adder (RCA):** A 4-bit adder/subtractor core that forms the Arithmetic Unit.
3.  **Combinational Logic:** Implements the Bitwise operations.
4.  **Barrel Shifter:** A multiplexer-based unit for shift and rotate operations.
5.  **Top-Level ALU:** Integrates all units with output multiplexing and flag generation logic.

![ALU Block Diagram](./images/block_diagram.png)

## 🚀 Getting Started

### Prerequisites

*   A Verilog simulator (e.g., **ModelSim**, **Icarus Verilog**, **VCS**)
*   Or an FPGA toolchain (e.g., **Xilinx Vivado**, **Intel Quartus Prime**)
*   (Optional) An FPGA board for hardware testing (e.g., Basys 3, Cyclone IV)

### Simulation

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/4-Bit-ALU-Verilog.git
    cd 4-Bit-ALU-Verilog
    ```
2.  Compile and run the simulation using your preferred tool.
    *   **Example with Icarus Verilog:**
        ```bash
        iverilog -o alu_sim src/*.v testbench/alu_tb.v
        vvp alu_sim
        gtkwave alu_waveforms.vcd &
        ```

### Synthesis (Vivado Example)

1.  Create a new Vivado project for an FPGA target (e.g., Artix-7).
2.  Add all Verilog files from the `src/` directory.
3.  Add a constraints file (`.xdc`) to map I/O ports to physical pins.
4.  Run Synthesis and Implementation.
5.  Generate and download the bitstream to an FPGA board.

## 📊 Operation Table

| Select (`S[3:0]`)  | Operation          | Description                      | Flags Affected        |
| :----------------- | :----------------- | :------------------------------- | :-------------------- |
| `0000`             | ADD                | `Y = A + B`                      | Cout                  |
| `0001`             | SUBTRACT           | `Y = A - B`                      | Cout                  |
| `0010`             | 2's COMPLEMENT     | `Y = -B` (Two's complement of B) | Cout                  |
| `0011`             | INCREMENT          | `Y = A + 1`                      | Cout                  |
| `0100`             | DECREMENT          | `Y = A - 1`                      | Cout                  |
| `0101`             | BITWISE AND        | `Y = A & B`                      |  _                    |
| `0110`             | BITWISE OR         | `Y = A | B`                      |  _                    |
| `0111`             | BITWISE XOR        | `Y = A ^ B`                      |  _                    |
| `1000`             | 1's COMPLEMENT     | `Y = ~A` (Bitwise NOT)           |  _                    |
| `1001`             | SHIFT LEFT LOGICAL | `Y = A << 1`                     | Cout                  |
| `1010`             | SHIFT RIGHT LOGICAL| `Y = A >> 1`                     | Cout                  |
| `1011`             | SHIFT RIGHT ARITH. | `Y = A >>> 1` (Sign-extended)    | Cout                  |
| `1100`             | ROTATE LEFT        | `Y = {A[2:0], A[3]}`             | Cout                  |
| `1101`             | ROTATE RIGHT       | `Y = {A[0], A[3:1]}`             | Cout                  |

## ✅ Verification

A comprehensive self-checking testbench (`alu_tb.v`) verifies the functionality of all operations with edge cases. The waveform below shows a successful simulation.


## 👨‍💻 Skills Demonstrated

*   **Hardware Description Languages:** Verilog HDL (RTL & Structural Modeling)
*   **EDA Tools:** Xilinx Vivado, ModelSim, Icarus Verilog, GTKWave
*   **Digital Design:** Combinational & Sequential Logic, Finite State Machines, Arithmetic Circuits
*   **Verification:** Testbench Design, Functional Simulation, Waveform Analysis
*   **FPGA Development:** Synthesis, Place & Route, Timing Analysis
*   **Version Control:** Git & GitHub


## 🙋‍♂️ Author

Your Name \ Arkopaul Nandi
ECE Student specializing in VLSI & Embedded Systems \
[![LinkedIn] https://www.linkedin.com/in/arkopaul-nandi-331a24214/
