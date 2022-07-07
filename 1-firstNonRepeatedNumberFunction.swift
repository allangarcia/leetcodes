/*
Problem: Write a function that given an array of numbers returns the first non-repeated number

Ex. given the array [ 5, 1, 1, 5, 4, -1 ] -> the answer should be 4
*/

let arrayOfNumbers = [5, 1, 1, 5, 4, -1]

func firstNonRepeatedNumber(of arrayOfNumbers: [Int]) -> Int? {

  var seemBefore: [Int] = []

  for i in arrayOfNumbers.indices {
    let number = arrayOfNumbers[i]
    if !seemBefore.contains(number) {
      seemBefore.append(number)
    } else {
      seemBefore.removeAll(where: {$0 == number})
    }
  }

  return(seemBefore.first)
}

if let number = firstNonRepeatedNumber(of: arrayOfNumbers) {
  print("There is a response: \(number)")
} else {
  print("No non-repeating number.")
}
