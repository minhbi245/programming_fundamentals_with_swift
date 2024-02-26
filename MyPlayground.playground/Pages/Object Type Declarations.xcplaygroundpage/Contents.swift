//: [Previous](@previous)

import Foundation

// MARK: - Created the Object Type

// We could create an Object Type Dog with multiple initializers like this
class Dog {
    var name = ""
    var license = 0
    
    init() {}   // init is a function but it's not keyword func to declare a function, we use keywords init to declare a intialize
    
    init(name: String) {
        self.name = name
    }
    
    init(license: Int) {
        self.license = license
    }
    
    init(name: String, license: Int) {
        self.name = name
        self.license = license
    }
}

// But we don't need to declare 4 initilize, cause the initializers like the function,
// so the paramertes in the () could have a default value, so we could write short hand like this

class AnotherDog {
    var name: String    // No default value!
    var license: Int    // No default value!
    
    /*
        Các thuộc tính có trong một Object Type trong Swift phải được khai báo cùng với sự khởi tạo hoặc có giá trị
        Nếu không thì bạn sẽ bị trình biên dịch báo lỗi
     */
    
    init(name: String = "", license: Int = 0) {
        self.name = name
        self.license = license
    }
}

// MARK: - Create a instance
// In Swift if we want create a instance we should have a init func call, it will create by short call Dog(). () is a initilizer be called
let fido = Dog(name: "Fido", license: 2345) // we could use the initializers we have in the class Dog to create a instance of the classify Dog
let rover = Dog(name: "Rover")
let puff = Dog()    // that a initialize but doesn't have a parameters there, if we didn't create the multiple initializers in the class Dog
                    // the swift compiler will be implicit create this init function

/*
 class HomeDog {
 var name: String
 var license: Int
 
 init(name: String = "") {
 self.name = name    // Complier will be annouced to you the error didn't initilized for stored property licesnse
 }
 }
 */

class OtherDog {
    let name: String
    let license: Int
    
    // Code ở đây thật ra cũng hợp lệ, do việc các property trong Object Type sẽ được khởi tạo khi hàm init được gọi và khởi tạo giá trị cho các property
    // Sau đó việc này sẽ đảm bảo là các property của Object Type này không thể bị thay đổi do được khai báo bằng let, property là biến constant
    
    init(name: String, license: Int) {
        self.name = name
        self.license = license
    }
}

let spot = OtherDog(name: "Spot", license: 1357)
//spot.name = "Fido" // Couldn't change the value of this property cause it has been declared with let, that's a constant

// MARK: - Referring to self
struct Cat {
    var name: String
    var license: Int
    
    init(name: String, license: Int) {
        self.name = name
        // meow()  // nếu ta gọi hàm meow() ở đây trong khi các property chưa được khởi tạo xong thì sẽ bị compiler báo lỗi
        self.license = license
        meow()  // Khai báo như thế này thì lại legal/hợp lệ, compiler không báo lại lỗi nữa
    }
    
    func meow() {
        print("meow")
    }
}

// MARK: - Delegation Initialzers

class MyCat {
    var name: String
    var license: Int
    var age: Int
    
    init(name: String, license: Int = 0, age: Int = 0) {
        self.name = name
        self.license = license
        self.age = age
    }
    
    convenience init(name: String) { // this is a delegating initializer
        self.init(name: "Tom")
    }
    
    convenience init(name: String, license: Int) { // this í a delegating initializers too
        self.init(name: name, license: license)
    }
    
    convenience init(name: String, age: Int) {
        self.init(name: name, age: age)
    }
    
}

struct Digit {
    var number: Int
    var meaningOfLife: Bool
    
    init(number: Int) {
        self.number = number
        self.meaningOfLife = false
    }
    
    init() { // this is a delegating initializer
        self.init(number: 42)
        self.meaningOfLife = true   // Legal
    }
}

let digit1 = Digit()
let digit2 = Digit(number: 25)
print(digit1.number)
print(digit2.number)

// MARK: - Failable Initializers
class BigDog {
    let name: String
    
    init?(name: String) {   // Chúng ta có thể sử dụng Optional ở đây để kiểm tra việc khởi tạo sẽ đôi khi bị thất bại
        if name.isEmpty {
            return nil  // được quyền trả về một nil
        }
        self.name = name
    }
}
