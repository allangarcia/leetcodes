/*
Problem: Write a function that given an array of numbers returns the first non-repeated number

Ex. given the array [ 5, 1, 1, 5, 4, -1 ] -> the answer should be 4
*/

let arrayOfNumbers = [9, 4, -1, 3, 5, 1, 1, 9, 1, 7, 1, 3, 1, 1, 5, 4, -1, 0]

/*
01
*/

// Remembering the apple's engineer solution, much more elegant and simple
func firstNonRepeatedNumber(of arrayOfNumbers: [Int]) -> Int? {
  
  // Create a hashtable/dictionary to store the counts
  var counter: [Int: Int] = [:]

  // Traverse the array and count the numbers
  for number in arrayOfNumbers {
    counter[number] = (counter[number] ?? 0) + 1
  }

  // Traverse again the array looking for counts 1 in the dictionaty ;) I fucked up here.
  for number in arrayOfNumbers {
    if counter[number] == 1 {
      return number
    }
  }

  return nil
}
// NOTE: At first I started to pursue this idea, but doesn't occur to me that I could traverser the same array twice
//       so the answer will be in order. This was almost the solution given by Apple Engineer in an interview. And the correct one.


/*
02
*/

// That second function was my attempt in the interview. NOT CORRECT AT ALL.

func firstNonRepeatedNumber2(of arrayOfNumbers: [Int]) -> Int? {

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
// FIXME: Not work for repeating 3 or more times


/*
03
*/

// That was my solution with more tome after the interview... but much more complex and less elegant then the first one.

func firstNonRepeatedNumber3(of arrayOfNumbers: [Int]) -> Int? {

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
Lessons and feedback:

1. The dictionary approach to counting the numbers and then showing the one with the count 1 does not work.
   And cannot guarantee that was the FIRST number that does not repeat, if you are thinking about traversing a dictionary,
   that doesn't obey orders. In the soluction approach in 01, the array (ordered) is used twice to get the answer.

2. This implemented logic does not work either for repeating numbers that appear 3 or more times.

3. Solution 03 works, but is more complex and not preferred. I have to count and store also the order, then filter
   then to show the first one.

*/