//: [Previous](@previous)

import Foundation

// MARK: - Properties instance
class Dog {
    let name: String
    let age: Int
    let license: Int
    
    init(name: String, age: Int, license: Int) {
        self.name = name
        self.age = age
        self.license = license
    }
}

// Fist need to create the instance of Object Type is Dog
let fido = Dog(name: "Fido", age: 3, license: 240503)
let spot = Dog(name: "Spot", age: 4, license: 220403)

// Accessed the properties each instances through instance has created before
print(fido.name) // access to property is name by instance is fido
print(spot.name) // accessed to property is name by instance is spot


// MARK: Properties belong to Object Type
struct Greeting {
    static let friendly = "Hello there"
    static let hostile = "Go away"
}

// Create a Object Type have properties and method using static & class
class Cat {
    static var name: String = "Kittie"
    class var age: Int {    // computed property could using with var
        return 5
    }
    
    class func say() {
        print("Hello \(name), your age: \(age)")
    }
}

// Accessed to the properties belong to the Object Type will using static for struct and class for class
print(Greeting.friendly)    // accessed by call type and dot to accessed to property friendly
print(Cat.name)             // fimiliar with above
Cat.say()   // method Object Type also called by Object Type and . for call method

// MARK: - Property Initialization and self

class Moi {
    let first = "Khanh"
    let last = "Nguyen"
    // let whole = self.first + " " + self.last // compiler will show the error, cause this instance of Object Type didn't full initializers
    
    // Two solutions could be resolve there
    // first we're going to use computed property
    var whole: String {
        return self.first + " " + self.last
    }
    
    // second we can use the lazy keyword to declare a property and use self
    lazy var whole2 = self.first + " " + self.last
    
    // Addtionally we can you lazy var combine with the anonymous function, specifically define-and-call
    lazy var whole3: String = {
        var string: String = ""
        string.append(self.first)
        string.append(self.last)
        return string
    }()
    
}

let moi1 = Moi()
print(moi1.whole)
print("Show using lazy var: \(moi1.whole2)")
print("Show using lazy var combine define-and-call: \(moi1.whole3)")

// But with static is the similar lazy declared, so we can use that for access property by Object Type
class MoiTwo {
    static var first = "Khanh"
    static var last = "Nguyen"
    static var fullName = first + last  // Noted the static just used with property using static, could not accessed by property not static
}

struct Greeting1 {
    static let friend = "Hello there"
    static let hostile =  "go away"
    static let ambivalent = Greeting.friendly + " but " + Greeting.hostile
    static let ambivalentV2 = self.friend + " but " + self.hostile
}

print(Greeting1.ambivalentV2)
