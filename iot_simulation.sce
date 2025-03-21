// Clear workspace and console
clear;
clc;

// Step 1: Initialize simulation parameters
time_steps = 1000;  // Simulate for 1000 time steps (e.g., 1000 seconds)
t = 1:time_steps;   // Time vector
temp_threshold = 30;  // Temperature threshold for fan control
pressure_threshold = 30;  // Pressure threshold for pressure control
energy_threshold = 60;  // Lowered energy threshold to 90 units
fire_threshold = 1;  // Fire detection threshold for sprinkler activation

// Step 2: Initialize arrays to store sensor data and control outputs
temperature = zeros(1, time_steps);
pressure = zeros(1, time_steps);
energy = zeros(1, time_steps);
fire = zeros(1, time_steps);
raw_material_usage = zeros(1, time_steps);
production_efficiency = zeros(1, time_steps);
fan_status = zeros(1, time_steps);
pressure_control = zeros(1, time_steps);
energy_saving = zeros(1, time_steps);
sprinkler_status = zeros(1, time_steps);

// Step 3: Simulate sensor data and apply control logic
for i = 1:time_steps
    // Simulate sensor readings with random noise
    temperature(i) = 25 + grand(1, 1, "nor", 0, 2);  // Base temp 25°C, noise with std=2
    pressure(i) = 20 + grand(1, 1, "nor", 0, 5);  // Base pressure 20 units, noise with std=5
    energy(i) = 85 + grand(1, 1, "nor", 0, 10);  // Increased base energy to 85 units, noise with std=10
    fire(i) = 0 + grand(1, 1, "nor", 0, 0.1);  // Base fire signal 0, noise with std=0.1
    raw_material_usage(i) = 50 + grand(1, 1, "nor", 0, 5);  // Base usage 50 units, noise with std=5
    production_efficiency(i) = 90 + grand(1, 1, "nor", 0, 2);  // Base efficiency 90%, noise with std=2

    // Control logic: Fan activation based on temperature
    if temperature(i) > temp_threshold then
        fan_status(i) = 1;  // Turn on fan
    else
        fan_status(i) = 0;  // Turn off fan
    end

    // Control logic: Pressure adjustment
    if pressure(i) > pressure_threshold then
        pressure_control(i) = 1;  // Adjust pressure
    else
        pressure_control(i) = 0;  // Normal operation
    end

    // Control logic: Energy-saving measures
    if energy(i) > energy_threshold then
        energy_saving(i) = 1;  // Activate energy-saving mode
        energy(i) = energy(i) * 0.82;  // Reduce energy by 18% (as per article)
    else
        energy_saving(i) = 0;  // Normal operation
    end

    // Control logic: Fire detection and sprinkler activation
    if fire(i) > fire_threshold then
        sprinkler_status(i) = 1;  // Activate sprinkler
    else
        sprinkler_status(i) = 0;  // Turn off sprinkler
    end
end

// Step 4: Calculate energy reduction percentage (as per article)
energy_baseline = 85 * ones(1, time_steps);  // Updated baseline to match new base energy
energy_reduction_percentage = mean((energy_baseline - energy) ./ energy_baseline) * 100;
mprintf("Average Energy Reduction: %.2f%%\n", energy_reduction_percentage);

// Step 5: Save results to CSV files
write_csv([t; temperature]', "temperature_data.csv");
write_csv([t; pressure]', "pressure_data.csv");
write_csv([t; energy]', "energy_data.csv");
write_csv([t; fire]', "fire_data.csv");
write_csv([t; raw_material_usage]', "raw_material_usage.csv");
write_csv([t; production_efficiency]', "production_efficiency.csv");
write_csv([t; fan_status]', "fan_status.csv");
write_csv([t; pressure_control]', "pressure_control.csv");
write_csv([t; energy_saving]', "energy_saving.csv");
write_csv([t; sprinkler_status]', "sprinkler_status.csv");

// Step 6: Plot results
scf();  // Create a new figure

// Plot temperature and fan status
subplot(5, 1, 1);
plot(t, temperature, "b", t, temp_threshold * ones(1, time_steps), "r--", t, fan_status * temp_threshold, "g");
title("Temperature and Fan Control");
xlabel("Time (s)");
ylabel("Temperature (°C)");
legend(["Temperature", "Threshold", "Fan Status (Scaled)"]);

// Plot pressure and pressure control
subplot(5, 1, 2);
plot(t, pressure, "b", t, pressure_threshold * ones(1, time_steps), "r--", t, pressure_control * pressure_threshold, "g");
title("Pressure and Pressure Control");
xlabel("Time (s)");
ylabel("Pressure (units)");
legend(["Pressure", "Threshold", "Pressure Control (Scaled)"]);

// Plot energy and energy-saving status
subplot(5, 1, 3);
plot(t, energy, "b", t, energy_threshold * ones(1, time_steps), "r--", t, energy_saving * energy_threshold, "g");
title("Energy Consumption and Energy Saving");
xlabel("Time (s)");
ylabel("Energy (units)");
legend(["Energy", "Threshold", "Energy Saving (Scaled)"]);

// Plot fire signal and sprinkler status
subplot(5, 1, 4);
plot(t, fire, "b", t, fire_threshold * ones(1, time_steps), "r--", t, sprinkler_status * fire_threshold, "g");
title("Fire Signal and Sprinkler Control");
xlabel("Time (s)");
ylabel("Fire Signal");
legend(["Fire Signal", "Threshold", "Sprinkler Status (Scaled)"]);

// Plot raw material usage and production efficiency
subplot(5, 1, 5);
plot(t, raw_material_usage, "b", t, production_efficiency, "m");
title("Raw Material Usage and Production Efficiency");
xlabel("Time (s)");
ylabel("Units");
legend(["Raw Material Usage", "Production Efficiency"]);

// Adjust plot layout
f = gcf();
f.figure_size = [800, 600];  // Set figure size

// Save the plot
xs2png(gcf(), "simulation_results.png");
