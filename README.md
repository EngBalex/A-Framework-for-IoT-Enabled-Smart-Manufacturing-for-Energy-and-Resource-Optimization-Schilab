# A-Framework-for-IoT-Enabled-Smart-Manufacturing-for-Energy-and-Resource-Optimization-Schilab

This dataset supports the study "A Framework for IoT-Enabled Smart Manufacturing for Energy and Resource Optimization" by Alex Bazigu and Johnson Mwebaze, submitted to the RIO Journal. The original study used MATLAB Simulink to simulate an IoT-enabled smart manufacturing system, achieving an 18% energy reduction. This replication uses Scilab (version 2025.0.0), an open-source numerical computation software, to enhance accessibility in resource-constrained environments, achieving an average energy reduction of 17.87%, closely aligning with the original result.

The dataset includes:

iot_simulation.sce: The Scilab script that simulates the IoT system over 1000 time steps, monitoring energy consumption, temperature, pressure, fire signals, and production efficiency. Control logic reduces energy by 18% when consumption exceeds a threshold of 62 units.
CSV files (energy_data.csv, temperature_data.csv, pressure_data.csv, fire_data.csv, raw_material_usage.csv, production_efficiency.csv, fan_status.csv, pressure_control.csv, energy_saving.csv, sprinkler_status.csv): Simulation outputs for each parameter, with 1000 rows corresponding to each time step.
simulation_results.png: A plot with five subplots showing: (a) temperature and fan control, (b) pressure and pressure control, (c) energy consumption and energy-saving status, (d) fire signal and sprinkler control, and (e) raw material usage and production efficiency.

Usage Instructions:

Install Scilab (version 2025.0.0 or later) from https://www.scilab.org/.
Download iot_simulation.sce and place it in a working directory.
Open Scilab, set the working directory to the location of iot_simulation.sce, and run the script using "exec("iot_simulation.sce")"
The script generates CSV files and a plot (simulation_results.png) in the working directory, replicating the simulation with an average energy reduction of 17.87%.

Related Resources:

For the full study, including methodology and results, refer to the RIO Journal article by Bazigu and Mwebaze (2025).

License: This dataset is licensed under the Creative Commons Attribution 4.0 International (CC BY 4.0), allowing reuse with proper attribution.

Citation: 

Alex, B. (2025). Dataset for IoT-Enabled Smart Manufacturing for Energy and Resource Optimization Simulation in Schilab (1.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.14923407
