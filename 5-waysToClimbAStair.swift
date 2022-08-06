/*
There's a staircase with N steps, and you can climb 1 or 2 steps at a time. Given N, write a function that returns the 
number of unique ways you can climb the staircase. The order of the steps matters.

For example, if N is 4, then there are 5 unique ways:

1, 1, 1, 1
2, 1, 1
1, 2, 1
1, 1, 2
2, 2
What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive 
integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time. Generalize your function to take in X.

NOTE: If too much output from the script codespaces crashes...

*/

let n = 10
let steps = [1, 3, 5]

func waysToTraverseAStair(of size: Int, using steps: [Int]) -> [[Int]] {

    var results = [[Int]]()
    var stack = [[Int]]()

    for step in steps {
        let item = [step]
        stack.append(item)
    }

    //print("Start stack: \(stack)")

    while stack.count > 0 {

        let item = stack.popLast()
        if let possible = item {
            
            //print("Before for stack: \(stack)")
            for step in steps {
                var list = possible
                list.append(step)
                stack.insert(list, at: 0)
            }
            print("After for stack: \(stack)")

            //print("Before clean stack: \(stack)")
            for item in stack {
                //print("Cleaning: \(item)")
                let sum = item.reduce(0, { $0 + $1 })
                if sum == size {
                    results.append(item)
                    stack.removeAll(where: { $0 == item })
                }
                if sum > size {
                    stack.removeAll(where: { $0 == item })
                }
            }
            print("After clean stack: \(stack)")


        }

    }

    return results
}

let results = waysToTraverseAStair(of: n, using: steps)
print("Results: \(results)")
print("Count: \(results.count)")