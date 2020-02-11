import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":
    
     for line in sys.stdin:

        num, col1, num1 = line.split("\t")
        col2=int(num1)

        sys.stdout.write("{},{}\n".format(col1, col2))