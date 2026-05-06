##a_p = <y,x_p> / <x_p, x_p>
##esto es para vectores ortogonales
##si son ortonormales el denominador es 1
##si la base tiene n-1 vale igual pero no va a ser igual esto y = sumatoria(a_i*x_i) sino que va a ser un aproximado
##funciones de Legendre
##phi_0 = 1/sqrt(2)
##phi_1 = sqrt(3/2)*t
##phi_2 = sqrt(5/2)*((3/2)t^2 - (1/2))
##phi_3 = sqrt(7/2)*((5/2)t^3 - (3/2)t)
##phi_n =
##discretizamos una funcion continua, muestreamos toda la señal
##con las funciones de legendre muestradas calculamos la combinacion lineal
##graficamos y vemos como son los errores
##
## La señal a aproximar es:
## y(t) = -1 para t < 0
## y(t) =  1 para t >= 0
## definida en el intervalo [-1, 1]
## Las funciones de Legendre ortonormales x_k son:
## x_0(t) = phi_0(t) = 1/sqrt(2) => a_0 = 0
## x_1(t) = phi_1(t) = sqrt(3/2) * t => a_1 = sqrt(3/2)
## x_2(t) = phi_2(t) = sqrt(5/2) * (3/2*t^2 - 1/2) => a_2 = 0
## x_3(t) = phi_3(t) = sqrt(7/2) * (5/2*t^3 - 3/2*t) => a_3 = -sqrt(7/32)
## x_k(t) = phi_k(t) = sqrt((2k+1)/2) * (1/(2^k * k!) * (d^k/dt^k)(t^2 -1)^k
clear;clc;
N = 1000;
t = linspace(-1, 1, N);
## el intervalo de definicion de la señal es [-1, 1] la longitud de ese intervalo es:
## longitud = 1 - (-1) = 2 dividis ese intervalo en N puntos equiespaciados
dt = 2/N; # ancho de cada rectangulo para aproximar la integral

## Señal original
y = ones(1, N);
y(t < 0) = -1;

## Funciones de Legendre
x_0 = ones(1, N) / sqrt(2);
x_1 = sqrt(3/2)*t;
x_2 = sqrt(5/2)*(3/2*t.^2 - 1/2);
x_3 = sqrt(7/2)*(5/2*t.^3 - 3/2*t);

## Verificacion de ortonormalidad
## <x_i, x_j> = 0 si i != j  (ortogonales)
## <x_k, x_k> = 1 (norma unitaria)
disp('Verificacion ortonormalidad');
disp(['<x_0, x_0> = ' num2str(sum(x_0.*x_0)*dt)]);
disp(['<x_1, x_1> = ' num2str(sum(x_1.*x_1)*dt)]);
disp(['<x_2, x_2> = ' num2str(sum(x_2.*x_2)*dt)]);
disp(['<x_3, x_3> = ' num2str(sum(x_3.*x_3)*dt)]);
disp(['<x_0, x_1> = ' num2str(sum(x_0.*x_1)*dt)]);
disp(['<x_1, x_2> = ' num2str(sum(x_1.*x_2)*dt)]);
disp(['<x_2, x_3> = ' num2str(sum(x_2.*x_3)*dt)]);

## Coeficientes alpha_k
## el error cuadratico (d epsilon / d alpha_k = 0):
## alpha_k = <y, x_k> / <x_k, x_k>
## Como el conjunto es ortonormal: <x_k, x_k> = 1
## alpha_k = <y, x_k> = ∑ y[n]*x_k[n]*dt
alpha_0 = sum(y.*x_0)*dt;
alpha_1 = sum(y.*x_1)*dt;
alpha_2 = sum(y.*x_2)*dt;
alpha_3 = sum(y.*x_3)*dt;

disp('');
disp('Coeficientes alpha');
disp(['alpha_0 = <y, x_0> = ' num2str(alpha_0) ', Esperado: 0']);
disp(['alpha_1 = <y, x_1> = ' num2str(alpha_1) ', Esperado: ' num2str(sqrt(3/2))]);
disp(['alpha_2 = <y, x_2> = ' num2str(alpha_2) ', Esperado: 0']);
disp(['alpha_3 = <y, x_3> = ' num2str(alpha_3) ', Esperado: ' num2str(-sqrt(7/32))]);

## Parte 1: Error cuadratico con coeficientes calculados
## el error cuadratico total es:
## epsilon = ||y - y_aprox||^2 = ∑(y_j - ∑alpha_i*x_ij)^2 Norma 2 al cuadrado
## La aproximacion es:
## y_aprox = ∑ alpha_k * x_k
## y_aprox(t) = 45/16 * t - 35/16 * t^3 => Libro pag 62
y_aprox = alpha_0*x_0 + alpha_1*x_1 + alpha_2*x_2 + alpha_3*x_3;
epsilon = sum((y - y_aprox).^2)*dt;

disp('');
disp('Parte 1: Error cuadratico con coeficientes calculados');
disp(['epsilon = ||y - y_aprox||^2 = ' num2str(epsilon)]);

figure(1);
plot(t, y, 'b', 'DisplayName', 'y(t) original');
hold on;
plot(t, y_aprox, 'r--','DisplayName', 'y\_aprox (4)');
title('Parte 1 Aproximacion con funciones de Legendre ');
xlabel('t'); ylabel('y(t)');
legend('show');
hold off;

## Parte 2: Grafica 3D variando alpha_1 y alpha_3
## alpha_0=0 y alpha_2=0 no aportan, los que aportan son alpha_1 y alpha_3
pv = 0.5; # pequeña variacion
a1_aux = linspace(alpha_1 - pv, alpha_1 + pv, 30); # genera 30 valores centrados en los valores
a3_aux = linspace(alpha_3 - pv, alpha_3 + pv, 30);

epsilon_3d = zeros(length(a1_aux), length(a3_aux));
for i = 1:length(a1_aux)
  for j = 1:length(a3_aux)
    y_aprox_2 = alpha_0*x_0 + a1_aux(i)*x_1 + alpha_2*x_2 + a3_aux(j)*x_3;
    epsilon_3d(i,j) = sum((y - y_aprox_2).^2) * dt;
  endfor
endfor

figure(2);
[A1, A3] = meshgrid(a1_aux, a3_aux); # crea dos matrices para graficar en 3D
surf(A1, A3, epsilon_3d'); # dibuja la superficie 3D del error
## eje x: valores de alpha_1
## eje y: valores de alpha_3
## eje z: epsilon (error) para cada par (alpha_1, alpha_3)
hold on;
plot3(alpha_1, alpha_3, epsilon, 'ro', 'MarkerSize', 10, 'DisplayName', 'minimo'); # marca con un punto rojo el minimo de los alphas calculados (de la superficie)
title('Parte 2 epsilon vs alpha_1 y alpha_3');
xlabel('alpha_1');
ylabel('alpha_3');
zlabel('epsilon');
legend('show');
hold off;

## Parte 3: Reduccion del error al aumentar funciones
## si aumentamos el numero de funciones aproximantes, el error epsilon se ira reduciendo
## con M vectores LI en R^M la aproximacion sera exacta
## Funciones de Legendre adicionales
x_4 = sqrt(9/2)*((35/8)*t.^4 - (30/8)*t.^2 + 3/8);
x_5 = sqrt(11/2)*((63/8)*t.^5 - (70/8)*t.^3 + (15/8)*t);
x_6 = sqrt(13/2)*((231/16)*t.^6 - (315/16)*t.^4 + (105/16)*t.^2 - 5/16);
x_7 = sqrt(15/2)*((429/16)*t.^7 - (693/16)*t.^5 + (315/16)*t.^3 - (35/16)*t);

## Coeficientes adicionales
alpha_4 = sum(y.*x_4)*dt; # => 0
alpha_5 = sum(y.*x_5)*dt; # => distinto de 0
alpha_6 = sum(y.*x_6)*dt; # => 0
alpha_7 = sum(y.*x_7)*dt; # => distinto de 0

disp('');
disp('Coeficientes adicionales');
disp(['alpha_4 = ' num2str(alpha_4)]);
disp(['alpha_5 = ' num2str(alpha_5)]);
disp(['alpha_6 = ' num2str(alpha_6)]);
disp(['alpha_7 = ' num2str(alpha_7)]);

epsilon_k = zeros(1, 8);
alphas = [alpha_0, alpha_1, alpha_2, alpha_3, alpha_4, alpha_5, alpha_6, alpha_7];
xs = [x_0; x_1; x_2; x_3; x_4; x_5; x_6; x_7];

for K = 1:8
  y_aprox_3 = zeros(1, N);
  for k = 1:K
    y_aprox_3 = y_aprox_3 + alphas(k) * xs(k,:);
  endfor
  epsilon_k(K) = sum((y-y_aprox_3).^2) * dt;
  disp(['K=' num2str(K) ' funciones: epsilon = ' num2str(epsilon_k(K))]);
endfor

figure(3);
stem(1:8, epsilon_k);
title('Parte 3 epsilon vs numero de funciones K');
xlabel('K');
ylabel('epsilon');
