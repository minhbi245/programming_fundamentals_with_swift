//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground" // Global varable

class Person {
    func printGlobal() {
        print(greeting) // method ben trong class van co the thay va truy cap duoc variable greeting
    }
}

class Dog {
    static let color = "RED"
    var name: String = "Milo"
    
    func printInstanceProperty() {  // cach truy cap bien la mot property cua class Dog
        print(self.name)
    }
    
    func printStaticProperty() {
        print(Dog.color)    // cach de ta truy cap va su dung gia tri cua bien co su dung static Dog
    }
}

class Cat {
    func printLocalProperty() {
        let name = "Sue"    // name chi duoc khai bao trong than ham, cac thuoc tinh hoac ham tham chi class khac cung khong thay duoc property nay vi duoc khai bao local trong than ham
        print(name)
    }
}
