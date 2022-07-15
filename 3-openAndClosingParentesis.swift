/*
So the program is to verifi if the order of open and closing parentesis is well formated
another classical example of stack use

symbols valid = "()[]{}"

for each open ( has to be a closing ) in the right order... the same for [] and {}

Ex. valid combinations

1. ([{}])
2. ()[]{}
3. ({})

Ex. invalid combinations

1. ([}]
2. [{]()
3. ({[})

*/

var program = "([{}])"

func executeCheck(_ program: String) -> Bool {
  var isValidProgram = true

  var stack: [String] = []
  let parity = [ "(": ")", "[": "]", "{": "}"]

  for char in program {
    switch char {
      case ")", "]", "}":
        let lastInStack = stack.removeLast()
        let e = String(char)
        if e != parity[lastInStack] {
          isValidProgram = false
        }
      case "(", "[", "{":
        let e = String(char)
        stack.append(e)
      default:
        break
    }
    print("Stack is: \(stack)")
  }
 
  return isValidProgram
}

print(executeCheck(program))
