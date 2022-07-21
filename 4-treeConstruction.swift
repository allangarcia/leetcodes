/*
Given a list of numbers make a tree data structure

1,2,3,4,5,6,7,8,9,10

*/

let values = "6,3,6,8,2,1,4,9,45,3,2,5,3,58,9"


struct Node<Value> {
  var value: Value
  private(set) var children: [Node]

  mutating func add(_ child: Node) {
    children.append(child)
  }

  init(_ value: Value) {
    self.value = value
    children = []
  }

  init(_ value: Value, children: [Node]) {
    self.value = value
    self.children = children
  }
}

var arrayOfValues = values.split(separator: ",").map({ Int($0)! })

print(arrayOfValues)

let first = arrayOfValues.removeFirst()

var trunk = Node(first)
while (arrayOfValues.count > 0) {
  let leafs = trunk.children.count
  
  let next = arrayOfValues.removeFirst()
  trunk.add(Node(next))
}



print(arrayOfValues)
print(trunk)