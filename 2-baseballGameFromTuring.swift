/*
A crazy baseball game. The game consists of several rounds, past rounds may affect future rounds.

Case integer: store an integer on the array
Case "+": Sum the previous two values
Case "D": Double the previous value
Case C: Invalidates the previous value

Ex. ops = ["5", "2", "C", "D", "+"] => 30

Explanation:
"5" - Add 5 to the record, record is now 5.
"2" - Add 2 th the record, record is now [5, 2]
"C" - Invalidate and remove the previous score, record is now [5]
"D" - Doubles the previous value, record is now [5, 10]
"+" - Sum the two previous values, record is now [5, 10, 15]
Result is the sum of the whole array.
Output = 30
*/

// This is a classical example of stack data structure

//let ops = ["5", "2", "C", "D", "+"]
let ops: [String] = ["5", "-2", "4", "C", "D", "9", "+", "+"]
//let ops: [String] = ["1"]

func calculateCrazyScore(of operations: [String]) -> Int {
  var stack: [String] = [] // stack initialized empty

  for op in operations {
    switch op {
      case "+": // pop two values and put then back
        let plusOp1 = stack.removeLast()
        let plusOp2 = stack.removeLast()
        let plusIntOp1 = Int(plusOp1)! // I can do that cause the problem make sure that has two integer values when + is encountered
        let plusIntOp2 = Int(plusOp2)!
        let plusTempResult = plusIntOp1 + plusIntOp2
        stack.append(plusOp2)
        stack.append(plusOp1)
        stack.append(String(plusTempResult))
      case "C":
        let _ = stack.removeLast()
      case "D":
        let doubleOp1 = stack.removeLast()
        let doubleIntOp1 = Int(doubleOp1)!
        let doubleTempResult = 2 * doubleIntOp1
        stack.append(doubleOp1)
        stack.append(String(doubleTempResult))
      default:
        stack.append(op)
    }
    print("Stack: \(stack)")
  }

  return stack.reduce(0, { sum, op in return sum + Int(op)!})

}

print(calculateCrazyScore(of: ops))