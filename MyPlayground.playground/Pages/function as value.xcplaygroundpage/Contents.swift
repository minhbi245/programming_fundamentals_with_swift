import UIKit

func square(_ number: Int) -> Int {
    return number * number
}

let numbers: [Int] = [1, 2, 3, 4, 5]

let squaredNumbers = numbers.map { square($0) }
let squareNumbersV2 = numbers.map(square(_:))

print(squaredNumbers)
print(squareNumbersV2)
