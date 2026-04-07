N = 1000;   % Muestras
K = 500;    % Realizaciones
r = randn(K, N); % Señal aleatoria

% estacionariedad
media_s = mean(r, 1); % Media(promedio entre realizaciones)
var_s = var(r, 0, 1); % Varianza

figure(1);
subplot(2,1,1);
plot(media_s);
title('Media vs tiempo (estacionariedad)');
xlabel('Muestras');
ylabel('Media');

subplot(2,1,2);
plot(var_s);
title('Varianza vs tiempo (estacionariedad)');
xlabel('Muestras');
ylabel('Varianza');

% ergodicidad
media_r = mean(r, 2); % Media en el tiempo de cada realización
var_r = var(r, 0, 2); % Varianza en el tiempo de cada realización

figure(2);
subplot(2,1,1);
plot(media_r);
title('Media por realización (ergodicidad)');
xlabel('Realización');
ylabel('Media');

subplot(2,1,2);
plot(var_r);
title('Varianza por realización (ergodicidad)');
xlabel('Realización');
ylabel('Varianza');

% convergencia de media y varianza
x = r(1, :);
media_acum = cumsum(x) ./ (1:N);
var_acum = zeros(1, N);

for i = 1:N
    var_acum(i) = var(x(1:i));
end

figure(3);
subplot(2,1,1);
plot(media_acum);
title('Convergencia de la media (ergodicidad)');
xlabel('Muestras');
ylabel('Media');

subplot(2,1,2);
plot(var_acum);
title('Convergencia de la varianza (ergodicidad)');
xlabel('Muestras');
ylabel('Varianza');

