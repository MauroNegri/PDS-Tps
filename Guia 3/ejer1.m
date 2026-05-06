# SEÑAL 1: SENOIDAL
# x(t) = A*sin(2*pi*fs*t + phi)
fm = 100;
T = 1/fm;
t_ini = 0;
t_fin = 1;
N = fm * t_fin;
A = 3;
fs = 5;
phi = 0;
[t, x_sen] = senoidal(t_ini, t_fin, fm, fs, phi, A);
## 1. Valor medio: promedio de todos los valores para una senoidal
media_sen = mean(x_sen);

## 2. Maximo: valor mas alto que alcanza la señal para una senoidal de amplitud A
max_sen = max(x_sen);

## 3. Minimo: valor mas bajo que alcanza la señal para una senoidal de amplitud A (-A)
min_sen = min(x_sen);

## 4. Amplitud: mitad de la diferencia entre maximo y minimo es la "altura" de la señal desde el centro
amp_sen = (max_sen - min_sen) / 2;

## 5. Energia: suma de los cuadrados de todas las muestras E = ∑ x[n]^2 para una senoidal de amplitud A: E = A^2/2 * N
E_sen = sum(x_sen .^ 2);

## 6. Accion: suma de los valores absolutos de todas las muestras Acc = ∑ |x[n]|
Acc_sen = sum(abs(x_sen));

## 7. Potencia media: energia dividida por la cantidad de muestras P = (1/N) * ∑ x[n]^2 = E/N para una senoidal de amplitud A: P = A^2/2
P_sen = mean(x_sen .^ 2);

## 8. RMS (raiz del valor cuadratico medio): raiz de la potencia media RMS = sqrt(P) = sqrt((1/N) * ∑ x[n]^2) para una senoidal de amplitud A: RMS = A/sqrt(2)
RMS_sen = sqrt(P_sen);
RMS_sen2 = sqrt(media_sen);

# Grafica
figure(1);
plot(t, x_sen, 'b', 'DisplayName', 'señal');
hold on;
hline(t, media_sen, 'r', 'Media');
hline(t, max_sen, 'g', 'Maximo');
hline(t, min_sen, 'm', 'Minimo');
hline(t, RMS_sen, 'k', 'RMS');
hline(t, -RMS_sen, 'k', '-RMS');
title('Señal Senoidal');
xlabel('t[s]'); ylabel('x[n]');
legend('show');
axis([0 1 -3.5 3.5]);
hold off;

disp('SENOIDAL');
disp(['Media:    ' num2str(media_sen) ', Esperado: 0']);
disp(['Maximo:   ' num2str(max_sen) ', Esperado: ' num2str(A)]);
disp(['Minimo:   ' num2str(min_sen) ', Esperado: ' num2str(-A)]);
disp(['Amplitud: ' num2str(amp_sen) ', Esperado: ' num2str(A)]);
disp(['Energia:  ' num2str(E_sen) ', Esperado: ' num2str(A^2/2 * N)]);
disp(['Accion:   ' num2str(Acc_sen)]);
disp(['Potencia: ' num2str(P_sen) ', Esperado: ' num2str(A^2/2)]);
disp(['RMS:      ' num2str(RMS_sen) ', Esperado: ' num2str(A/sqrt(2))]);
disp(['RMS:      ' num2str(RMS_sen2) ', Esperado: ' num2str(A/sqrt(2))]);


## SEÑAL 2: RAMPA
## x[n] = n (crece linealmente de 0 a 1)
x_ramp = t_ini:T:t_fin-T;

## 1. Valor medio: para una rampa de 0 a 1 deberia ser 0.5 es el valor del punto medio de la rampa
media_ramp = mean(x_ramp);
## 2. Maximo: ultimo valor de la rampa
max_ramp = max(x_ramp);
## 3. Minimo: primer valor de la rampa
min_ramp = min(x_ramp);
## 4. Amplitud: mitad del rango total recorrido por la rampa
amp_ramp = max(abs(x_ramp));
## 5. Energia: suma de cuadrados
E_ramp = sum(x_ramp .^ 2);
## 6. Accion: como la rampa es positiva es igual a la suma de sus valores
Acc_ramp = sum(abs(x_ramp));
## 7. Potencia media
P_ramp = mean(x_ramp .^ 2);
## 8. RMS
RMS_ramp = sqrt(P_ramp);

figure(2);
plot(t, x_ramp, 'b', 'DisplayName', 'señal');
hold on;
hline(t, media_ramp, 'r', 'Media');
hline(t, max_ramp, 'g', 'Maximo');
hline(t, min_ramp, 'm', 'Minimo');
hline(t, RMS_ramp, 'k', 'RMS');
title('Señal Rampa');
xlabel('t[s]'); ylabel('x[n]');
legend('show');
axis([0 1 -0.5 1.5]);
hold off;

disp("");
disp('RAMPA');
disp(['Media:    ' num2str(media_ramp) ', Esperado: 0.5']);
disp(['Maximo:   ' num2str(max_ramp) ', Esperado: ' num2str(x_ramp(length(x_ramp)))]);
disp(['Minimo:   ' num2str(min_ramp) ', Esperado: ' num2str(x_ramp(1))]);
disp(['Amplitud: ' num2str(amp_ramp)]);
disp(['Energia:  ' num2str(E_ramp)]);
disp(['Accion:   ' num2str(Acc_ramp)]);
disp(['Potencia: ' num2str(P_ramp)]);
disp(['RMS:      ' num2str(RMS_ramp)]);

## SEÑAL 3: ONDA CUADRADA
## vale +1 o -1 segun la fase
[t, x_cuad] = ondacuadrada(t_ini, t_fin, fm, fs, phi);

## 1. Valor medio: para una cuadrada simetrica deberia ser 0 mitad del tiempo vale +1 y mitad -1
media_cuad = mean(x_cuad);
## 2. Maximo: siempre +1
max_cuad = max(x_cuad);
## 3. Minimo: siempre -1
min_cuad = min(x_cuad);
## 4. Amplitud: (1-(-1))/2 = 1
amp_cuad = (max_cuad - min_cuad) / 2;
## 5. Energia: como todos los valores son +1 o -1, x[n]^2=1 siempre E = N
E_cuad = sum(x_cuad .^ 2);
## 6. Accion: como |x[n]|=1 siempre, Acc = N
Acc_cuad = sum(abs(x_cuad));
## 7. Potencia media: E/N = 1 siempre
P_cuad = mean(x_cuad .^ 2);
## 8. RMS: sqrt(1) = 1 siempre
RMS_cuad = sqrt(P_cuad);

figure(3);
plot(t, x_cuad, 'b', 'DisplayName', 'señal');
hold on;
hline(t, media_cuad, 'r', 'Media');
hline(t, max_cuad, 'g', 'Maximo');
hline(t, min_cuad, 'm', 'Minimo');
hline(t, RMS_cuad, 'k', 'RMS');
title('Onda Cuadrada');
xlabel('t[s]'); ylabel('x[n]');
legend('show');
axis([0 1 -1.5 1.5]);
hold off;

disp("");
disp('ONDA CUADRADA');
disp(['Media:    ' num2str(media_cuad) ', Esperado: 0']);
disp(['Maximo:   ' num2str(max_cuad) ', Esperado: 1']);
disp(['Minimo:   ' num2str(min_cuad) ', Esperado: -1']);
disp(['Amplitud: ' num2str(amp_cuad) ', Esperado: 1']);
disp(['Energia:  ' num2str(E_cuad) ', Esperado: ' num2str(N)]);
disp(['Accion:   ' num2str(Acc_cuad) ', Esperado: ' num2str(N)]);
disp(['Potencia: ' num2str(P_cuad) ', Esperado: ' num2str(E_cuad/N)]);
disp(['RMS:      ' num2str(RMS_cuad) ', Esperado: 1']);

## SEÑAL 4: ALEATORIA GAUSSIANA
## media=0, varianza=1
x_rand = randn(1, N);

## 1. Valor medio: deberia ser 0 (gaussiana media 0) con N grande converge a 0 por ergodicidad
media_rand = mean(x_rand);
## 2. Maximo: valor extremo positivo, depende de cada realizacion
max_rand = max(x_rand);
## 3. Minimo: valor extremo negativo, depende de cada realizacion
min_rand = min(x_rand);
## 4. Amplitud
amp_rand = (max_rand - min_rand) / 2;
## 5. Energia: para gaussiana con varianza 1 y media 0 deberia ser N
E_rand = sum(x_rand .^ 2);
## 6. Accion
Acc_rand = sum(abs(x_rand));
## 7. Potencia media: deberia ser 1 (varianza de la gaussiana)
P_rand = mean(x_rand .^ 2);
## 8. RMS: deberia ser 1 (desviacion estandar de la gaussiana)
RMS_rand = sqrt(P_rand);

figure(4);
plot(t, x_rand, 'b', 'DisplayName', 'señal');
hold on;
hline(t, media_rand, 'r', 'Media');
hline(t, max_rand, 'g', 'Maximo');
hline(t, min_rand, 'm', 'Minimo');
hline(t, RMS_rand, 'k', 'RMS');
hline(t, -RMS_rand, 'k', '-RMS');
title('Señal Aleatoria Gaussiana');
xlabel('t [s]'); ylabel('x[n]');
legend('show');
##axis([0 1 -3 3.5]);
hold off;

disp("");
disp('ALEATORIA GAUSSIANA');
disp(['Media:    ' num2str(media_rand) ', Esperado: 0']);
disp(['Maximo:   ' num2str(max_rand)]);
disp(['Minimo:   ' num2str(min_rand)]);
disp(['Amplitud: ' num2str(amp_rand)]);
disp(['Energia:  ' num2str(E_rand) ', Esperado: ' num2str(N)]);
disp(['Accion:   ' num2str(Acc_rand)]);
disp(['Potencia: ' num2str(P_rand) ', Esperado: 1']);
disp(['RMS:      ' num2str(RMS_rand) ', Esperado: 1']);
