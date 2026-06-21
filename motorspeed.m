% Simulate speed response
omega = lsim(sys_cl, omega_ref, t);

% Integrate speed to get angular position
theta = cumtrapz(t, omega);
