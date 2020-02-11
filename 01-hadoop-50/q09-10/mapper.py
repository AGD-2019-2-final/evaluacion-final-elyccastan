import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:
        
        letra = line.split('   ')[0]
        fecha = line.split('   ')[1]
        valor = int(line.split('   ')[2])
        valor1 = "{:03.0f}".format(valor)
        
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(valor1,letra,fecha,valor))