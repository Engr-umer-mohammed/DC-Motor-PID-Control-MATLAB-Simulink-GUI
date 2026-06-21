function animate_motor_3D(omega_history, time)
clc;
figure('Color','w');
axis equal
axis([-1 1 -1 1 -0.5 0.5])
view(45,20)
grid on
hold on
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D DC Motor Shaft Animation')

%% Shaft and rotor
[shaftX, shaftY, shaftZ] = cylinder([0.05 0.05], 50);
shaftZ = shaftZ - 0.25; % center shaft
shaft = surf(shaftX, shaftY, shaftZ, 'FaceColor', [0 0 1], 'EdgeColor', 'none');

[rotorX, rotorY, rotorZ] = cylinder([0.2 0.2], 50);
rotorZ = rotorZ * 0.05 - 0.025; % thin disk
rotor = surf(rotorX, rotorY, rotorZ + 0.25, 'FaceColor', [1 0 0], 'EdgeColor','none');

%% Animation parameters
dt = time(2) - time(1);
theta = 0;
time_scale = 0.5; % slow down animation by half

%% Animation loop
for k = 1:length(time)
    % Update angle
    theta = theta + omega_history(k) * dt * time_scale;

    % Rotation matrix about Z axis
    R = [cos(theta) -sin(theta) 0;
         sin(theta)  cos(theta) 0;
              0           0     1];

    % Rotate shaft
    shaftVertices = [shaftX(:), shaftY(:), shaftZ(:)] * R';
    set(shaft, 'XData', reshape(shaftVertices(:,1), size(shaftX)), ...
               'YData', reshape(shaftVertices(:,2), size(shaftY)), ...
               'ZData', reshape(shaftVertices(:,3), size(shaftZ)));

    % Rotate rotor
    rotorVertices = [rotorX(:), rotorY(:), rotorZ(:)] * R';
    set(rotor, 'XData', reshape(rotorVertices(:,1), size(rotorX)), ...
                'YData', reshape(rotorVertices(:,2), size(rotorY)), ...
                'ZData', reshape(rotorVertices(:,3), size(rotorZ)));

    drawnow
    pause(dt); % make the animation follow real time
end
end
