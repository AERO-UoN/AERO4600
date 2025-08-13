% System matrices
A = [0.0090  -0.0782    0.0  -0.1710;
    -0.0311  -4.4302    0.9834   0.0;
     0.0385 -119.739   -4.2008   0.0;
     0       0          1.0      0.0];

B = [2.38    0.0;
     0.0    -0.0039;
     0.0    -0.8435;
     0.0     0.0];

% Output: pitch rate (q), which is the 3nd state
C = [0 0 1 0];
D = [0 0];

% Step 1: Compute poles and frequency with 'damp'
% (Insert your code here)
damp(A)

% Step 2: Convert to transfer function
% Only elevator input affects output (second column of B)
% Create full state-space model
% (Insert your code here)
C = [0 0 1 0];
[num, den] = ss2tf(A, B, C, D, 2);
de2q = minreal(zpk(tf(num,den)))

% Step 3: Apply modal reduction to get G_sp and G_ph
% Check the last part of this Panopto video for details: 
% https://uoncapture.ap.panopto.com/Panopto/Pages/Viewer.aspx?id=e82483e3-eee7-435b-8933-b331004e7b2c 
s = tf('s');
de2q_sp = -0.8435*(s+3.877)/(s^2+8.631*s+136.4)
de2q_pm =  -0.8435*(3.877/136.4)*s*(s-0.009629)/(s^2 - 0.009314*s + 0.004884)

% Step 4: Plot Bode plots for comparison
omega = logspace(-3,2,10000);
[magde,phasede] = bode(de2q,omega);
[magde_sp,phasede_sp] = bode(de2q_sp,omega);
[magde_pm,phasede_pm] = bode(de2q_pm,omega);

figure
bode(de2q,omega)
figure
bode(de2q_sp,omega)
figure
bode(de2q_pm,omega)

figure
subplot(2,1,1)
semilogx(omega,squeeze(20*log10(magde)),'-','Color','black','linewidth',2)
hold on
semilogx(omega,squeeze(20*log10(magde_sp)),':','Color','blue','linewidth',2)
semilogx(omega,squeeze(20*log10(magde_pm)),':','Color','red','linewidth',2)
grid minor
ylabel('$|\cdot|$ (dB)','interpreter','latex')
legend ('4th order','SP','PM')
legend("Position", [0.68967,0.63262,0.18571,0.14048])
% ylim([-60 20])

subplot(2,1,2)
semilogx(omega,squeeze(phasede),'-','Color',[0.5 0.5 0.5],'linewidth',2)
hold on
semilogx(omega,squeeze(phasede_sp),':','Color','blue','linewidth',2)
semilogx(omega,squeeze(phasede_pm),':','Color','red','linewidth',2)
grid minor
xlabel('$\omega$ (rad/s)','interpreter','latex')
ylabel('$\angle\cdot$ (deg)','interpreter','latex')
