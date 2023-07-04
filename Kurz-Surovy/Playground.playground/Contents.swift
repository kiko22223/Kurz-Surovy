import UIKit

let days : [(name:String, order: Int)] = [("utorok", 1),("streda",2),("pondelok", 0),("piatok",4),("nedela",6),("sobota",5),("stvrtok", 3)]

let sortedDays = days.sorted(by: { $0.order < $1.order })

for day in sortedDays {
    print("\(day.name.localizedCapitalized) je \(day.order + 1). den v tyzdni")
}

let dayNames = sortedDays.map{$0.name}

print(dayNames)
