/*
Those are for my real projects when I have to decide for a magic numbers and
instead what to give a number proportinal to the size of the screen.

*/

var input = """
- iPhone 8: (375, 667)
- iPhone 8 Pro: (414, 736)
- iPhone X: (375, 812)
- iPhone XS: (375, 812)
- iPhone XS Max: (414, 896)
- iPhone XR: (414, 896)
- iPhone 11: (414, 896)
- iPhone 11 Pro: (375, 812)
- iPhone 11 Pro Max: (414, 896)
- iPhone SE 2nd Gen: (375, 667)
- iPhone 12: (390, 844)
- iPhone 12 Mini: (375, 812)
- iPhone 12 Pro: (390, 844)
- iPhone 12 Pro Max: (428, 926)
- iPhone 13: (390, 844)
- iPhone 13 Mini: (375, 812)
- iPhone 13 Pro: (390, 844)
- iPhone 13 Pro Max: (428, 926)
- iPad Mini (6th gen): (744, 1133)
- iPad 9th gen: (810, 1080)
- iPad Pro (5th gen 12.9”): (1024, 1366)
- iPad Pro (5th gen 11”): (768, 1194)
- iPad Air (4th gen): (820, 1180)
- iPad 8th gen: (810, 1080)
- iPad Pro (4th gen 12.9”): (1024, 1366)
- iPad Pro (4th gen 11”): (834, 1194)
- iPad 7th gen: (810, 1080)
- iPad Mini (5th gen): (768, 1024)
- iPad Air (3rd gen): (834, 1112)
- iPad Pro (3rd gen 12.9”): (1024, 1366)
- iPad Pro (3rd gen 11”): (834, 1194)
- iPad 6th gen: (768, 1024)
- iPad Pro (2nd gen 12.9”): (1024, 1366)
- iPad Pro (2nd gen 10.5”): (834, 1112)
- iPad 5th gen: (768, 1024)
"""

var dictionary: [String: (Int, Int)] = [:]

for eachLine in input.split(separator: "\n") {
    let line = String(eachLine)
    let arrayLine = line.split(separator: ":")
    let model = arrayLine.first!
    let dimensions = arrayLine.last!

    let name = model.dropFirst(2)
    // print(name)
    // print(dimensions)
    let dim1 = dimensions.dropFirst(2)
    let dim2 = dim1.dropLast(1)
    // print(dim1)
    // print(dim2)
    let dim3 = dim2.split(separator: ",")
    let digit1 = dim3.first!
    let digit2 = dim3.last!.dropFirst()

    // print(digit1)
    // print(digit2)

    let number1 = Int(String(digit1))!
    let number2 = Int(String(digit2))!
    // print(number1)
    // print(number2)
    //let digit1 = Int(dim.first!)!
    //let digit2 = Int(dim.last!.dropFirst())!

    dictionary[String(name)] = (number1, number2)
}

print(dictionary)

for each in dictionary {

    let model = each.key
    let minimum = min(each.value.0, each.value.1)
    
    print("Model: \(model): expected padding = \(minimum / 78)")

}