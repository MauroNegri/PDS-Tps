##x=[x0 x1 x2 x3] n = 4
##h=[h0 h1 h2] m = 3        => la conv lineal de una señal MxN es N+M-1
##y[n] = x*h => convolucion
##y[n] = x*h => sumatoria(x[k]h[n-k])
##k=0
##y[0] = x0.h0
##k=1
##y[1] = x0.h1 + x1.h0
##y[2] = x0.h2 + x1.h1 + x2.h0
##y[3] =         x1.h2 + x2.h1 + x3.h0
##
##la funcion filter devuelve orden n en vez de n+m-1, osea devuelve solo la primera parte

N = 10;
M = 3;
x = [0 3 1 5 2 7 3 8 1 4];
h = [3 2 1];

for n = 1:N+M-1
  suma = 0;
  for k = 1: M
      i = n-k+1;
      if i >= 1 && i <= N
        suma = suma + x(i)*h(k);
      endif
  endfor
  y(n) = suma;
endfor

conv(x,h)

A =
