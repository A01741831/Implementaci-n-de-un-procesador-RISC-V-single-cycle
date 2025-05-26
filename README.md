# Implementacion-de-un-procesador-RISC-V-single-cycle

## Información del Autor
- **Nombre:** Ana Maria Rodriguez Peña
- **Matrícula:** A01741831

## Descripción
Implementar una arquitectura de procesador RISC-V con diseño de ciclo único (single-cycle) en Verilog, integrando todos los bloques funcionales necesarios, verificando su comportamiento mediante simulación y analizando su funcionamiento instrucción por instrucción.

## Requisitos
*	Conocimientos básicos de arquitectura de computadores (etapas de ejecución de instrucciones).
*Familiaridad con el conjunto de instrucciones RISC-V RV32I.
*Conocimientos en diseño digital con Verilog.
*Herramientas recomendadas: ModelSim, Quartus.

## Estructura del Proyecto
/riscv_single_cycle/ │ ├── src/ │ ├── top.v ← Módulo principal (interconexión de todos los bloques) │ ├── program_counter.v │ ├── instruction_memory.v │ ├── control_unit.v │ ├── register_file.v │ ├── alu.v │ ├── alu_control.v │ ├── immediate_generator.v │ ├── data_memory.v │ ├── mux.v │ ├── branch_comparator.v │ └── adder.v │ ├── testbench/ │ └── top_tb.v ← Testbench para simular │ ├── program/ │ └── test_program.mem ←
Código ensamblado para ejecutar

## Imágenes
<img src="images/wave.jpg" alt="wave" width="600">
<img src="images/RTL.jpg" alt="RTL Viewer" width="600">
<img src="images/TMV.jpg" alt="TMV" width="600">
<img src="images/Slow_1200mV_0c_Model_Fmax_Summary.jpg" alt="Slow 1200mV 0c Model Fmax Summary" width="600">
<img src="images/Slow_1200mV_85c_Model_Fmax_Summary.jpg" alt="Slow 1200mV 85c Model Fmax Summary" width="600">
