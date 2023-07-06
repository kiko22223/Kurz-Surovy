import UIKit

var arrayInt : [Int] = []
var duplicates : [Int : Int] = [:]
var x = 0

//for x in 0..<100 {
//    arrayInt.append(Int.random(in: 1...10))
//}

while x <= 100 {
    arrayInt.append(Int.random(in: 1...10))
    x = x + 1
}

func porovnaniePocetnosti(left: Int, right: Int) -> Bool {
    return duplicates[left]! > duplicates[right]!
}

for i in arrayInt {
    duplicates[i] = (duplicates[i] ?? 0) + 1
}
print(duplicates)

var numbers = duplicates.keys.sorted(by: { left, right in
    return duplicates[left]! > duplicates[right]!
})

let numbers2 = duplicates.keys.sorted(by: porovnaniePocetnosti)

print(numbers)

print(numbers2)

var tuples : [(Int, Int)] = []

//for (key,value) in duplicates {
//    tuples.append((key,value))
//}

for tuple in duplicates {
    tuples.append(tuple)
}

print(tuples)

// left < right
