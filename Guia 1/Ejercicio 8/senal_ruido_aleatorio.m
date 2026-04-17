<<<<<<< HEAD
# Señal sinusoidal original
[t_s, x_s] = senoidal(0, 0.5, 100, 20, 0);
x_s = x_s*10;
Ps = mean(x_s .^2);
disp('La potencia de la señal original es: '), disp(Ps);

figure(1);
subplot(3, 1, 1);
plot(t_s,x_s);
title('Señal original');

disp('');
disp('Ruido original');
# Señal de ruido aleatorio
[x_r] = senal_ruido(length(x_s));
Pr = mean(x_r .^2);
disp('La potencia del ruido es: '), disp(Pr);

subplot(3, 1, 2);
plot(x_r);
title('Ruido');

# Suma de señal original y ruido
t_snr = t_s;
x_snr = x_s + x_r;
subplot(3, 1, 3);
plot(t_snr, x_snr);
title('Señal + Ruido');

# Relacion señal ruido SNR
SNRdb = 10*log10(Ps/Pr);
disp('La relación señal ruido es: '), disp(SNRdb);

# Multiplicacion de la señal ruido por una constante
disp('');
disp('Ruido por una constante');
c = 5;
x_r_c = x_r * c;
Pr_c = mean(x_r_c .^2);
SNRdb_c = 10*log10(Ps/Pr_c);

disp('La potencia del ruido por una constante: '), disp(Pr_c);
disp('La relación señal ruido por una constante es: '), disp(SNRdb_c);

# Constante para que SNR = 0 dB
# 10*log(Ps / Pr) = 0 => Ps / Pr = 1
# Ps / Pr_c => Pr_c = promedio(x_r_c^2) | x_r_c = x_r*c => promedio( (x_r*c)^2) => promedio( (x_r^2)*c^2 ) => c^2*promedio(x_r^2)
# Ps / c^2*Pr | Ps / Pr = 1
# c^2 = Ps / Pr
# c = sqrt(Ps / Pr)
disp('');
disp('Ruido con SNR = 0 dB');
c = sqrt(Ps/Pr);
x_r_0db = x_r*c;
Pr_0db = mean(x_r_0db .^2);
SNRdb_0db = 10*log10(Ps / Pr_0db);

disp('La potencia del ruido para que SNR sea 0: '), disp(Pr_0db);
disp('La relación señal ruido para que SNR sea 0 es: '), disp(SNRdb_0db);
=======
# Señal sinusoidal original
[t_s, x_s] = senoidal(0, 0.5, 100, 20, 0);
x_s = x_s*10;
Ps = mean(x_s .^2);
disp('La potencia de la señal original es: '), disp(Ps);

figure(1);
subplot(3, 1, 1);
plot(t_s,x_s);
title('Señal original');

disp('');
disp('Ruido original');
# Señal de ruido aleatorio
[x_r] = senal_ruido(length(x_s));
Pr = mean(x_r .^2);
disp('La potencia del ruido es: '), disp(Pr);

subplot(3, 1, 2);
plot(x_r);
title('Ruido');

# Suma de señal original y ruido
t_snr = t_s;
x_snr = x_s + x_r;
subplot(3, 1, 3);
plot(t_snr, x_snr);
title('Señal + Ruido');

# Relacion señal ruido SNR
SNRdb = 10*log10(Ps/Pr);
disp('La relación señal ruido es: '), disp(SNRdb);

# Multiplicacion de la señal ruido por una constante
disp('');
disp('Ruido por una constante');
c = 5;
x_r_c = x_r * c;
Pr_c = mean(x_r_c .^2);
SNRdb_c = 10*log10(Ps/Pr_c);

disp('La potencia del ruido por una constante: '), disp(Pr_c);
disp('La relación señal ruido por una constante es: '), disp(SNRdb_c);

# Constante para que SNR = 0 dB
# 10*log(Ps / Pr) = 0 => Ps / Pr = 1
# Ps / Pr_c => Pr_c = promedio(x_r_c^2) | x_r_c = x_r*c => promedio( (x_r*c)^2) => promedio( (x_r^2)*c^2 ) => c^2*promedio(x_r^2)
# Ps / c^2*Pr | Ps / Pr = 1
# c^2 = Ps / Pr
# c = sqrt(Ps / Pr)
disp('');
disp('Ruido con SNR = 0 dB');
c = sqrt(Ps/Pr);
x_r_0db = x_r*c;
Pr_0db = mean(x_r_0db .^2);
SNRdb_0db = 10*log10(Ps / Pr_0db);

disp('La potencia del ruido para que SNR sea 0: '), disp(Pr_0db);
disp('La relación señal ruido para que SNR sea 0 es: '), disp(SNRdb_0db);
>>>>>>> 9599ffc15993d9c5acd7ce68139590d11d42275c
