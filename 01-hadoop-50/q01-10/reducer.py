import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    
    cantidad_registros_actual = 0
    credit_history_actual = None
       
    for line in sys.stdin:
        
        credit_history, cantidad_registros = line.split("\t")
        
        if not credit_history_actual:
            credit_history_actual = credit_history
            cantidad_registros_actual += int(cantidad_registros)
                 
        elif credit_history_actual == credit_history:
            cantidad_registros_actual += int(cantidad_registros)
                       
        elif credit_history_actual != credit_history:
            print(credit_history_actual + '\t' +str(cantidad_registros_actual))
            cantidad_registros_actual = 1
            credit_history_actual = credit_history
    
    print(credit_history_actual + '\t' +str(cantidad_registros_actual))