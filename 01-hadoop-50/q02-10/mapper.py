import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    purpose = "-"
    amount = 0
    
    for line in sys.stdin:

        splits = line.split(",")
        purpose = splits[3]
        amount = splits[4]
        
        if purpose != "purpose":
            print(purpose + '\t' + amount)