## Producto interno -> mide el grado de parecido entre dos señales:
## señales muy parecidas => valor alto
## señales ortogonales (sin parecido) => 0
## señales opuestas => valor negativo
clear;clc;
fm = 100;
t_ini = 0;
t_fin = 1;
N = fm * t_fin;

## Caso 1: misma frecuencia, misma fase, misma amplitud
[t, x1] = senoidal(t_ini, t_fin, fm, 5, 0, 1);
[t, x2] = senoidal(t_ini, t_fin, fm, 5, 0, 1);
pi_1 = sum(x1 .* x2); # producto interno alto

figure(1);
subplot(2,1,1); plot(t, x1, 'b', t, x2, 'r--');
title(['Caso 1: misma señal - pi_1 = ' num2str(pi_1)]);
legend('x1', 'x2'); xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2); plot(t, x1.*x2, 'k');
title('Producto x1*x2');
xlabel('t[s]'); ylabel('x1*x2');

## Caso 2: misma frecuencia, misma fase, distinta amplitud
[t, x3] = senoidal(t_ini, t_fin, fm, 5, 0, 1);
[t, x4] = senoidal(t_ini, t_fin, fm, 5, 0, 3);
pi_2 = sum(x3 .* x4); # el producto interno escala con la amplitud

figure(2);
subplot(2,1,1); plot(t, x3, 'b', t, x4, 'r--');
title(['Caso 2: distinta amplitud - pi_2 = ' num2str(pi_2)]);
legend('x3(A=1)', 'x4(A=3)'); xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2); plot(t, x3.*x4, 'k');
title('Producto x3*x4');
xlabel('t[s]'); ylabel('x3*x4');

## Caso 3: misma frecuencia, fase opuesta (sin(x+pi)= −sin(x)), misma amplitud
[t, x5] = senoidal(t_ini, t_fin, fm, 5, 0,  1);
[t, x6] = senoidal(t_ini, t_fin, fm, 5, pi, 1);
pi_3 = sum(x5 .* x6); # señales opuestas, producto interno negativo

figure(3);
subplot(2,1,1); plot(t, x5, 'b', t, x6, 'r--');
title(['Caso 3: fase opuesta (pi) - pi_3 = ' num2str(pi_3)]);
legend('x5(phi=0)', 'x6(phi=pi)'); xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2); plot(t, x5.*x6, 'k');
title('Producto x5*x6');
xlabel('t[s]'); ylabel('x5*x6');

## Caso 4: misma frecuencia, fase pi/2 (ortogonales, sin(x+pi/2)= cos(x)), misma amplitud
[t, x7] = senoidal(t_ini, t_fin, fm, 5, 0,    1);
[t, x8] = senoidal(t_ini, t_fin, fm, 5, pi/2, 1);
pi_4 = sum(x7 .* x8); # producto interno 0

figure(4);
subplot(2,1,1); plot(t, x7, 'b', t, x8, 'r--');
title(['Caso 4: fase pi/2 (ortogonales) - pi_4 = ' num2str(pi_4)]);
legend('x7(phi=0)', 'x8(phi=pi/2)'); xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2); plot(t, x7.*x8, 'k');
title('Producto x7*x8');
xlabel('t[s]'); ylabel('x7*x8');

## Caso 5: distinta frecuencia (ortogonales), misma fase, misma amplitud
[t, x9]  = senoidal(t_ini, t_fin, fm, 5, 0, 1);
[t, x10] = senoidal(t_ini, t_fin, fm, 3, 0, 1);
pi_5 = sum(x9 .* x10); # producto interno 0, senoidales de distinta frecuencia son ortogonales

figure(5);
subplot(2,1,1); plot(t, x9, 'b', t, x10, 'r--');
title(['Caso 5: distinta frecuencia (ortogonales) - pi_5 = ' num2str(pi_5)]);
legend('x9(fs=5)', 'x10(fs=3)'); xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2); plot(t, x9.*x10, 'k');
title('Producto x9*x10');
xlabel('t[s]'); ylabel('x9*x10');

disp('PRODUCTO INTERNO');
disp(['Caso 1(identicas): PI_1 = ' num2str(pi_1)]);
disp(['Caso 2(dist. amplitud A=3): PI_2 = ' num2str(pi_2)]);
disp(['Caso 3(fase opuesta): PI_3 = ' num2str(pi_3)]);
disp(['Caso 4(fase pi/2): PI_4 = ' num2str(pi_4)]);
disp(['Caso 5(dist. frecuencia): PI_5 = ' num2str(pi_5)]);

## Producto interno normalizado
## PI = ||x|| * ||y|| * cos(phi)
## cos(phi) = PI / (||x|| * ||y||)
## - cos(phi) =  1 => señales identicas (phi = 0°)
## - cos(phi) =  0 => señales ortogonales (phi = 90°)
## - cos(phi) = -1 => señales opuestas (phi = 180°)

# energia = norma2(||x||)^2
# norma 2 de una señal = sqrt(∑ x[n]^2) = sqrt(energia)
norma = @(x) sqrt(sum(x .^ 2));

pi_norm_1 = pi_1/(norma(x1)*norma(x2));
pi_norm_2 = pi_2/(norma(x3)*norma(x4));
pi_norm_3 = pi_3/(norma(x5)*norma(x6));
pi_norm_4 = pi_4/(norma(x7)*norma(x8));
pi_norm_5 = pi_5/(norma(x9)*norma(x10));

disp('PRODUCTO INTERNO NORMALIZADO');
disp(['Caso 1(identicas): PI_1 = ' num2str(pi_norm_1)]);
disp(['Caso 2(dist. amplitud A=3): PI_2 = ' num2str(pi_norm_2)]);
disp(['Caso 3(fase opuesta): PI_3 = ' num2str(pi_norm_3)]);
disp(['Caso 4(fase pi/2): PI_4 = ' num2str(pi_norm_4)]);
disp(['Caso 5(dist. frecuencia): PI_5 = ' num2str(pi_norm_5)]);
