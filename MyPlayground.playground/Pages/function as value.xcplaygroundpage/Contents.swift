import UIKit

func square(_ number: Int) -> Int {
    return number * number
}

let numbers: [Int] = [1, 2, 3, 4, 5]

let squaredNumbers = numbers.map { square($0) }

print(squaredNumbers)
