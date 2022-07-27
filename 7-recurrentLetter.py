''''
Question: https://www.youtube.com/watch?v=GJdiM-muYqc

Give the first repeating letter given a string of random letters

DBCABA -> B
'''

string = "DBCABA"
counter = {}

for char in string:
  if char in counter:
    counter[char] += 1
  else:
    counter[char] = 1

for char in string:
  if counter[char] > 1:
    print(char)
    break