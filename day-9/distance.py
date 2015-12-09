#!/usr/bin/env python
 
import itertools
import collections
import sys

distance = collections.defaultdict(collections.defaultdict)

#read the input
for line in sys.stdin:
	op = line.split(" ")
	distance[op[0]][op[2]] = int(op[4])
	distance[op[2]][op[0]] = int(op[4])
 
min, max = sys.maxsize, 0

#find all permutations
for path in itertools.permutations(distance.keys()):
		currentDistance = 0
		#zip adjacent destinations
		for fr, to in zip(path, path[1:]):
			currentDistance += distance[fr][to]
		if currentDistance < min:
			min = currentDistance
		if currentDistance > max:
			max = currentDistance
 
print("Shortest path: %s \nLongest path: %s" % (min, max))
