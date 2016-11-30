import random
import sys
import os
import operator
import csv

#open data file
f = open('data.csv')
#read contents
csv_file = csv.reader(f, delimiter=',')
#store header
header = next(csv_file)
#sort by 7th column
sort = sorted (csv_file, key=operator.itemgetter(7))
#empty dict
bio_mass = {}
#set total to 0
total = 0
#set i to 0
i = 0
#start witing sorted list
writer = csv.writer(open("sorted_data.csv", 'w'))
#start with the header ofcourse
writer.writerow(header)
# for each row write the row, store the bio_mass, calculate total then increment i
for row in sort:
    writer.writerow(row)
    bio_mass[row[0]] = float(row[20])
    total += float(row[10])
    i+=1
#display glorious results
print('Sorted list saved to csv')

print('Farmer with highest biomass: ', max(bio_mass, key=bio_mass.get))

print('Farmer with lowest biomass: ', min(bio_mass, key=bio_mass.get))

print('The average number of plants harvested is: ', total/i)



