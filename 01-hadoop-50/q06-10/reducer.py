import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    letra_actual = None
    mayor_actual = 0
    menor_actual = 0
       
    for line in sys.stdin:
        
        letra, valor = line.split("\t")
        valor = float(valor)
        
        if not letra_actual:
            letra_actual = letra
            mayor_actual = valor
            menor_actual = valor
                 
        elif letra_actual == letra:
            mayor_actual = max(valor,mayor_actual)
            menor_actual = min(valor,menor_actual)
                       
        elif letra_actual != letra:
            sys.stdout.write("{}\t{}\t{}\n".format(letra_actual,mayor_actual,menor_actual))
            letra_actual = letra
            mayor_actual = valor
            menor_actual = valor
    
    sys.stdout.write("{}\t{}\t{}\n".format(letra_actual,mayor_actual,menor_actual))