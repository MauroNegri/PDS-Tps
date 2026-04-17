<<<<<<< HEAD
fm = 10;
fs = 2;
T = 1 / fm;
[t, x] = senoidal(0, 1, fm, fs, 0);

fm_i = 4 * fm;
Ti = 1 / fm_i;
t_i = 0:Ti:1-Ti;

# Intepolacion escalon
x_escalon = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_escalon] = I_escalon((t_i(m) - t(n)) / T);
    x_escalon(m) = x_escalon(m) + x(n) * y_escalon;
  endfor
endfor

figure(1);
plot(t, x, 'b');
hold on;
stem(t_i, x_escalon, 'r');
title('Interpolacion escalon');
legend('original', 'interpolada');
hold off;

% Interpolacion lineal
x_lineal = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_lineal] = I_lineal((t_i(m) - t(n)) / T);
    x_lineal(m) = x_lineal(m) + x(n) * y_lineal;
  endfor
endfor

figure(2);
plot(t, x, 'b');
hold on;
stem(t_i, x_lineal, 'r');
title('Interpolacion lineal');
legend('original', 'interpolada');
hold off;

% Interpolacion sinc
x_sinc = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_sinc] = I_sinc((t_i(m) - t(n)) / T);
    x_sinc(m) = x_sinc(m) + x(n) * y_sinc;
  endfor
endfor

figure(3);
plot(t, x, 'b');
hold on;
stem(t_i, x_sinc, 'r');
title('Interpolacion sinc');
legend('original', 'interpolada');
hold off;
=======
fm = 10;
fs = 2;
T = 1 / fm;
[t, x] = senoidal(0, 1, fm, fs, 0);

fm_i = 4 * fm;
Ti = 1 / fm_i;
t_i = 0:Ti:1-Ti;

# Intepolacion escalon
x_escalon = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_escalon] = I_escalon((t_i(m) - t(n)) / T);
    x_escalon(m) = x_escalon(m) + x(n) * y_escalon;
  endfor
endfor

figure(1);
plot(t, x, 'b');
hold on;
stem(t_i, x_escalon, 'r');
title('Interpolacion escalon');
legend('original', 'interpolada');
hold off;

% Interpolacion lineal
x_lineal = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_lineal] = I_lineal((t_i(m) - t(n)) / T);
    x_lineal(m) = x_lineal(m) + x(n) * y_lineal;
  endfor
endfor

figure(2);
plot(t, x, 'b');
hold on;
stem(t_i, x_lineal, 'r');
title('Interpolacion lineal');
legend('original', 'interpolada');
hold off;

% Interpolacion sinc
x_sinc = zeros(size(t_i));
for m = 1:length(t_i)
  for n = 1:length(t)
    [y_sinc] = I_sinc((t_i(m) - t(n)) / T);
    x_sinc(m) = x_sinc(m) + x(n) * y_sinc;
  endfor
endfor

figure(3);
plot(t, x, 'b');
hold on;
stem(t_i, x_sinc, 'r');
title('Interpolacion sinc');
legend('original', 'interpolada');
hold off;
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
