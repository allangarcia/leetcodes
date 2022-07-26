/*

THe objective is to reproduce the video that I watched yesterday from memory and make a 
triangle pascal like this:


         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1

where the node bellow is the sum of the two above.
*/

var numOfRows = 8

func solver(_ numOfRows: Int) -> [[Int]] {
    var answer = [[Int]]()

    for i in 1...numOfRows {

        guard numOfRows > 0 else {
            return [[]]
        }

        if i == 1 {
            answer.append([1])
        } else if i == 2 {
            answer.append([1,1])
        } else {
            var nextRow = [Int]()
            nextRow.append(1)
            let prevRow = answer.last!
            for j in 1..<prevRow.count {
                var sum = 0
                sum = prevRow[j] + prevRow[j-1]
                nextRow.append(sum)
            }
            nextRow.append(1)

            answer.append(nextRow)
        }
    }

    return answer
}

let answer = solver(numOfRows)
for row in answer {
    print(row)
}