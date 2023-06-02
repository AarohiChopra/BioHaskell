import time

with open('DNA.txt', 'r') as f:
    dna = f.read()

at_count = 0
cg_count = 0

startTime = int(round(time.time() * 1000))

for i in range(len(dna)-1):
    dinucleotide = dna[i:i+2]
    if dinucleotide == "AT":
        at_count += 1
    elif dinucleotide == "CG":
        cg_count += 1

endTime = int(round(time.time() * 1000))
total = endTime - startTime

print("Number of AT pairs:", at_count)
print("Number of CG pairs:", cg_count)

print(f'Total time: {total} miliseconds')
