import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:
        letra,valor1,fecha,valor = line.split("\t")
        valor=int(valor)
        
        sys.stdout.write("{}   {}   {}\n".format(letra, fecha, valor))