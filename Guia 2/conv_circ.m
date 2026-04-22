function y = conv_circ(x, h)
  N = length(x); # ambas deben tener el mismo tamaño
  ## y[k] = ∑ h[l]x[ [(N+k−l) MOD N] + 1], con l = 1 a N
  y = zeros(1, N);
  for k = 1:N
    for l = 1:N
      y(k) = y(k) + h(l)*x(mod(N+k-l,N)+1);
    endfor
  endfor
endfunction
