clear;clc;
pkg load signal; # necesario para audioread en Octave

[x, fm] = audioread('escala.wav');
x = x'; # vector fila
t = (0:length(x)-1) / fm;

disp(['fm: ' num2str(fm)]);
disp(['Muestras totales: ' num2str(length(x))]);
disp(['Duración: '  num2str(length(x)/fm)]);

figure(1); clf;
plot(t, x);
title('Señal escala.wav completa');
xlabel('t [s]'); ylabel('amplitud');
grid on;

## Dividir en notas
## Cada nota dura exactamente 0.5s, entonces en muestras es:
## 0.5 * 11025 = 5512 o 5513 muestras segun el redondeo
muestras_nota = round(0.5 * fm);
n_notas = round(length(x) / muestras_nota);

disp(['Muestras por nota: ' num2str(muestras_nota)]);
disp(['Notas detectadas: ' num2str(n_notas)]);

f_LA = 440;
notas_nombres = {'DO','RE','MI','FA','SOL','LA','SI','DO'};

disp('Nota  -  PI');
pi_valores = zeros(1, n_notas);
for k = 1:n_notas
    idx_ini = (k-1)*muestras_nota + 1;
    idx_fin = idx_ini + muestras_nota - 1;
    seg = x(idx_ini:idx_fin);

    t_seg = (0:length(seg)-1) / fm;
    s = sin(2*pi*f_LA*t_seg);
##    c = cos(2*pi*f_LA*t_seg);
##    pi_valores(k) = sqrt(sum(seg.*s)^2; + sum(seg.*c)^2;);
    pi_valores(k) = sum(seg.*s)^2;
    fprintf('%-5s -  %.2f\n', notas_nombres{k}, pi_valores(k));
end

[val_max, idx_LA] = max(pi_valores);
t_inicio_LA = (idx_LA-1) * muestras_nota / fm;
t_fin_LA    = idx_LA * muestras_nota / fm;

fprintf('\nLA está en la nota %d (%s)\n', idx_LA, notas_nombres{idx_LA});
fprintf('Tiempo: %.3f s - %.3f s\n', t_inicio_LA, t_fin_LA);

## Grafico con la nota LA marcada
figure(2); clf;
plot(t, x, 'b'); hold on;
plot([t_inicio_LA t_inicio_LA], [-1 1], 'g--', 'LineWidth', 2);
plot([t_fin_LA    t_fin_LA],    [-1 1], 'r--', 'LineWidth', 2);
title('Escala musical - nota LA detectada');
xlabel('t [s]'); ylabel('amplitud');
grid on;

