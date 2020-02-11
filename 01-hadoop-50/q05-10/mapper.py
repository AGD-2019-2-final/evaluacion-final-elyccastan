import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:
        
        splits = line.split("-")
        mes = splits[1]
                
        sys.stdout.write("{}\t1\n".format(mes))