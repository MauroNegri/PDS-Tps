##x = a1*S1 + a2*S2
##tener en cuenta como varia el producto interno de 2 senoidales con las fases
##el numero es: 2 4 2 8 2 6 5
##factor que influye: el como esta grabado el audio a 8000hz, pero puede no serlo a 8000
## Cada digito es la suma de dos senoidales:
## filas: 697, 770, 852, 941 Hz
## columnas: 1209, 1336, 1477 Hz
## Teclado:
##     1209  1336  1477
## 697:  1     2     3
## 770:  4     5     6
## 852:  7     8     9
## 941:  *     0     #

clear;clc;
datos = load('te.txt');
fm = 11025;
x = datos';
t = (0:length(x)-1) / fm;

figure(1); clf;
plot(t, x, 'b');
title('Señal completa');
xlabel('t[s]'); ylabel('amplitud');
grid on;

ventana = round(0.02 * fm); # cantidad de muestras que entran en 20ms, indices enteros
paso = round(0.01 * fm);

n_ventanas = floor((length(x) - ventana) / paso) + 1;
energia   = zeros(1, n_ventanas);
t_energia = zeros(1, n_ventanas);

for i = 1:n_ventanas
    idx_ini = (i-1)*paso + 1;
    idx_fin = idx_ini + ventana - 1;
    seg = x(idx_ini:idx_fin);
    energia(i) = sum(seg.^2) / ventana;
    t_energia(i) = (idx_ini + ventana/2) / fm;
end

disp(['Energía máxima: ' num2str(max(energia))]);
disp(['Energía mínima: ' num2str(min(energia))]);
disp(['Energía media:  ' num2str(mean(energia))]);
disp(['Energía mediana: ' num2str(median(energia))]); # El umbral va a estar entre la mediana y el max
## La mediana es mas representativa que la media porque no la afectan
## los picos de los tonos. Como la señal tiene mas muestras de ruido
## que de tono, la mediana cae en la zona de ruido

figure(2); clf;
plot(t_energia, energia, 'b');
title('Energía de la señal (ventanas 20ms)');
xlabel('t[s]'); ylabel('energía');
grid on;

## Umbral
disp('');
disp('Umbral - Segmentos');
for u = [0.06, 0.07, 0.08, 0.09, 0.10, 0.12, 0.15]
    act = energia > u;
    cant = 0;
    for i = 2:length(act)
        if act(i)==1 && act(i-1)==0
            cant = cant + 1;
        end
    end
    fprintf('%.2f   -  %d\n', u, cant);
end

umbral = 0.09;
figure(2); hold on;
plot([t_energia(1) t_energia(end)], [umbral umbral], 'r--', 'LineWidth', 1.5);
legend('energía', 'umbral = 0.09');

## Detectar inicio y fin de cada digito
activo = energia > umbral;
inicios = [];
fines   = [];
for i = 2:length(activo)
    if activo(i)==1 && activo(i-1)==0
        inicios(end+1) = i;
    elseif activo(i)==0 && activo(i-1)==1
        fines(end+1) = i;
    end
end

# si la señal termina mientras hay un tono activo
if length(fines) < length(inicios)
    fines(end+1) = length(activo);
end

## Paso de indices de ventana a indices de muestra
inicios_m = (inicios - 1) * paso + 1;
fines_m = min((fines - 1) * paso + ventana, length(x));

disp('');
disp(['Segmentos detectados: ' num2str(length(inicios))]);
for k = 1:length(inicios)
    duracion = (fines_m(k) - inicios_m(k))/fm;
    fprintf('Dígito %d: %.3f s - %.3f s (%.3f s)\n', k, inicios_m(k)/fm, fines_m(k)/fm, duracion);
end

## Señal con los segmentos marcados
##figure(3); clf;
##plot(t, x, 'b'); hold on;
##for k = 1:length(inicios)
##    t_ini = inicios_m(k)/fm;
##    t_fin = fines_m(k)/fm;
##    plot([t_ini t_ini], [-2 2], 'g--', 'LineWidth', 1.5);
##    plot([t_fin t_fin], [-2 2], 'r--', 'LineWidth', 1.5);
##    text((t_ini+t_fin)/2, 1.7, sprintf('D%d',k), 'HorizontalAlignment','center', 'FontWeight','bold');
##end
##title('Señal con los 7 dígitos marcados');
##xlabel('t [s]'); ylabel('amplitud');
##ylim([-2 2]); grid on;

## Cada digito por separado
figure(3); clf;
for k = 1:length(inicios)-4
    seg = x(inicios_m(k):fines_m(k));
    t_seg = (0:length(seg)-1) / fm;
    subplot(3, 1, k);
    plot(t_seg, seg);
    title(sprintf('D%d  |  %.3f - %.3f s  |  duracion = %.3f s', k, inicios_m(k)/fm, fines_m(k)/fm, length(seg)/fm));
    ylabel('amp'); ylim([-2 2]);
end
xlabel('t[s]');

freq_filas = [697, 770, 852, 941];
freq_columnas = [1209, 1336, 1477];
teclado = {'1','2','3'; '4','5','6'; '7','8','9'; '*','0','#'};

disp('');
disp('Resultado');
numero = '';
for k = 1:length(inicios)
    seg_completo = x(inicios_m(k):fines_m(k));
    N = length(seg_completo);

    margen = round(N * 0.43);
    segmento = seg_completo(margen : N-margen);
    t_seg = (0:length(segmento)-1) / fm;

    pi_filas = zeros(1, length(freq_filas));
    for i = 1:length(freq_filas)
        s = sin(2*pi*freq_filas(i)*t_seg);
##        c = cos(2*pi*freq_filas(i)*t_seg);
##        pi_filas(i) = sqrt(sum(segmento.*s).^2 + sum(segmento.*c).^2);
        pi_filas(i) = sum(segmento.*s).^2;
    end
    pi_cols = zeros(1, length(freq_columnas));
    for j = 1:length(freq_columnas)
        s = sin(2*pi*freq_columnas(j)*t_seg);
##        c = sin(2*pi*freq_columnas(j)*t_seg);
##        pi_cols(j) = sqrt(sum(segmento.*s).^2 + sum(segmento.*c).^2);
        pi_cols(j) = sum(segmento.*s).^2;
    end

    [val_f, idx_f] = max(pi_filas);
    [val_c, idx_c] = max(pi_cols);
    digito = teclado{idx_f, idx_c};
    numero = [numero, digito];

    fprintf('D%d: %d hz (%.1f) + %d hz (%.1f) -> %s\n', k, freq_filas(idx_f), val_f, freq_columnas(idx_c), val_c, digito);
end

disp(['Número marcado: 2428265']);
disp(['Número detectado: ' num2str(numero)]);

