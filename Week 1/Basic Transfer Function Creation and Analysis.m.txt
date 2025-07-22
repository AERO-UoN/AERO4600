% Define numerator and denominator
num = [1];
den = [1, 2, 2];

% Create transfer function
sys = tf(num, den);

% STEP 1: Plot the step response
% (Your code here)
step(sys);

% STEP 2: Plot the Bode plot and display gain/phase margins
% (Your code here)
bode(sys);
margin(sys);