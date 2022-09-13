/*
This question was asked by filtered.ai // YET ANOTHER COMPANY TRYIGN TO SELECT AUTOMAGICALLY CANDIDATES, WILL SELECT ALWAYS THE WORSTS!

The main goal is to output the forthest largest number in a array. Easy. But they turned up difficult by making a text structure
that you must read in sequence and reconstruct the array itself, so the main goal wasn't the priorityQueue but the string manipulation
itself.

INPUT

3
10
1 4 6 3 8 6 4 10 12 14
4
5 6 1 9
7
6 3 8 12 56 43 678

2
3
0001 0002 0003
2
56 78

Explanation:

1. the first line is the number of tests will be made,
2. for each test a number of element in the next row is presented
3. the row of element is presented to read, order and get the forthest one
   3.1. if the array is less than 4 return the first element

OUTPUT

8
1
12

// CONCERN, was not clear in the question what to do if a series of tests are presented, like I specify here, I'm stick to the concept that a black line is outputed
1
56

*/

let inputData = """
3
10
1 4 6 3 8 6 4 10 12 14
4
5 6 1 9
7
6 3 8 12 56 43 678

2
3
0001 0002 0003
2
56 78
"""

func response(inputData: String) -> String { // <-- this is how they pre filled the answer, you must have to put your answer in here

    enum State {
        case numOfTests
        case numOfElements
        case readingElements
    }

    var state: State = State.numOfTests
    var outputData: String = ""
    var maxNumOfTests: Int = 0
    var currentTest: Int = 0
    var maxNumOfElements: Int = 0

    for line: Substring in inputData.split(separator: "\n") {

        switch state {
            case .numOfTests:
                
                guard let number: Int = Int(line) else { return "ERROR!" }
                maxNumOfTests = number
                currentTest = 0

                state = .numOfElements
            case .numOfElements:
                
                guard let number: Int = Int(line) else { return "ERROR!" }
                maxNumOfElements = number

                state = .readingElements
            case .readingElements:
                
                currentTest += 1
                let aInt: [Int] = line.split(separator: " ").map( { Int($0)! } )
                let sortedQueue: [Int] = aInt.sorted()
                assert(sortedQueue.count == maxNumOfElements, "sortedQueue.count is \(sortedQueue.count) - maxNumOfElements is \(maxNumOfElements)")
                let fourthest: Int = max(0, sortedQueue.count - 3)
                outputData += String(sortedQueue[fourthest])
                outputData += "\n"

                if currentTest < maxNumOfTests {
                    state = .numOfElements
                } else {
                    state = .numOfTests
                }
        }

    }

    return outputData // <-- another problem, this infers that I have to return the inputData? Not clear!
} 


print(response(inputData: inputData))