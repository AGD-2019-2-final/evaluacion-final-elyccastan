import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    
    letra_actual = None
    cuenta_actual = 0
    
    for line in sys.stdin:
        
        letra, cuenta = line.split("\t")
        
        if not letra_actual:
            letra_actual = letra
            cuenta_actual += int(cuenta)
                 
        elif letra_actual == letra:
            cuenta_actual += int(cuenta)
                       
        elif letra_actual != letra:
            print(letra_actual + ',' +str(cuenta_actual))
            cuenta_actual = 1
            letra_actual = letra
    
    print(letra_actual + ',' +str(cuenta_actual))
