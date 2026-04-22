function y = conv_aux(x, h)
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
endfunction
