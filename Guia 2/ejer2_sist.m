# y[n] = sqrt((-2)*x[n]*x[n-1] + (x[n-1])^2 + (x[n])^2)
# y[n] = sqrt((-x[n-1] + x[n])^2)
# y[n] = |x[n] - x[n-1]|

# - Causal: depende de valores presentes y pasados, pero no futuros, es causal
# - Lineal: no, porque:
#   - homogeneidad: x[n]=> ax[n] => y[n]=|a(x[n]−x[n−1])|=|a||x[n]−x[n−1]|, no se cumple por a valor absoluto
#   - superposicion: x[n]=x1​[n]+x2​[n]
#   y[n]=|(x1​[n]−x1​[n−1])+(x2​[n]−x2​[n−1])|
#   y1[n]=∣(x1​[n]−x1​[n−1])|, y2[n]= |x2​[n]−x2​[n−1]|
#   y[n] = y1[n] + y2[n] => no se cumple porque |a+b| != |a| + |b|
# - Invariante en el tiempo: si, porque tiene coeficientes constantes
# - Memoria: si, porque depende de x[n] y x[n-1]

N = 20;
x = zeros(1, N);
x(1) = 1;

y = zeros(1,N);
for n = 1:length(x)
  x_n1 = 0;
  if n-1 >= 1
    x_n1 = x(n-1);
  endif
  y(n) = x(n) - x_n1;
endfor

figure(1);
stem(0:N-1, y);
title('y[n] sistema');
xlabel('n'); ylabel('y[n]');
