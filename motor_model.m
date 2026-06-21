function motor_position_tf = motor_model()

    J = 0.01;
    b = 0.1;
    K = 0.01;
    R = 1;
    L = 0.5;

    num = K;
    den = [J*L (J*R + L*b) (b*R + K^2)];

    motor_speed_tf = tf(num, den);
    motor_position_tf = motor_speed_tf * tf(1,[1 0]);
end
