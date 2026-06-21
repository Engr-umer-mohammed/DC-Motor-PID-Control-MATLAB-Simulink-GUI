clc; clear; close all;

% Load parameters
params.R  = 2;
params.L  = 0.5;
params.Kt = 0.1;
params.Kb = 0.1;
params.J  = 0.01;
params.B  = 0.001;
params.TL = 0;

% Simulation parameters
dt = 0.01;
t_end = 5;
time = 0:dt:t_end;

% Reference speed
omega_ref = 100;  % rad/s

% PID gains
Kp = 1;
Ki = 0.5;
Kd = 0.02;

% Initialize state
x = [0; 0];        % [omega; i]
integral = 0;
prev_error = 0;

% Store results
omega_history = zeros(length(time),1);
i_history     = zeros(length(time),1);
u_history     = zeros(length(time),1);

for k = 1:length(time)
    % Compute control voltage
    [u, integral, prev_error] = pid_controller(omega_ref, x(1), dt, Kp, Ki, Kd, integral, prev_error);
    
    % Compute state derivatives
    dx = dc_motor_model(time(k), x, u, params);
    
    % Update state using Euler method
    x = x + dx*dt;
    
    % Store history
    omega_history(k) = x(1);
    i_history(k)     = x(2);
    u_history(k)     = u;
end

% Plot results
figure;
plot(time, omega_history,'LineWidth',2);
hold on; yline(omega_ref,'r--','Reference');
xlabel('Time [s]');
ylabel('Rotor Speed [rad/s]');
title('DC Motor Speed Response with PID Control');
grid on;

figure;
plot(time, u_history,'LineWidth',2);
xlabel('Time [s]');
ylabel('Control Voltage [V]');
title('PID Control Voltage');
grid on;
