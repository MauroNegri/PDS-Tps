##x=[x0 x1 x2 x3] n = 4
##h=[h0 h1 h2] m = 3 => la conv lineal de una señal MxN es N+M-1
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

x = [0 3 1 5 2 7 3 8 1 4];
##x = [0 3 1 ];
h = [3 2 1];
N = length(x);
M = length(h);

## y[n] = ∑h[n−k]x[k], k = 0 a N, sumatoria de convolucion
y = zeros(1, N+M-1);
for n = 1:N+M-1
  for k = 1:N
      i = n-k+1;
      if i >= 1 && i <= M
        y(n) = y(n) + h(i)*x(k);
      endif
  endfor
endfor

disp("Resultado de y(n): "), disp(y);

y_conv = conv(x,h);
disp("Resultado de funcion conv: "), disp(y_conv);

y_filter = filter(h, 1, x);
disp("Resultado de funcion filter: "), disp(y_filter); # Esto da 2 valores menos

y_filter_corr = filter(h, 1, [x, zeros(1, M-1)]); # Agregar para llegar N+M-1
disp("Resultado de funcion filter corregida: "), disp(y_filter_corr);

y_filter_aux = filter_aux(h, 1, [x, zeros(1, M-1)]);
disp("Resultado de funcion filter propia: "), disp(y_filter_aux);

y_conv_circ = conv_circ([x zeros(1,M-1)],[h zeros(1,N-1)]);
disp("Resultado de funcion conv circ: "), disp(y_conv_circ);

