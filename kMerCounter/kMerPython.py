from collections import defaultdict
import time

def count_kmers(k, seq):
    counts = defaultdict(int)
    for i in range(len(seq) - k + 1):
        kmer = seq[i:i+k]
        counts[kmer] += 1
    tuples = sorted(counts.items(), key=lambda x: x[1], reverse=True)
    return tuples

if __name__ == '__main__':
    
    with open('DNA.txt', 'r') as f:
        seq = f.read()

    #k = int(input('Enter k: '))

    k = 1000
    
    startTime = int(round(time.time() * 1000))

    tuples = count_kmers(k, seq)

    endTime = int(round(time.time() * 1000))
    total = endTime - startTime

    #print('K-mer counts:')
    #for kmer, count in tuples:
    #    print(f'{kmer}: {count}')

    print(f'Total time: {total} miliseconds')
