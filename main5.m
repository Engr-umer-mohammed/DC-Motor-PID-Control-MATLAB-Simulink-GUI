clc; clear; close all;

%% Load parameters
run('parameters.m');

% PID Gains
Kp= 30;
Ki = 40;
Kd = 2;

% Initialize states
x = [0; 0];                  % [omega; i]
omega_history = zeros(size(t_start:dt:t_end));
i_history = zeros(size(omega_history));
u_hifstory = zeros(size(omega_history));
e_integral = 0;
e_prev = 0;

% Time vector
time = t_start:dt:t_end;

%% Simulation loop with PID control
for k = 1:length(time)
    % Current error
    e = omega_ref - x(1);
    
    % Integral and derivative
    e_integral = e_integral + e * dt;
    e_derivative = (e - e_prev) / dt;
    
    % Compute control voltage
    u = pid_controller(e, e_integral, e_derivative, Kp, Ki, Kd);
    
    % Update state using Euler integration
    dx = dc_motor_model(time(k), x, u, params);
    x = x + dx*dt;
    
    % Store results
    omega_history(k) = x(1);
    i_history(k) = x(2);
    u_history(k) = u;
    
    % Update previous error
    e_prev = e;
end

%% Plot rotor speed
figure;
plot(time, omega_history, 'LineWidth', 2);
hold on; plot(time, omega_ref*ones(size(time)), '--r');
xlabel('Time [s]'); ylabel('Rotor Speed [rad/s]');
title('DC Motor Speed with PID Control');
legend('Actual Speed','Reference Speed');
grid on;

%% Plot armature current
figure;
plot(time, i_history, 'LineWidth', 2);
xlabel('Time [s]'); ylabel('Armature Current [A]');
title('DC Motor Armature Current');
grid on;

%% Plot control voltage
figure;
plot(time, u_history, 'LineWidth', 2);
xlabel('Time [s]'); ylabel('Control Voltage [V]');
title('PID Controller Output Voltage');
grid on;
%% Animate the motor in 3D
animate_motor_3D(omega_history, time);
