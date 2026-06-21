for k = 1:length(t)

    x = shaft_length * cos(theta(k));
    y = shaft_length * sin(theta(k));

    set(shaft, 'XData', [0 x], 'YData', [0 y]);
    set(time_text, 'String', sprintf('Time = %.2f s', t(k)));

    drawnow
pause(0.2) % smoother and more cinematic

end
