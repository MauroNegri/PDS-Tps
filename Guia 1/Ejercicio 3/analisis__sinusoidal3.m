<<<<<<< HEAD
% t=0:Tm:0.1-Tm;
% x(t) = A*sin(2*pi*fs+phi);
% plot(t,x)

% t_ini = 0
% t_fin = 0,1
% A = 3
% Ts = 0.09s - 0.04s = 0.05 s
% fs = 1/Ts = 1/0.05 = 20 hz
% Tm = (t_fin - t_ini) / (N - 1) = (0.09 - 0.04) / (41 - 1) = 0.05 / 40 = 0.00125s
% 0.1 / 80 = 0.00125
% 80 muestras en 0.1 s
% fm = 1/Tm = 1/0.00125 = 800 hz
% t[n] = n*Tm => t1 = 5*Tm = 0.00625 s
% phi = -2*pi*fs*t1 = -2*pi*20*0.00625 = -0.25*pi = -0.785398

t_ini = 0;
t_fin = 0.1;
Tm = 0.00125;
t=0:Tm:0.1-Tm;
fm = 800;
fs = 20;
A = 3;
t1 = Tm*5;
phi = -2*pi*fs*t1;
figure(1);
[t, x] = senoidal(t_ini, t_fin, fm, fs, phi, A);
stem(t,x)
=======
% t=0:Tm:0.1-Tm;
% x(t) = A*sin(2*pi*fs+phi);
% plot(t,x)

% t_ini = 0
% t_fin = 0,1
% A = 3
% Ts = 0.09s - 0.04s = 0.05 s
% fs = 1/Ts = 1/0.05 = 20 hz
% Tm = (t_fin - t_ini) / (N - 1) = (0.09 - 0.04) / (41 - 1) = 0.05 / 40 = 0.00125s
% 0.1 / 80 = 0.00125
% 80 muestras en 0.1 s
% fm = 1/Tm = 1/0.00125 = 800 hz
% t[n] = n*Tm => t1 = 5*Tm = 0.00625 s
% phi = -2*pi*fs*t1 = -2*pi*20*0.00625 = -0.25*pi = -0.785398

t_ini = 0;
t_fin = 0.1;
Tm = 0.00125;
t=0:Tm:0.1-Tm;
fm = 800;
fs = 20;
A = 3;
t1 = Tm*5;
phi = -2*pi*fs*t1;
figure(1);
[t, x] = senoidal3(t_ini, t_fin, fm, fs, phi, A);
stem(t,x)
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
