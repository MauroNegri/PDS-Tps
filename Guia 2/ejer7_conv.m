N = 10;
a =1/2; # |a| <1
h_a = zeros(1, N);
h_b = zeros(1, N);
for n = 1:N
  h_a(n) = sin(8*(n-1)); #0 <= n <= N−1
  h_b(n) = a^(n-1);
endfor

# x[n] = delta[n] - a*delta[n-1] | y[n] = h[n] - a*h[n-1]
# x[0] = 1
# x[1] = -a

x = zeros(1, N);
x(1) = 1;
x(2) = -a;

y_a = conv_aux(x, h_a);
y = conv_aux(y_a, h_b);
disp("Convolucion en cascada: "), disp(y);

# alternativa y[n] = h[n] - a*h[n-1]
h_total = conv_aux(h_a, h_b);
y_alt = filter_aux([1 -a], 1, [h_total, zeros(1, length(y) - length(h_total))]);
disp("Convolucion con filter: "), disp(y_alt);


# invertir orden: x => h_B => h_A

y_b = conv_aux(x, h_b);
y_inv = conv_aux(y_b, h_a);

disp("Convolucion en cascada invertida: "), disp(y_inv);

## El orden de conexión no altera la salida porque la convolución es conmutativa:
## h_a[n] * h_b[n] = h_b[n] * h_a[n]
