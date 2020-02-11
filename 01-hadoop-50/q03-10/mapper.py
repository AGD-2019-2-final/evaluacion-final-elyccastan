import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:

        splits = line.split(",")
        col1 = splits[0]
        num = splits[1]
        col2 = int(num)
        
        sys.stdout.write("{}\t{}\t{}\n".format(col2,col1,col2))