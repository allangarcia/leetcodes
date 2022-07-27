# Question variation: https://www.youtube.com/watch?v=GJdiM-muYqc
#
# Give the first NON repeating letter given a string of random letters
#
# Example: DBCABA -> B

string = "AABBECC"
counter = {}

def first_non_recurring_char_in(given_string):
  for char in given_string:
    if char in counter:
      counter[char] += 1
    else:
      counter[char] = 1
  
  for char in given_string:
    if counter[char] == 1:
      return char
  
  return None

result = first_non_recurring_char_in(string)
print(result)