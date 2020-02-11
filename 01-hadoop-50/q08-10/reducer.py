import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    letra_actual = None
    suma = 0
    promedio = 0
    n = 1
    

    for line in sys.stdin:

        letra, valor = line.split("\t")
        valor = float(valor)
        
        if letra == letra_actual:
          suma += valor
          promedio = suma/n
                       
        else:
            
            if letra_actual is not None:
                
                sys.stdout.write("{}\t{}\t{}\n".format(letra_actual, suma, promedio))

            letra_actual = letra
            suma = valor
            n = 1
            promedio= suma/n
        
        n=n+1
            
    sys.stdout.write("{}\t{}\t{}\n".format(letra_actual, suma, promedio))