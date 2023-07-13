var arrayOfNumbers: [Int] = []
for i in 1...101 {
    arrayOfNumbers.append(Int.random(in: 0...100))
}

func findEvenAndNotEvent (array: [Int]) {

    var even = 0.0
    var notEven = 0.0
    var sum = 0.0
    var count = 0.0
    var oddSum = 0.0
    var evenSum = 0.0
    
    
    for number in array {
        count += 1
        if number == 0 {
            continue
        }
        
        if number % 2 == 0 {
            even += 1
            evenSum += Double(number)
        } else {
            notEven += 1
            oddSum += Double(number)
        }
        sum += Double(number)
    }
    let average = String(format:"%.2f",Double(sum) / Double(count))
    let averageOdd = String(format: "%.2f",Double(oddSum) / Double(notEven))
    let averageEven = String(format: "%.2f", Double(evenSum) / Double(even))
    
    print(sum)
    print(count)
    print("Number of even numbers is \(even), number of odd numbers is \(notEven), average is \(average), \naverage of odd numbers is \(averageOdd), average of even numbers is \(averageEven)")
}

findEvenAndNotEvent(array: arrayOfNumbers)

//convertor pocitadlo otvoreni jednotlivych detailov jednotiek, zobrazit niekde v detaile resp v danom view cislo otvoreni
