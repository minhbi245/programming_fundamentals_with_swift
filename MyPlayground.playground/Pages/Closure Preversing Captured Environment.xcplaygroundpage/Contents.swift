//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func countAdder(_ f: @escaping () -> ()) -> () -> () {
    var ct = 0
    return { [weak self]
        ct = ct + 1
        print("count is \(ct)")
        f()
    }
}

func greet () {
    print("howdy")
}
let countedGreet = countAdder(greet)
countedGreet() // ?
countedGreet() // ?
countedGreet()
