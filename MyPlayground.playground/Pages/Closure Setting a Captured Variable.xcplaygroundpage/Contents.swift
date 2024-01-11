//: [Previous](@previous)

import Foundation

func pass100(_ f: (Int) -> ()) {
    f(100)
}

var x = 0
print("before pass x to the closure call setX: \(x)")
func setX(newX: Int) {
    x = newX
}

pass100(setX)
print(x)
print("After passed x to the closure called setX: \(x)")
