clc;
% Parameters
M1 = 1; 
M2 = 0.5;  
u = 0.02; 
g = 9.81;  
k = 1;      

num = [M2, u*M2*g, k];
den = [M1*M2, ...
    (u*M1*g*M2 + u*M2*g*M1), ...
    (u*M1*g*u*M2*g + k*M1 + k*M2), ...
    (u*M1*g*k + u*M2*g*k)];

sys = tf(num, den)

% PID controller parameters
Kp = 0.2;  
Ki = 0.06;  
Kd = 0;  

pid_controller = pid(Kp, Ki, Kd);
% Closed-loop system
cl_sys = feedback(pid_controller * sys, 1);

% Making square wave
t = 0:1:10000;
freq = 0.001;
u = square(2*pi*freq*t);

% Simulate the response to the square wave input
[y, t_out] = lsim(cl_sys, u, t);

% Plot the response
plot(t, u);
ylabel('Input');
figure;
plot(t_out, y);
grid on;
ylabel('Output');



