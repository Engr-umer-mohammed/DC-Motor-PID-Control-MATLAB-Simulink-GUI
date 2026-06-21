%% DC Motor Parameters
R  = 2;      % Armature resistance (Ohms)
L  = 0.5;    % Armature inductance (H)
Kt = 0.1;    % Motor torque constant (N*m/A)
Kb = 0.1;    % Back-EMF constant (V*s/rad)
J  = 0.01;   % Rotor inertia (kg*m^2)
B  = 0.001;  % Viscous friction (N*m*s)
TL = 0;      % Load torque (N*m)

%% Simulation Parameters
t_start = 0;        % Simulation start time
t_end   = 5;        % Simulation end time
dt      = 0.01;     % Time step for plotting/animation
