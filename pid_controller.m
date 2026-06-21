function u = pid_controller(e, e_integral, e_derivative, Kp, Ki, Kd)
% PID_CONTROLLER - Compute PID control signal
%
% Inputs:
%   e           - current error (omega_ref - omega)
%   e_integral  - integral of error
%   e_derivative- derivative of error
%   Kp, Ki, Kd  - PID gains
%
% Output:
%   u           - control signal (applied voltage)

u = Kp * e + Ki * e_integral + Kd * e_derivative;
end
