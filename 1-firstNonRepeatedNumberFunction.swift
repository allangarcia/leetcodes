/*
Problem: Write a function that given an array of numbers returns the first non-repeated number

Ex. given the array [ 5, 1, 1, 5, 4, -1 ] -> the answer should be 4
*/

let arrayOfNumbers = [4, -1, 3, 5, 1, 1, 9, 1, 1, 3, 1, 1, 5, 4, -1, 0]

// FIXME: Not work for repeating 3 or more times
// func firstNonRepeatedNumber2(of arrayOfNumbers: [Int]) -> Int? {

//   var seemBefore: [Int] = []

//   for i in arrayOfNumbers.indices {
//     let number = arrayOfNumbers[i]
//     if !seemBefore.contains(number) {
//       seemBefore.append(number)
//     } else {
//       seemBefore.removeAll(where: {$0 == number})
//     }
//   }

//   return(seemBefore.first)
// }

func firstNonRepeatedNumber(of arrayOfNumbers: [Int]) -> Int? {

  struct OrderedNumber {
    let value: Int
    var count: Int
    let indice: Int
  }

  var counter: [Int: OrderedNumber] = [:]

  for index in arrayOfNumbers.indices {
    let number = arrayOfNumbers[index]
    if counter[number] != nil {
      counter[number]!.count += 1
    } else {
      counter[number] = OrderedNumber(value: number, count: 1, indice: index)
    }
  }

  let filteredCounter = counter.values.filter { $0.count == 1 }

  let sortedCounter = filteredCounter.sorted { $0.indice < $1.indice }

  return sortedCounter.first?.value

}

if let number = firstNonRepeatedNumber(of: arrayOfNumbers) {
  print("There is a response: \(number)")
} else {
  print("No non-repeating number.")
}

/*
Lessons and feedbacks:

1. The dictionary approach into counting the numbers and then showing the one with the count 1 not work.
   I cannot guarantee that was the FIRST number that not repeat.

2. This this implemented logic not work either for repeating numbers that appears 3 or more times.

3. I have to count and store also the order, them filter then to show the first one.

*/