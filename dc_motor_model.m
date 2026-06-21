function dx = dc_motor_model(t, x, u, params)
% DC_MOTOR_MODEL - State-space model of a DC motor
% Inputs:
%   t      - current time (required by ode45, not used here)
%   x      - state vector [omega; i]
%   u      - applied voltage
%   params - structure containing motor parameters
%
% Output:
%   dx - state derivatives [d(omega)/dt; d(i)/dt]

% Extract states
omega = x(1);  % Rotor speed
i     = x(2);  % Armature current

% Extract parameters
R  = params.R;
L  = params.L;
Kt = params.Kt;
Kb = params.Kb;
J  = params.J;
B  = params.B;
TL = params.TL;

% State-space equations
domega = (Kt * i - B * omega - TL) / J;
di     = (-R * i - Kb * omega + u) / L;

% Return derivatives
dx = [domega; di];
end
