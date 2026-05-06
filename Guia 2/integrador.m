## y[n] - 0.6*y[n-1] = x[n] + 0.2*x[n-1]
## y[n] = x[n] + 0.2*x[n-1] + 0.6*y[n-1]

## Parte 1
## - Causal: si, porque depende de valores presentes y pasados, no de valores futuros
## - Lineal: si, porque:
##   - Homogeneidad: x[n] = a*x[n]
##     y_a[n] = a*x[n] + 0.2a*x[n-1] + 0.6y_a[n-1]
##     Ecuacion Original multiplicada por a:
##     a*y[n] = a*x[n] + 0.2a*x[n-1] + 0.6a*y[n-1]
##     Si y_a[n−1] = a*y[n−1] => y_a[n] = a*y[n]
##   - Superposicion:
##     x[n] = x1[n]+x2[n]
##     y[n] = x1[n]+x2[n] + 0.2*(x1[n-1]+x2[n-1]) + 0.6*y[n-1]
##     y1[n] = x1[n] + 0.2x1[n - 1] + 0.6y2[n - 1]
##     y2[n] = x2[n] + 0.2x2[n - 1] + 0.6y2[n - 1]
##     y1[n]+y2[n]= x1[n]+ x2[n] + 0.2*(x1[n − 1]+x2[n − 1]) + 0.6(y1[n − 1]+y2[n − 1]) => se cumple
## - Invariante en el tiempo: si, porque tiene coeficientes constantes, un desplazamiento en la entrada produce el mismo desplazamiento en la salida
##   Entrada desplazada: y_d[n] = x[n-n0] + 0.2*x[n-n0-1] + 0.6*y_d[n-1]
##   Salida desplazada: y[n-n0] = x[n-n0] + 0.2*x[n-n0-1] + 0.6*y[n-n0-1]

## y[n] = x[n] + 0.2*x[n-1] + 0.6*y[n-1]
## con x[n] = delta[n]: x[0]=1, x[n]=0 para n>0
## h[0] = x[0] + 0.2*x[-1] + 0.6*y[-1]= 1 + 0.2*0 + 0.6*0 = 1
## h[1] = x[1] + 0.2*x[0]  + 0.6*h[0] = 0 + 0.2*1 + 0.6*1 = 0.8
## h[2] = x[2] + 0.2*x[1]  + 0.6*h[1] = 0 + 0.2*0 + 0.6*0.8 = 0.48
## h[3] = x[3] + 0.2*x[2]  + 0.6*h[2] = 0 + 0.2*0 + 0.6*0.48 = 0.288
## h[4] = x[4] + 0.2*x[3]  + 0.6*h[3] = 0 + 0.2*0 + 0.6*0.288 = 0.1728
## h[5] = x[5] + 0.2*x[4]  + 0.6*h[4] = 0 + 0.2*0 + 0.6*0.1728 = 0.10368
## el resultado se acerca a 0 pero no llega nunca a ese valor
## es IIR(respuesta infinita al impulso) porque su respuesta al impulso no es finita

## y[n] = x[n] + 0.2*x[n-1] + 0.6*y[n-1]
## Parte 2
N = 20;
h = zeros(1,N);
x2 = zeros(1, N);
x2(1) = 1;
b = [1 0.2];
a = [1 -0.6];
h = filter_aux(b, a, x2); # y[n] - 0.6*y[n-1] = x[n] + 0.2*x[n-1]

stem(0:N-1, h);
title('Respuesta al impulso h[n]');
xlabel('n'); ylabel('h[n]');
axis([-1 21 -0.5 1.5]);

## Parte 3
x3 = [1 2 3 4 5 6 7 8 9 10];
L = length(x3);
M = length(h);
## a) Sumatoria de convolucion
y_conv = conv_aux(x3, h);
disp("La sumatoria de convolucion es: "), disp(y_conv);

## b) Convolucion matricial
## y[n]=∑h[n−k]x[k]
H = zeros(L+M-1, L);
for fila = 1:L+M-1 # muestras x salida
  for col = 1:L # muestras x entrada
    i = fila - col + 1;
    if i>= 1 && i<= M
      H(fila,col) = h(i);
    endif
  endfor
endfor

y_matr = H * x3';
y_matr = y_matr';   # lo paso a fila
disp("La convolucion matricial es: "), disp(y_matr);

## c) Convolucion circular
y_circ = conv_circ([x3 zeros(1, M-1)], [h zeros(1, L-1)]); # hay que reacomodar a tamaño 29, x3 es de tamaño 10 y h es de tamaño 20
disp("La convolucion circular es: "), disp(y_circ);

## d) Verificacion
disp("Error entre metodos matr y conv: "), disp(norm(y_matr - y_conv));
disp("Error entre metodos circ y conv: "), disp(norm(y_circ - y_conv));
disp("Error entre metodos circ y matr: "), disp(norm(y_circ - y_matr));

## Parte 4
## La salida del sistema es:
## y[n] = x[n] * h[n] (convolucion)
## Para recuperar x[n] se necesita deconvolucion:
## x[n] = y[n] * h_inv[n]   (h_inv sistema inverso)
## Si se agrega ruido a la salida:
## y_r[n] = y[n] + r[n]
## Al deconvolucionar:
## x_rec[n] = y_r[n] * h_inv[n]
##          = x[n] + r[n] * h_inv[n]
## Esto significa que el ruido tambien pasa por el sistema inverso
## Como h[n] tiende a 0, su inverso puede amplificar valores (donde h[n] es pequeño)
## - El ruido se amplifica
## - La señal recuperada x_rec[n] se distorsiona
## - La deconvolucion es muy sensible al ruido
