fm = 100;
fs = 5;
A = 1;
T = 1/fm;
t_ini = 0;
t_fin = 1;
phi = 0;
[t, x] = senoidal(t_ini, t_fin, fm, fs, phi, A);
n1 = 1:length(t);   # indice de muestras

# 1) y[n] = g[n]*x[n], g[n] = A*sin(w*n*T), A => cte, w = 2*pi*f
A = 2;
f = 10;
w = 2*pi*f;
g = A*sin(w*n1*T);
y1 = g.*x;

figure(1);
subplot(3,1,1);
stem(t, x);
title('Entrada x[n]');
xlabel('t[s]'); ylabel('x[n]');

subplot(3,1,2);
stem(t, g);
title('g[n] = A*sin(wnT)');
xlabel('t[s]'); ylabel('g[n]');

subplot(3,1,3);
stem(t, y1);
title('Salida y[n] = g[n]*x[n]');
xlabel('t[s]'); ylabel('y[n]');

# - Causal: si, porque solo dependen de x[n] en el instante actual
# - Lineal: si, porque:
#   - Homogeneidad: x[n] = a*x[n], y[n] = g[n]*ax[n] = a*g[n]x[n] => se cumple
#   - Superposicion: y[n] = g[n]*x[n], x[n] = x1[n]+x2[n]
#     y[n] = g[n]*(x1[n] + x2[n])
#     y[n] = g[n]*x1[n] + g[n]*x2[n]
#     y1[n] = g[n]*x1[n], y2[n] = g[n]*x2[n]
#     y1[n]+y2[n] = g[n]*x1[n] +  g[n]*x2[n]
#     y[n] = y1[n] + y2[n] => se cumple
# - Invariante en el tiempo: no, porque no tiene coeficientes constantes
# - Memoria: sin memoria, porque solo usa x[n] actual

# 2) y[n] = sumatoria de x[k] desde k=n-n0 hasta n+n0
n0 = 3;
y2 = zeros(size(x));
for n2 = 1:length(x)
  suma = 0;
  for k = (n2 - n0):(n2 + n0)
    if k >= 1 && k <= length(x)
      suma = suma + x(k);
    endif
  endfor
  y2(n2) = suma;
endfor

figure(2);
subplot(2,1,1);
stem(t, x);
title('Entrada x[n]');
xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2);
stem(t, y2);
title(['Salida y[n] = sumatoria de x[k]']);
xlabel('t[s]'); ylabel('y[n]');

# - Causal: no, porque depende de valores futuros en el extremo k = n+n0
# - Lineal: si, porque:
#   - Homogeneidad: x[n]=> ax[n]=> y[n]= sum(ax[n]) = a*sum(x[n]), se cumple
#   - Superposicion: y[n] = sum(x[n]), x[n] = x1[n]+x2[n]
#     y[n] = sum(x1[n] + x2[n])
#     y[n] = sum(x1[n]) + sum(x2[n])
#     y1[n] = sum(x1[n]), y2[n] = sum(x2[n])
#     y1[n]+y2[n] = sum(x1[n]) + sum(x2[n])
#     y[n] = y1[n] + y2[n] => se cumple
# - Invariante en el tiempo: si, porque tiene coeficientes constantes
# - Memoria: con memoria, depende de valores distintos del instante actual

# 3) y[n] = x[n]+2
y3 = x + 2;

figure(3);
subplot(2,1,1);
stem(t, x);
title('Entrada x[n]');
xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2);
stem(t, y3);
title('Salida y[n] = x[n]+2');
xlabel('t[s]'); ylabel('y[n]');

# - Causal: si, solo depende de x[n] actual
# - Lineal: no, porque:
#   - Homogeneidad: ax[n] => y[n] = ax[n] + 2
#     ay[n] => ay[n] = a(x[n]+2) = ax[n] + 2a      => no se cumple la igualdad
#   - Superposicion: y[n] = x[n]+2, x[n] = x1[n]+x2[n]
#     y[n] = x1[n]+x2[n]+2
#     y1[n] = x1[n]+2, y2[n] = x2[n]+2
#     y1[n]+y2[n] = x1[n]+x2[n]+4
#     y[n] != y1[n]+y2[n], no se cumple
# - Invariante en el tiempo: si, porque tiene coeficientes constantes
# - Memoria: sin memoria, depende solo de x[n] en el mismo instante

## 4) y[n] = n*x[n]
n3 = 1:length(t);
y4 = n3 .* x;

figure(4);
subplot(2,1,1);
stem(t, x);
title('Entrada x[n]');
xlabel('t[s]'); ylabel('x[n]');

subplot(2,1,2);
stem(t, y4);
title('Salida y[n] = n*x[n]');
xlabel('t[s]'); ylabel('y[n]');

# - Causal: si, solo depende de x[n] actual
# - Lineal: si, porque:
#   - Homogeneidad: x[n]=> ax[n]=> y[n]= n*ax[n] = a*(nx[n]), se cumple
#   - Superposicion: y[n]= nx​[n], x[n]=x1​[n]+x2​[n]
#   y[n]=n(x1​[n]+x2​[n])
#   y1​[n] = nx1​[n], y2​[n] = nx2​[n]
#   y1​[n]+y2​[n]=n(x1​[n]+x2​[n])
#   y[n] = y1[n]+y2[n], se cumple la igualdad
# - Invariante en el tiempo: no, porque no tiene coeficientes constantes
# - Memoria: sin memoria, depende solo de x[n]
