clc;
clear;
close all;

%% Motor Parameters
R  = 1.2;      % Armature resistance (ohm)
L  = 0.01;     % Armature inductance (H)
Ke = 0.02;     % Back EMF constant (V/(rad/s))
Kt = 0.02;     % Torque constant (Nm/A)
J  = 0.02;     % Rotor inertia (kg.m^2)
B  = 0.002;    % Viscous friction coefficient
V  = 24;       % Applied voltage (V)
TL = 0.1;      % Load torque (Nm)

%% Simulation Parameters
dt = 0.01;     % Time step (s)
t_end = 5;     % Total simulation time (s)
t = 0:dt:t_end;

%% State Initialization
i = 0;         % Armature current
w = 0;         % Angular speed

speed_log = zeros(length(t),1);

%% Figure Setup
figure('Color','w');
h = plot(0,0,'b','LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('Angular Speed (rad/s)');
title('Real-Time DC Motor Speed Animation');
xlim([0 t_end]);
ylim([0 150]);

%% Real-Time Simulation Loop
for k = 1:length(t)

    % Electrical dynamics
    di = (V - R*i - Ke*w)/L;
    i  = i + di*dt;

    % Mechanical dynamics
    dw = (Kt*i - B*w - TL)/J;
    w  = w + dw*dt;

    % Log data
    speed_log(k) = w;

    % Update animation
    set(h, 'XData', t(1:k), 'YData', speed_log(1:k));
    drawnow limitrate;
    pause(0.01);   % Controls animation smoothness
end
