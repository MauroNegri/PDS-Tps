t_ini = 0;
t_fin = 1;
fm = 100;
fs = [5, 20];          # se cumple 2*fs <= 100
phi = [0, pi/2];

for i = 1:length(fs)
  for j = 1:length(phi)
    [t, x_sen] = senoidal(t_ini, t_fin, fm, fs(i), phi(j));
    [t, x_c]   = ondacuadrada(t_ini, t_fin, fm, fs(i), phi(j));
    [t, x_sin] = sinc(0, t_fin, fm, fs(i), phi(j));

    figure;
    subplot(3,1,1);
    plot(t, x_sen);
    title(["Senoidal fs=", num2str(fs(i)), " Hz, phi=", num2str(phi(j))]);
    xlabel('t');
    ylabel('x');

    subplot(3,1,2);
    plot(t, x_c);
    title(["Cuadrada fs=", num2str(fs(i)), " Hz, phi=", num2str(phi(j))]);
    xlabel('t');
    ylabel('x');

    subplot(3,1,3);
    plot(t, x_sin);
    title(["Sinc fs=", num2str(fs(i))]);
    xlabel('t');
    ylabel('x');

  end
end

##[t, x_sen] = rectificacion(t_ini, t_fin, fm, fs(i), phi(j));
