% State-space model
[A,B,C,D] = ssdata(ss(motor_position_tf));

% Desired closed-loop poles
desired_poles = [-4 -5 -6];

% State feedback gain
Ksf = place(A, B, desired_poles);

% Closed-loop system
Acl = A - B*Ksf;
sys_sf = ss(Acl, B, C, D);

% Simulate response
theta_sf = lsim(sys_sf, theta_ref, t);
