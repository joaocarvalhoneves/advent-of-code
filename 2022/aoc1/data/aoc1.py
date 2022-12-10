import numpy

with open('/Users/nevesj/Documents/Design/GitHub/advent-of-code/2022/aoc1/data/data.txt') as f:
    data = f.read().splitlines()

num = 0
maxCal = []

for i in data:
    if i != "":
        num+= int(i)
    else:  
        maxCal.append(num)
        num = 0

maxCal.sort()
maxCal.reverse()

print(numpy.sum(maxCal[0:3]))