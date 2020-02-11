import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
        
        n=0
        
        for line in sys.stdin:
            
            valor1, letra, fecha, valor = line.split("\t")
            valor = int(valor)

            if n < 6:
                sys.stdout.write("{}   {}   {}\n".format(letra, fecha, valor))
            n = n + 1