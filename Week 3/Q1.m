A = [0, 1; -0.38, -1.2];
B = [0; -0.5];
C = [1, 0];
D = 0;

% Construct state-space system with 'ss'
sys = ss(A, B, C, D);

% Convert to transfer function with 'ss2tf'
[num, den] = ss2tf(A, B, C, D);

% Create transfer function with 'tf(num, den)'
tf_sys = tf(num, den);

% Plot step response
step(tf_sys);
title('Step Response from Elevator Input to Pitch Angle');