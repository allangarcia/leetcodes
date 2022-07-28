/*
Question: https://www.youtube.com/watch?v=GJdiM-muYqc

Give the first repeating letter given a string of random letters

Example: DBCABA -> B
*/

var string: String = "DBCABA"
var counter: [Character: Int] = [:]

func returnFirstRepeatingChar(in givenString: String) -> String? {
  for char in givenString {
    if counter[char] != nil {
        return String(char)
    }
    counter[char] = 1
  }
  return nil
}

var result = returnFirstRepeatingChar(in: string)
print(result ?? "")