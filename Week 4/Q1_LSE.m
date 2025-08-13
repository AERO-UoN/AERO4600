% --- Data Preparation ---

% Form input regression matrix phi 
phi = [1 1;
    2 1;
    3 1;
    4 1;
    5 1];

% Form output measurement vector y 
y = [2 4 5 4 5]';

% Form rectangular matrix 𝐴
A = phi'*phi;

% Form b matrix
b = phi'*y;

% Solve with Method 1: A\b
theta1 = A\b

% Solve with Method 2: pinv(A)*b;
theta2 = pinv(A)*b

% Solve with Method 3: inv(A'*A)*A’*b
theta3 = inv(A'*A)*A'*b

% Can you find other solving methods?

% Using polyfit
x = [1 2 3 4 5]';
p = polyfit(x, y, 1);
a_polyfit = p(1)
b_polyfit = p(2)