import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    
    purpose_actual = None
    amount_actual = 0
       
    for line in sys.stdin:
        
        purpose, amount = line.split("\t")
        
        if not purpose_actual:
            purpose_actual = purpose
            if int(amount) > int(amount_actual):
                amount_actual = amount
                 
        elif purpose_actual == purpose:
            if int(amount) > int(amount_actual):
                amount_actual = amount
                       
        elif purpose_actual != purpose:
            sys.stdout.write(purpose_actual + '\t' +str(amount_actual))
            purpose_actual = purpose
            amount_actual = 0
    
    sys.stdout.write(purpose_actual + '\t' +str(amount_actual))