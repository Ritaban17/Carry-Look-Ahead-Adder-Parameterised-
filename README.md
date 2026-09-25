# Parameterized Carry Look-Ahead Adder (CLA)

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Ritaban17/Carry-Look-Ahead-Adder-Parameterised-/blob/main/LICENSE)

A flexible, high-speed digital adder implemented in Hardware Description Language (HDL). This project features a parameterized design, allowing users to instantiate a Carry Look-Ahead Adder (CLA) of any arbitrary bit-width ($N$) without modifying the core logic equations.

## 📌 Overview

In digital circuit design, basic Ripple-Carry Adders (RCAs) introduce a significant delay of $O(N)$ because each full adder must wait for the carry-out of the previous stage. 

The Carry Look-Ahead Adder solves this by calculating the carry signals in advance based on the input signals. By generating **Propagate ($P$)** and **Generate ($G$)** signals, the CLA reduces the computation time, making the delay largely independent of the number of bits.

### Key Features
* **Parameterized Width:** Easily scale the adder to 4-bit, 8-bit, 16-bit, 32-bit, or $N$-bit widths using a single parameter.
* **High Performance:** Overcomes the $O(N)$ delay limitation of standard ripple-carry adders.
* **Modular Design:** Clean, easily readable hierarchy separating the carry-lookahead logic from the bitwise addition.
* **Testbench Included:** Comes with a verification testbench to simulate and validate the functionality across different parameter sizes.

## 🛠️ Prerequisites

To simulate and view the waveforms for this project, you will need an HDL simulator. Popular options include:
* [Icarus Verilog (iverilog)](https://steveicarus.github.io/iverilog/) + [GTKWave](http://gtkwave.sourceforge.net/) (Open Source)
* ModelSim / QuestaSim
* Xilinx Vivado

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ritaban17/Carry-Look-Ahead-Adder-Parameterised-.git
   cd Carry-Look-Ahead-Adder-Parameterised-
   ```

2. **Compile the design and testbench (Example using Icarus Verilog):**
   ```bash
   iverilog -o cla_sim src/cla_adder.v tb/cla_adder_tb.v
   ```
   *(Note: Adjust the filenames `cla_adder.v` and `cla_adder_tb.v` to match the exact files in the repository).*

3. **Run the simulation:**
   ```bash
   vvp cla_sim
   ```

4. **View the Waveforms:**
   ```bash
   gtkwave dump.vcd
   ```

## 📁 Repository Structure

```text
├── src/                # Source files for the Parameterized CLA
│   └── ...             # (e.g., cla_adder.v)
├── tb/                 # Testbench files for simulation
│   └── ...             # (e.g., cla_adder_tb.v)
├── docs/               # (Optional) Diagrams and documentation
└── README.md           # Project overview and instructions
```

## 🧠 How it Works

The addition of two bits ($A$ and $B$) produces two intermediate signals:
* **Generate ($G_i$):** $G_i = A_i \cdot B_i$ (A carry is generated at this bit).
* **Propagate ($P_i$):** $P_i = A_i \oplus B_i$ (A carry is propagated through this bit).

The carry out for the next stage ($C_{i+1}$) is computed as:
$$C_{i+1} = G_i + (P_i \cdot C_i)$$

Because the parameterized code unfolds these logic gates algorithmically during compilation, it calculates these equations simultaneously, massively speeding up the final sum calculation:
$$S_i = P_i \oplus C_i$$

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/Ritaban17/Carry-Look-Ahead-Adder-Parameterised-/issues).

## 📄 License

This project is open-source and available under the MIT License.
