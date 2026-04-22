# x[n]= y[n]-0.5y[n−1]+0.25y[n−2]
# y[n]= x[n]+0.5y[n−1]−0.25y[n−2]
# - Causal: depende de valores presentes y pasados, pero no futuros, es causal
# - Lineal: si, porque:
#   - homogeneidad: x[n] => a*x[n]
#   y[n] = a*x[n] + 0.5*y[n-1] - 0.25*y[n-2] => se cumple
#   - superposicion: x[n] = x1[n]+x2[n]
#   y[n] = x1[n]+x2[n]+0.5*y[n-1]-0.25*y[n-2]
#   y1[n] = x1[n] + 0.5*y1[n-1] - 0.25*y1[n-2]
#   y2[n] = x2[n] + 0.5*y2[n-1] - 0.25*y2[n-2]
#   y[n] = y1[n]+y2[n] => se cumple
# - Invariante en el tiempo: si, porque tiene coeficientes constantes
# - Memoria: si, porque depende de x[n] y x[n-1]
N = 20;
x = zeros(1, N);
x(1) = 1;

y = zeros(1,N);
for n = 1:length(x)
  y_n1 = 0;
  y_n2 = 0;
  if n-1 >= 1
    y_n1 = y(n-1);
  endif
  if n-2 >= 1
    y_n2 = y(n-2);
  endif
  y(n) = x(n) + 0.5*y_n1 - 0.25*y_n2;
endfor

figure(1);
stem(0:N-1, y);
title('y[n] sistema');
xlabel('n'); ylabel('y[n]');
