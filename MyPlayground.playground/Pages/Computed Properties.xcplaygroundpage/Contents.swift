//: [Previous](@previous)

import Foundation

// That's using facade pattern, as gatekeeper to just get value from _pp to show on pp

var _pp: Int = 0

var pp: Int {
    get {
        _pp
    }
    set {
        print("This will be set new value to pp")
        _pp = max(min(newValue, 5),0)
    }
}

pp = 6 // If we assign a value to pp, that will be call set method on itself and it will be set a new value depend on logic get min or max
print(pp) // when whe call pp computed variable here equivalent with we call get method within itset and like return value
print(_pp)  // or we can call name variable _pp it will be set new value before we set value to pp before, so if we call and print this will be value is 5 not 0

// shorthand write variable just read-only or get value only prevent set a new value on this

var readOnly: Int {
    return pp   // just access value from another property/variable is pp and stored value
}
// readOnly = 7    // causing readOnly is a get-only property so it cannot assign anything value on it own, if we excute code, it will be show error
print(readOnly)



// Setter Observer
var newString = "What" {
    willSet {
        testWillSet()
        print(newString)
    }
    didSet {
        testDidSet()
        print(newString)
    }
}

func testWillSet() {
    print("Will set called")
}

func testDidSet() {
    print("Did set called")
}

newString = "Assign new value"
