# x[n]= y[n]-0.5y[n−1]+0.25y[n−2]
# y[n]= x[n]+0.5y[n−1]−0.25y[n−2]
# - Causal: depende de valores presentes y pasados, pero no futuros, es causal
# - Lineal: si, porque:
#   - homogeneidad: x[n] => a*x[n]
#   y[n] = a*x[n] + 0.5*y[n-1] - 0.25*y[n-2] => se cumple
#   - superposicion: x[n] = x1[n]+x2[n]
#   y[n] = x1[n]+x2[n]+0.5*y[n-1]-0.25*y[n-2]
#   y1[n] = x1[n] + 0.5*y1[n-1] - 0.25*y1[n-2]
#   y2[n] = x2[n] + 0.5*y2[n-1] - 0.25*y2[n-2]
#   y[n] = y1[n]+y2[n] => se cumple
# - Invariante en el tiempo: si, porque tiene coeficientes constantes
# - Memoria: si, porque depende de x[n] y x[n-1]
