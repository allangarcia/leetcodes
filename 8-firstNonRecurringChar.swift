// Question variation: https://www.youtube.com/watch?v=GJdiM-muYqc
//
// Give the first NON repeating letter given a string of random letters
//
// Example: DBCABA -> B

import Foundation

var string = "DBCABA"
var counter: [String: Int] = [:]


func returnFirstNonRepeatingChar(in givenString: String) -> String? {
    for character in givenString {
        let key = String(character)
        if counter[key] != nil {
            counter[key]! += 1
        } else {
            counter[key] = 1
        }
    }

    for character in givenString {
        let key = String(character)
        if let count = counter[key], count == 1 {
            return key
        }
    }
    return nil
}

var result = returnFirstNonRepeatingChar(in: string)
print("First non repeating char is \(result ?? "0")")