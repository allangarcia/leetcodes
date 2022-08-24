/*
The algorithm consist into fliping coins to the pattern that into a given array the next element will be always a oposite from the before
and counting how many flips was necessary to change to the right pattern.

Examples:

A = [1,0,1,0,1,1] -> [1,0,1,0,1,0], counter of 1
A = [0,1,0] -> [0,1,0], counter of 0
A = [1,1,0,0,1,1] -> [0,1,0,1,0,1] or [1,0,1,0,1,0], both counter of 3

Edge cases:
A = [1,1,0,1,0,1] -> [0,1,0,1,0,1], counter of 1
A = [0,1,1,0,1,0] -> [1,0,1,0,1,0], counter of 2

*/

/*
Initial thinking:
- Simpler
1. starting by the first element, iterate over all elements changing it if not meet the criteria and summing up the counter by 1
2. starting by the first element, flipit, sum 1, then fo the first
3. the result will be the less flip from the two above
*/


// Input is an Array<Int> = example
// Output is a tuple/set, where first element is the correctet Array<Int> and
// The counter meaning the number of flips

func flipAndFlop(_ array: [Int]) -> ([Int], Int) {

    guard array.count > 0 else { return ([], 0)}
    guard array.count > 1 else { return (array, 0)}
    guard array.count >= 3 else {
        if (array.first! + array.last! == 2) || (array.first! + array.last! == 0){
            var copy = array
            copy[0] = copy[0] == 0 ? 1 : 0
            return (copy, 1)
        } else {
            return (array, 0)
        }
    }

    var fixed = array
    var counter: Int = 0

    for i in 1..<fixed.count-1 {
        let flip = fixed[i]
        let flop = flip == 1 ? 0 : 1
        if fixed[i-1] == flop && fixed[i+1] == flop {
            continue
        } else {
            if fixed[i-1] == flop {
                fixed[i+1] = flop
                counter += 1
                continue
            }
            if fixed[i+1] == flop {
                fixed[i-1] = flop
                counter += 1
                continue
            }
        }
    }

    return (fixed, counter)
}
var example: [Int] = []
var result: ([Int], Int) = ([], 0)

example = [1,0,1,0,1,1]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")


example = []

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")


example = [1,0,1]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")


example = [1,0]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")


example = [0,0,1,0,1,1]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")


example = [1,1,1,0,1,0]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")

example = [1,1]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")

example = [0,0]

result = flipAndFlop(example)

print("Original was: \(example)")
print("Corrected Array is: \(result.0)")
print("Flips made was: \(result.1)")
