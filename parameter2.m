% DC motor parameters
J = 0.01;     % inertia (kg.m^2)
b = 0.1;      % damping coefficient
K = 0.01;     % motor constant
R = 1;        % resistance (ohm)
L = 0.5;      % inductance (H)

% Transfer function: Speed / Voltage
num = K;
den = [J*L (J*R + L*b) (b*R + K^2)];
motor_tf = tf(num, den);
