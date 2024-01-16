//: [Previous](@previous)

import Foundation


class Dog {
    func bark() { }
    
    func bark(_ loudly: Bool) {
        print("Bark loudly")
    }
    
    func test() {
        let _ = {
            self.bark(_:) // o day bat buoc them self de tao tam chieu ra method cua instance, vi day la scope trong 1 closure khac
        }
    }
}

let dog = Dog()
dog.test()

func printMessage() {
    print("Hello, World!")
}

let messageFunction = printMessage // tao ra mot tham chieu den ham printMessage()
messageFunction()   // goi tham chieu messageFunction la ta da co kieu la mot closure/function/method, ngoai ra ta se giu dia chi ma ham do duoc cap phat tren memory

// Another instance
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let additionFunction = add

print(additionFunction(2,3))    // tao ra bien tham chieu den ham add chinh la dong thoi ta cung dang tao ra mot bien co kieu du lieu la 1 closure/function, giu dia chi cua ham add
                                // viec su dung la goij ten bien additionFunction luc nay cung co kieu la add nen ta se truyen tham so vao pheu cua ham la 2 va 3 va return ra ket qua

// Ngoai ra ta con co the su dung tham chieu ham trong call back nhu sau
// Ham fetchData thuc hien mot tham so truyen vao la mot closure cung chinh la 1 ham nao do
func fetchData(completion: @escaping (Data) -> ()) {
    let data = Data()
    completion(data)
}

// ham processData o day dang nhan tham so la mot kieu du lieu Data
func processData(data: Data) {
    print(data)
}

fetchData(completion: processData)  // de gia thich cu the thi o ham fetchData se dong thoi tao tham chieu den ham processData, ngon ngu Swift se tu ngam dinh hieu la tham so
                                    // processData(data: Data) chinh la tham so truyen vao cua closure (Data) -> () ne khi ta truyen vao thi completion chinh la name cua closure se duoc thuc thi trong than ham {}

// Thuc ra o day ta co 2 cach viet, mot la su dung tham chieu ham nhu tren, hai la ta co the su dung voi closure truc tiep nhu sau

fetchData { data in // su dung closure truc tiep capture bien trong than ham fetchData va truyen ra de su dung trong than closure va truyen nhu doi so vao ham processData(data: Data)
    processData(data: data) // ham processData nhan doi so tu closure cua closure trong pheu cua fetchData
}
