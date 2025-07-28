function dx = pitch_dynamics(x, u)
% Parameters (hidden inside black box)
M_alpha = -0.38;
M_q     = -1.2;
M_de    = -0.5;

theta = x(1);
q     = x(2);
alpha = theta;

dx = zeros(2,1);
dx(1) = q;
dx(2) = M_alpha * alpha + M_q * q + M_de * u;
end