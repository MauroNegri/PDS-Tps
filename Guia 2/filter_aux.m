function y = filter_aux(b, a, x)
  y = zeros(1, length(x));
  ## y[n] = (1/a_0)*[∑b_k*x[n−k] − ∑a_k*y[n−k]]
  for n = 1:length(x)
    # coeficientes b
    suma_b = 0;
    for k = 1:length(b) # k = 0 hasta M
      if n-k+1 >= 1
        suma_b = suma_b + b(k)*x(n-k+1);
      endif
    endfor

    # coeficientes a
    suma_a = 0;
    for k = 2:length(a) # k = 1 hasta N, a0 ya calculado
      if n-k+1 >= 1
        suma_a = suma_a + a(k)*y(n-k+1);
      endif
    endfor

    y(n) = (suma_b - suma_a)/a(1);
  endfor
end
