# QMutBench: A Quantum Circuit Mutants Benchmark!

## About QMutBench

QMutBench is a comprehensive benchmark for quantum circuit mutants, providing a diverse dataset derived from a previous empirical study on quantum circuit mutants ["Quantum circuit mutants: Empirical analysis and recommendations" by Mendiluze Usandizaga et al.](https://link.springer.com/article/10.1007/s10664-025-10643-z). The benchmark consists of over 300 original programs ranging from 2 to 30 qubits and their respective mutants, totaling more than 700,000.

QMutBench enables researchers and developers to explore and download quantum circuit mutants based on different characteristics. Users can filter mutants by selecting the original quantum program, specifying the range of qubits, determining the survival rate, and identifying specific mutation characteristics such as the type of quantum gate applied, its position within the circuit, and the mutation operator used. After making these selections, the available mutant groups will be displayed, with each group containing specific files available for download.

## Web UI

The QMutBench platform is intuitively designed with three main interactive sections, guiding you through a progressive selection of your quantum circuit benchmark.

### 1. Generic Selection

This section establishes the broad parameters for generic quantum circuit mutant selection.

<div style="text-align: center;">
    <img src="images\GenericSelection.png" alt="Screenshot: Overview of the "Generic Selection" section, highlighting program origin, qubit range, and survival rate filters" style="max-width: 40%; height: auto; display: block; margin: 0 auto;">
</div>

**Key Characteristics:**

* **Origin Quantum Programs:** Programs are categorized by output behavior ("Dominant Output" and "Non-Dominant Output") and include various algorithms (e.g., `dj`, `ghz`, `qft`, `ae`, `grover`, `vqe`).
* **Qubit Range:** Specifies the minimum and maximum number of qubits for quantum circuits (2 to 30 qubits).
* **Survival Rate Wanted:** Selects survival rate range (e.g., `0-10%`, `11-20%`, up to `91-100%`).

### 2. Mutation Characteristics

This section enables filtering based on specific mutation characteristics.

<div style="text-align: center;">
    <img src="images\MutationCharacteristics.png" alt="Screenshot: Overview of the "Mutation Characteristics" section, showing quantum gates, position, and operator filters" style="max-width: 50%; height: auto; display: block; margin: 0 auto;">
</div>

**Key Characteristics:**

* **Quantum Gate Applied:** Identifies quantum gates involved in the mutation (e.g., `H`, `X`, `Y`, `Z`, `P`, `T`, `S`, `ID`, `RX`, `RY`, `RZ`, `SX`, `CX`, `CZ`, `RXX`, `RZZ`, `SWAP`, `CCX`, `CSWAP`).
* **Position (Circuit %):** Filters mutants by their location within the circuit, expressed as a percentage range (e.g., `0-10%`, `11-20%`, up to `91-100%`).
* **Operator:** Selects the mutation operator type: `Add`, `Remove`, or `Replace`.

### 3. Available Groups (Results)

This section presents quantum circuit mutant groups matching specified criteria for review and download.

<div style="text-align: center;">
    <img src="images\AvailableGroups.png" alt="Screenshot: Overview of the "Available Groups" section, focusing on the results table and download button" style="max-width: 60%; height: auto; display: block; margin: 0 auto;">
</div>

**Key Characteristics:**

* **Filterable Table:** Results are displayed in a dynamic table with columns for `Algorithm`, `Qubits`, `Position`, `Operation`, `Gate`, `Survival Rate`, and `Mutants`.
* **Selectable Files:** Individual or multiple selection of groups is supported.
* **Download:** Generates a `.zip` archive containing QASM files for selected original programs and their corresponding mutants.

## Downloaded Files Structure

Downloaded `.zip` files are organized into a defined directory structure:

<div style="text-align: center;">
    <img src="images\FolderTree.png" alt="Image: Representation of the .zip folder structure (e.g., a file tree diagram)" style="max-width: 30%; height: auto; display: block; margin: 0 auto;">
</div>

The `.zip` file contains two primary folders:

* **`Origin_programs/`**: Contains original quantum programs (`.qasm` files), named by algorithm and qubit count (i.e., `algorithm_X_qubits.qasm`).
* **`Mutated_programs/`**: Contains quantum circuit mutants, organized into subfolders corresponding to original programs (i.e., `Mutants_algorithm_X_qubits/`). Mutant `.qasm` files within these subfolders are named based on mutation operation, gate, and position (e.g., `AddGate_H_inGap_5_.qasm`, `ReplaceGate_X_inPositionOfGate_10.qasm`, `RemoveGate_7_.qasm`).

## Acknowledgements

We acknowledge [MQTbench](https://www.cda.cit.tum.de/mqtbench/) for providing the initial original quantum programs used in this benchmark.
