import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    
    mes_actual = None
    cuenta_actual = 0
    
    for line in sys.stdin:
        
        mes, cuenta = line.split("\t")
        
        if not mes_actual:
            mes_actual = mes
            cuenta_actual += int(cuenta)
                 
        elif mes_actual == mes:
            cuenta_actual += int(cuenta)
                       
        elif mes_actual != mes:
            print(mes_actual + '\t' +str(cuenta_actual))
            cuenta_actual = 1
            mes_actual = mes
    
    print(mes_actual + '\t' +str(cuenta_actual))
