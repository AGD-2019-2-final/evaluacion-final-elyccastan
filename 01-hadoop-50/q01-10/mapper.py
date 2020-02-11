import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    credit_history = "-"
    
    for line in sys.stdin:

        splits = line.split(",")
        credit_history = splits[2]
        sys.stdout.write("{}\t1\n".format(credit_history))