# Question: https://www.youtube.com/watch?v=GJdiM-muYqc
#
# Give the first repeating letter given a string of random letters
#
# Example: DBCABA -> B

string = "DBCABA"
counter = {}

def return_recurring_char_in(given_string):
  for char in given_string:
    if char in counter:
      return char
    counter[char] = 1
  return None

result = return_recurring_char_in(string)
print(result)