x = [0 3 1];
h = [3 2 1];
N = length(x);

## y[k] = ∑ h[l]x[ [(N+k−l) MOD N] + 1], con l = 1 a N
## para y[1] = ∑ h[l]*x[mod(3+1-l, 3)+1]
## l=1: mod(3+1-1, 3)+1 = mod(3,3)+1 = 0+1 = 1 => h(1)*x(1) = 3*0 = 0
## l=2: mod(3+1-2, 3)+1 = mod(2,3)+1 = 2+1 = 3 => h(2)*x(3) = 2*1 = 2
## l=3: mod(3+1-3, 3)+1 = mod(1,3)+1 = 1+1 = 2 => h(3)*x(2) = 1*3 = 3
## y[1] = 0 + 2 + 3 = 5

## para y[2] = ∑ h[l]*x[mod(3+2-l, 3)+1]
## l=1: mod(3+2-1, 3)+1 = mod(4,3)+1 = 1+1 = 2 => h(1)*x(2) = 3*3 = 9
## l=2: mod(3+2-2, 3)+1 = mod(3,3)+1 = 0+1 = 1 => h(2)*x(1) = 2*0 = 0
## l=3: mod(3+2-3, 3)+1 = mod(2,3)+1 = 2+1 = 3 => h(3)*x(3) = 1*1 = 1
## y[2] = 9 + 0 + 1 = 10

## para y[3] = ∑ h[l]*x[mod(3+3-l, 3)+1]
## l=1: mod(3+3-1, 3)+1 = mod(5,3)+1 = 2+1 = 3 => h(1)*x(3) = 3*1 = 3
## l=2: mod(3+3-2, 3)+1 = mod(4,3)+1 = 1+1 = 2 => h(2)*x(2) = 2*3 = 6
## l=3: mod(3+3-3, 3)+1 = mod(3,3)+1 = 0+1 = 1 => h(3)*x(1) = 1*0 = 0
## y[3] = 3 + 6 + 0 = 9
## y = [5 10 9]

y = zeros(1, N);
for k = 1:N
  suma = 0;
  for l = 1:N
    suma = suma + h(l)*x(mod(N+k-l,N)+1);
  endfor
  y(k) = suma;
endfor

disp("Resultado de la convolucion circular: "), disp(y);

# los i van de 1 a n, pero mod va de 0 a N-1, por eso es el +1
# en el mod se suma N porque sino queda negativo
# se usa el mod para cuando te pasas volver al inicio, para evitar índices negativos y garantizar el comportamiento periódico de x[n]
