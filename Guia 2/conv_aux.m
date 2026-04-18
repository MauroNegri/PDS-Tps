function y = conv_aux(x, h)
  N = length(x);
  M = length(h);

  ## y[n] = ∑h[n−k]x[k], k = 0 a N, sumatoria de convolucion
  y = zeros(1, N+M-1);
  for n = 1:N+M-1
    suma = 0;
    for k = 1:N
        i = n-k+1;
        if i >= 1 && i <= M
          suma = suma + h(i)*x(k);
        endif
    endfor
    y(n) = suma;
  endfor
endfunction
