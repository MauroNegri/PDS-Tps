# Impulso: delta[n] = 1 en n=1, 0 en el resto
# delta[n] = [1 0 0 0 0 0 0 0 ...]
# cuando la entrada es un delta de dirac delta[n]
# la salida del sistema la llamamos respuesta al impulso h[n]
N = 20;
x = zeros(1, N);
x(1) = 1;

# 1) y[n] = x[n] + y[n-2]
## h[0] = x[0] + y[-2] = 1 + 0 = 1
## h[1] = x[1] + y[-1] = 0 + 0 = 0
## h[2] = x[2] + y[0]  = 0 + 1 = 1
## h[3] = x[3] + y[1]  = 0 + 0 = 0
## h[4] = x[4] + y[2]  = 0 + 1 = 1
## h[5] = x[5] + y[3]  = 0 + 0 = 0
## la respuesta al impulso vale 1 en los pares y 0 en los impares, no decae a 0
## AR(Autorregresivo): la salida depende de valores pasados de si misma => y[n-2]
## IIR(Respuesta Infinita al Impulso): la realimentacion de la salida hace que la respuesta al impulso sea infinita

##y1 = zeros(1,N);
##for n = 1:length(x)
##  y_n2 = 0; # como tenemos condiciones iniciales nulas, cuando sea negativo es 0
##  if n-2 >= 1
##    y_n2 = y1(n-2);
##  endif
##  y1(n) = x(n) + y_n2;
##endfor

# y[n] - y[n-2] = x[n], b => x; a => y
b1 = [1];
a1 = [1, 0, -1];
h1 = filter_aux(b1, a1, x);

figure(1);
stem(0:N-1, h1);
title('h[n] sistema 1');
xlabel('n'); ylabel('h[n]');

# 2) y[n] = x[n]+0,5x[n−1]
## h[0] = x[0] + 0.5*x[-1] = 1 + 0.5*0 = 1
## h[1] = x[1] + 0.5*x[0]  = 0 + 0.5*1 = 0.5
## h[2] = x[2] + 0.5*x[1]  = 0 + 0.5*0 = 0
## h[3] = x[3] + 0.5*x[2]  = 0 + 0.5*0 = 0
## a partir de h[2] todo es 0, respuesta finita de 2 muestras
## MA(Promedio Movil): la salida depende solo de valores presentes y pasados de la entrada, sin realimentacion
## FIR(Respuesta Finita al Impulso): sin realimentacion, la respuesta al impulso tiene duracion finita

##y2 = zeros(1,N);
##for n = 1:length(x)
##  x_n1 = 0;
##  if n-2 >= 1
##    x_n1 = x(n-1);
##  endif
##  y2(n) = x(n) + 0.5*x_n1;
##endfor

# y[n] = x[n] + 0,5x[n−1], b => x; a => y
b2 = [1, 0.5];
a2 = [1];
h2 = filter_aux(b2, a2, x);

figure(2);
stem(0:N-1, h2);
title('h[n] sistema 2');
xlabel('n'); ylabel('h[n]');

# 3) y[n]=x[n]+0.5y[n−1]−0.25y[n−2]
## h[0] = x[0] + 0.5*y[-1] - 0.25*y[-2] = 1 + 0 - 0 = 1
## h[1] = x[1] + 0.5*h[0]  - 0.25*y[-1] = 0 + 0.5*1 - 0 = 0.5
## h[2] = x[2] + 0.5*h[1]  - 0.25*h[0]  = 0 + 0.5*0.5 - 0.25*1 = 0.25 - 0.25 = 0
## h[3] = x[3] + 0.5*h[2]  - 0.25*h[1]  = 0 + 0.5*0 - 0.25*0.5 = -0.125
## h[4] = x[4] + 0.5*h[3]  - 0.25*h[2]  = 0 + 0.5*(-0.125) - 0 = -0.0625
## h[5] = x[5] + 0.5*h[4]  - 0.25*h[3]  = 0 + 0.5*(-0.0625) - 0.25*(-0.125) = -0.03125 + 0.03125 = 0
## los valores van decayendo y oscilando alrededor de 0, respuesta infinita pero que decae
## AR(Autorregresivo): la salida depende de valores pasados de si misma => y[n-1], y[n-2]
## IIR(Respuesta Infinita al Impulso): la realimentacion hace que la respuesta al impulso sea infinita

##y3 = zeros(1,N);
##
##for n = 1:length(x)
##  y3_n1 = 0;
##  y3_n2 = 0;
##  if n-1 >= 1
##    y3_n1 = y3(n-1);
##  endif
##  if n-2 >= 1
##    y3_n2 = y3(n-2);
##  endif
##  y3(n) = x(n) + 0.5*y3_n1 - 0.25*y3_n2;
##endfor

# y[n] - 0.5y[n−1] + 0.25y[n−2] = x[n], b => x; a => y
b3 = [1];
a3 = [1, -0.5, 0.25];
h3 = filter_aux(b3, a3, x);

figure(3);
stem(0:N-1, h3);
title('h[n] sistema 3');
xlabel('n'); ylabel('h[n]');
