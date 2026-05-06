clear;clc;
t_ini = -1;
t_fin = 1;
fm = 1000;
A = 1;
fs_vec = 1:10; # frecuencias 1 a 10 Hz

## Parte 1: combinacion lineal sin fase
[t, ~] = senoidal(t_ini, t_fin, fm, fs_vec(1), 0, A);
N = length(t);
Y = zeros(length(fs_vec), N);
for i = 1:length(fs_vec)
  [~, Y(i,:)] = senoidal(t_ini, t_fin, fm, fs_vec(i), 0, A);
endfor

x = sum(Y, 1); # combinacion lineal, suma por c/senoidal (fila)

# similitud = <x, y_k> / (||x||*||y_k||)
numerador = sum(x .* Y, 2); # sumar por columnas c/instante de tiempo <x, y_k>
denominador = sqrt(sum(x.^2) * sum(Y.^2, 2));
parecido_1 = numerador ./ denominador;

disp('Parte 1: Parecido con senoidales sin fase');
disp('Freq | Similitud');
for i = 1:length(fs_vec)
    fprintf('%2d   |  %.4f\n', fs_vec(i), parecido_1(i));
endfor

figure(1);
bar(fs_vec, parecido_1);
title('Parte 1: Parecido con senoidales sin fase');
xlabel('Frecuencia');
ylabel('Similitud cosenoidal');
## todas deberian dar parecido similar porque
## x es suma de senoidales casi ortogonales entre si
## cada una contribuye igualmente a x

## PARTE 2: combinacion lineal con fase variable
phi_var = rand(1, length(fs_vec)) * pi; # fases aleatorias

Y_fase = zeros(length(fs_vec), N);
for i = 1:length(fs_vec)
  [~, Y_fase(i,:)] = senoidal(t_ini, t_fin, fm, fs_vec(i), phi_var(i), A);
endfor

x_fase = sum(Y_fase, 1);

numerador_f = sum(x_fase .* Y, 2);
denominador_f = sqrt(sum(x_fase.^2) * sum(Y.^2, 2));
parecido_2 = numerador_f ./ denominador_f;

disp('');
disp('Parte 2: Parecido con senoidales con fase variable');
disp('Freq |  Fase   | Similitud');
for i = 1:length(fs_vec)
    fprintf('%2d   | %.4f  |  %.4f\n', fs_vec(i), phi_var(i), parecido_2(i));
endfor

figure(2);
bar(fs_vec, parecido_2);
title('Parte 2: Parecido con senoidales con fase variable');
xlabel('Frecuencia');
ylabel('Similitud cosenoidal');
## el parecido varia entre frecuencias porque
## al cambiar la fase cada senoidal se desalinea con x
## las de fase mas cercana a 0 se parecen mas

## Parte 3: señal cuadrada de 5.5 Hz
[t, x_cuad] = ondacuadrada(t_ini, t_fin, fm, 5.5, 0);

## comparamos el parecido con las Y del caso 1
numerador_c = sum(x_cuad .* Y, 2);
denominador_c = sqrt(sum(x_cuad.^2) * sum(Y.^2, 2));
parecido_3 = numerador_c ./ denominador_c;

disp('');
disp('Parte 3: Parecido de cuadrada 5.5 Hz con senoidales 1-10 Hz');
disp('Freq | Similitud');
for i = 1:length(fs_vec)
    fprintf('%2d   |  %.4f\n', fs_vec(i), parecido_3(i));
endfor

figure(3);
bar(fs_vec, parecido_3);
title('Parte 3: Parecido de cuadrada 5.5 Hz con senoidales 1-10 Hz');
xlabel('Frecuencia');
ylabel('Similitud cosenoidal');
## 5.5 Hz no esta en el conjunto {1,...,10}
## la cuadrada tiene armonicos impares: 5.5, 16.5, 27.5 Hz
## ninguno coincide con 1-10 Hz => parecido bajo y sin pico claro en ninguna frecuencia
