# A-Framework-for-IoT-Enabled-Smart-Manufacturing-for-Energy-and-Resource-Optimization-Schilab

This dataset supports the study "A Framework for IoT-Enabled Smart Manufacturing for Energy and Resource Optimization", by Alex Bazigu and Johnson Mwebaze, submitted to the RIO Journal. The original study used MATLAB Simulink to simulate an IoT-enabled smart manufacturing system, achieving an 18% energy reduction. This replication uses Scilab (version 2025.0.0), an open-source numerical computation software, to enhance accessibility in resource-constrained environments, achieving an average energy reduction of **17.87%**, closely aligning with the original result.

## Included Files

- **iot_simulation.sce**: Scilab script that simulates the IoT system over 1000 time steps, monitoring energy consumption, temperature, pressure, fire signals, and production efficiency. Control logic reduces energy by 18% when consumption exceeds a threshold of 62 units.
- **CSV files**:
  - `energy_data.csv`
  - `temperature_data.csv`
  - `pressure_data.csv`
  - `fire_data.csv`
  - `raw_material_usage.csv`
  - `production_efficiency.csv`
  - `fan_status.csv`
  - `pressure_control.csv`
  - `energy_saving.csv`
  - `sprinkler_status.csv`
- **simulation_results.png**: A five-panel plot showing:
  1. Temperature and fan control  
  2. Pressure and pressure control  
  3. Energy consumption and energy-saving status  
  4. Fire signal and sprinkler control  
  5. Raw material usage and production efficiency


## Usage Instructions

1. Install **Scilab (version 2025.0.0 or later)** from [https://www.scilab.org/](https://www.scilab.org/).
2. Download `iot_simulation.sce` and place it in your working directory.
3. Open Scilab, set the working directory to the location of `iot_simulation.sce`, and run:
   ```scilab
   exec("iot_simulation.sce")

