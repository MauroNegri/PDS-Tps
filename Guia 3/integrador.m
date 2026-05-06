## Parte 1
clear;clc;
fm = 1000;
N = 500;
t_ini = 0;
t_fin = N/fm; # 0.5 segundos para tener exactamente 500 muestras
fs = 100;
A = 1;
phi = 0;

## señal senoidal
[t, x_sen] = senoidal(t_ini, t_fin, fm, fs, phi, A);

## ruido normal con varianza 0.5 = desviacion estandar sqrt(0.5)
## randn genera N(0,1), para varianza 0.5 multiplicamos por sqrt(0.5)
x_ruido = randn(1, N) * sqrt(0.5);

## señal compuesta
x = x_sen + x_ruido;

## norma-2: ||x||_2 = sqrt(∑ x[n]^2)
norma2 = sqrt(sum(x.^2));

## energia: E = ||x||_2^2 = ∑ x[n]^2
E = norma2^2;

## RMS: raiz de la potencia o valor cuadratico medio
## Potencia media: P = (1/N) * ∑ x[n]^2 = E/N
## RMS = sqrt(P) = sqrt(E/N) = sqrt(∑x^2 / N) = ||x||_2 / sqrt(N)
RMS = norma2 / sqrt(N);
##RMS = sqrt(E/N)

## accion: Acc = ∑ |x[n]|
## suma de los valores absolutos
Acc = sum(abs(x));

## amplitud: (max - min) / 2
## mitad del rango total de la señal
amp = (max(x) - min(x)) / 2;

figure(1); clf;
subplot(2,1,1);
plot(t, x_sen, 'b', 'DisplayName', 'senoidal pura');
hold on;
plot(t, x, 'r', 'DisplayName', 'x[n] = sen + ruido');
title('Parte 1: Señal compuesta x[n]');
xlabel('t [s]'); ylabel('x[n]');
legend('show');
hold off;

subplot(2,1,2);
plot(t, x_ruido, 'g', 'DisplayName', 'ruido');
title('Componente de ruido');
xlabel('t [s]'); ylabel('ruido[n]');
legend('show');

disp('PARTE 1');
disp(['Norma-2 = ' num2str(norma2)]);
disp(['Energia = ' num2str(E)]);
disp(['RMS ' num2str(RMS)]);
disp(['Accion = ' num2str(Acc)]);
disp(['Amplitud = ' num2str(amp)]);
## Energia esperada: E_sen + E_ruido = A^2/2*N + var*N = 500, var = 0.5
## RMS esperado: sqrt((A^2/2 + var)) = 1

## Parte 2
## Señal de referencia: senoidal pura de 100Hz, misma longitud que x
[~, y] = senoidal(t_ini, t_fin, fm, fs, phi, A);
y_norm = y / norm(y);

## Producto interno entre x y la referencia normalizada
PI = sum(x .*y_norm);

## Angulo entre las señales
## cos(θ) = PI / (||x|| * ||y||)
## Como y_norm => 1, queda: cos(θ) = PI / ||x||
## cos_theta = PI / (norm(x) * norm(y_norm));
cos_theta = PI / norm(x);
theta_rad = acos(cos_theta);
theta_deg = theta_rad * 180 / pi;
E_y = sqrt(sum(y.^2))^2;
E_ruido = sqrt(sum(x_ruido.^2))^2;
## theta = 0° -> señales identicas (paralelas)
## theta = 90° -> señales ortogonales (sin parecido)
## theta = 180° -> señales opuestas

disp('');
disp('PARTE 2');
disp(['Norma de y_norm: ', num2str(norm(y_norm))]);
disp(['Energia de y = ' num2str(E_y)]);
disp(['Energia de x_ruido = ' num2str(E_ruido)]);
disp(['Producto interno <x, y_norm>: ', num2str(PI)]);
disp(['Coseno del angulo: ', num2str(cos_theta)]);
disp(['Angulo entre señales:' num2str(theta_rad) ' = ' num2str(theta_deg)]);

figure(2); clf;
plot(t, x, 'r', 'DisplayName', 'x[n] ruidosa');
hold on;
plot(t, y, 'b', 'DisplayName', 'y[n] referencia');
title('Parte 2: señal ruidosa vs referencia');
xlabel('t [s]'); ylabel('amplitud');
legend('show'); hold off;

## Parte 3
## Aproximar x usando base ortonormal de dos vectores:
## phi1 = senoidal de 100Hz normalizada
## phi2 = senoidal de 200Hz normalizada

phi1 = y_norm;
[~, phi2] = senoidal(t_ini, t_fin, fm, 200, phi, A);
phi2 = phi2 / norm(phi2); # normalizar para base ortonormal

## <phi1,phi1> = <phi2,phi2> = 1
ortogonal = sum(phi1 .* phi2);
disp('');
disp('PARTE 3');
disp('Verificacion de ortogonalidad:');
disp(['<phi1, phi2> = ' num2str(ortogonal)]); # = 0 ortogonales
disp(['||phi1|| = ' num2str(sum(phi1 .* phi1))]); # = 1
disp(['||phi2|| = ' num2str(norm(phi2))]); # = 1

## Coeficientes de proyeccion
## si la base es ortonormal, alpha_i = <x, phi_i>
alpha1 = PI; # = <x, phi1> = <x, y_norm>
alpha2 = sum(x .* phi2);

disp(['alpha1 = <x, phi1> = ' num2str(alpha1)]);
disp(['alpha2 = <x, phi2> = ' num2str(alpha2)]);

## Señal aproximada
## x_aprox = alpha1*phi1 + alpha2*phi2
x_aprox = alpha1 * phi1 + alpha2 * phi2;

## Error cuadratico total
## ECT = ||x - x_aprox||^2 (norma-2 al cuadrado)
ECT = sum((x - x_aprox).^2);

## el ECT representa la energia que no pudo ser capturada por la base {phi1, phi2}
## si ECT es grande, la base simplificada no representa bien a x
disp(['Energía de x: ' num2str(E)]);
disp(['ECT: ' num2str(ECT)]);
disp(['Energía capturada: ' num2str(E - ECT) ' (' num2str((E-ECT)/E*100) '%)']);

figure(3); clf;
subplot(3,1,1);
plot(t, x, 'r', 'DisplayName', 'x[n] original');
title('Parte 3: señal original');
xlabel('t [s]'); ylabel('amplitud');
legend('show');

subplot(3,1,2);
plot(t, x_aprox, 'b', 'DisplayName', 'x aprox');
title('Señal aproximada con {phi1, phi2}');
xlabel('t [s]'); ylabel('amplitud');
legend('show');

subplot(3,1,3);
plot(t, x - x_aprox, 'g', 'DisplayName', 'error = x - x aprox');
title('Error de aproximación');
xlabel('t [s]'); ylabel('amplitud');
legend('show');

## Parte 4
## Si cambio de fase a y en 90°, se convierte en un coseno puro
## sin y cos de la misma frecuencia son ortogonales: <sin, cos> = 0
## El producto interno cae
[~, y90] = senoidal(t_ini, t_fin, fm, fs, pi/2, A);
y90_norm = y90 / norm(y90);

PI_90 = sum(x .* y90_norm);
cos_theta_90 = PI_90 / (norm(x) * norm(y90_norm));
theta_rad_90 = acos(cos_theta_90);
theta_deg_90 = theta_rad_90 * 180 / pi;

## Verificar ortogonalidad entre y_original y y_fase 90°
ortog_y_y90 = sum(y_norm .* y90_norm);

disp('');
disp('PARTE 4');
disp(['<y, y90> = ' num2str(ortog_y_y90)]); # = 0 ortogonales
disp(['PI original <x, y> = ' num2str(PI)]);
disp(['PI con fase <x, y90> = ' num2str(PI_90)]);
disp(['Angulo con y = ' num2str(theta_deg) ' grados']);
disp(['Angulo con y90 = ' num2str(theta_deg_90) ' grados']);
