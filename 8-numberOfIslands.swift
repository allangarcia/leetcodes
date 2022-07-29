// Count the number of islands in a 2 dimentional matrix

// An island is defined to a portion of land represented by 1
// Water is represented as 0

// example:
// [
//     [1,1,1,1,1,1,1,1,1],
//     [1,1,1,1,1,1,1,1,1],
//     [1,1,0,0,0,0,0,1,1],
//     [1,1,0,0,0,0,0,1,1],
//     [1,1,0,0,0,0,0,1,1],
//     [1,1,0,0,0,0,0,0,0],
// ]

// result should be 1

// THIS IS A SOLUTION FOR ITERATIVE APPROACH USING A LIST

var landMap = [
    [1,1,1,1,1,1,1,1,1],
    [1,1,1,1,1,1,1,1,1],
    [1,1,0,0,0,0,0,1,1],
    [1,1,0,1,1,0,0,1,1],
    [1,1,0,0,1,1,0,0,1],
    [1,1,0,0,0,0,0,0,0]
]

// SHOW MAP
for i in landMap.indices {
    let i = Int(i)
    for j in landMap[i].indices {
        let j = Int(j)
        print("\(landMap[i][j])", separator: " ", terminator: "")
    }
    print("")
}

struct Tuple: Hashable {
    let x: Int
    let y: Int
}

func countNumberOfIslands(in island_map: [[Int]]) -> Int {

    var stack = Set<Tuple>() {
        didSet {
            print("Stack = \(stack)")
        }
    }
    var map = island_map
    var counter = 0

    for i in map.indices {
        let i = Int(i)
        for j in map[i].indices {
            let j = Int(j)
            if map[i][j] == 1 {
                stack.insert(Tuple(x: i, y: j))
                // SHOW MAP
                print("")
                for i in map.indices {
                    let i = Int(i)
                    for j in map[i].indices {
                        let j = Int(j)
                        print("\(map[i][j])", separator: " ", terminator: "")
                    }
                    print("")
                }
                while !stack.isEmpty {
                    let tuple = stack.removeFirst()
                    let new_i = tuple.x
                    let new_j = tuple.y
                    map[new_i][new_j] = 0
                    //left
                    if new_i > 0 {
                        if map[new_i - 1][new_j] == 1 {
                            stack.insert(Tuple(x: new_i - 1, y: new_j))
                        }
                    }
                    //up
                    if new_j > 0 {
                        if map[new_i][new_j - 1] == 1 {
                            stack.insert(Tuple(x: new_i, y: new_j - 1))
                        }
                    }
                    //right
                    if new_i < map.count - 1 {
                        if map[new_i + 1][new_j] == 1 {
                            stack.insert(Tuple(x: new_i + 1, y: new_j))
                        }
                    }
                    //down
                    if new_j < map[new_i].count - 1 {
                        if map[new_i][new_j + 1] == 1 {
                            stack.insert(Tuple(x: new_i, y: new_j + 1))
                        }
                    }
                }
                counter += 1
                print("Counter = \(counter)")
                
            }
        }
    }
    return counter
}



let result = countNumberOfIslands(in: landMap)
print("Number os islands is = \(result)")