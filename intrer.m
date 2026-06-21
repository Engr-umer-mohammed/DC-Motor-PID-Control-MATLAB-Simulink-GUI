% Feedback gains (tuned manually for demonstration)
K = [1, 0.5];

% Initialize state
x = [0; 0];

for k = 1:length(time)
    % Compute control voltage
    u = state_feedback(x, K, omega_ref);
    
    % Compute state derivatives
    dx = dc_motor_model(time(k), x, u, params);
    
    % Update state
    x = x + dx*dt;
    
    % Store history
    omega_history(k) = x(1);
end

% Plot results
figure;
plot(time, omega_history,'LineWidth',2);
hold on; yline(omega_ref,'r--','Reference');
xlabel('Time [s]');
ylabel('Rotor Speed [rad/s]');
title('DC Motor Speed Response with State-Feedback Control');
grid on;
