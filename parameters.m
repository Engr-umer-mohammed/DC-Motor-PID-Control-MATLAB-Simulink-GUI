%% DC Motor Parameters and Simulation Settings

% Motor Parameters
params.R  = 2;      % Armature resistance (Ohms)
params.L  = 0.5;    % Armature inductance (H)
params.Kt = 0.1;    % Motor torque constant (N*m/A)
params.Kb = 0.1;    % Back-EMF constant (V*s/rad)
params.J  = 0.01;   % Rotor inertia (kg*m^2)
params.B  = 0.001;  % Viscous friction (N*m*s)
params.TL = 0;      % Load torque (N*m)

% Simulation Settings
t_start = 0;        % Start time (s)
t_end   = 5;        % End time (s)
dt      = 0.01;     % Time step for simulation
omega_ref = 10;     % Reference speed (rad/s)
