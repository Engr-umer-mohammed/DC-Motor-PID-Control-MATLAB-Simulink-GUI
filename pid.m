% PID controller gains
Kp = 100;
Ki = 200;
Kd = 1;

C_pid = pid(Kp, Ki, Kd);

% Closed-loop system
sys_cl = feedback(C_pid * motor_tf, 1);
