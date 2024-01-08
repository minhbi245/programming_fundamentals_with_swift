//: [Previous](@previous)

import UIKit

func doSomething(_ closure: () -> Void) {
    closure()
}

var x = 10
doSomething {
    print("The value inside closure captured is: \(x)")    // variable x declared outsite the scope doSomething but still captured by closure
}

func imageOfSize(_ size: CGSize, _ whatToDraw: () -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    whatToDraw()
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndPDFContext()
    return result
}

// create variable get address/value object type UIImage return when call function imageOfSize()

let image = imageOfSize(CGSize(width: 45, height: 20)) {
    let p = UIBezierPath(roundedRect: CGRect(origin: CGPoint.zero, size: CGSize(width: 45, height: 20)), cornerRadius: 8)
    p.stroke()
}

// This not a good way to write code cause we call CGSize() as twice
// let declare a variable is a instance of CGSize
let sz = CGSize(width: 45, height: 20)
// then writting again and capture using sz out side the body of imageOfSize like below
let imageTwo = imageOfSize(sz) {
    let p = UIBezierPath(roundedRect: CGRect(origin: .zero, size: sz), cornerRadius: 8) // inside the body closure, we can capture/get address the object type allocate on the memory to there
    p.stroke()
}

// let's go further. We've been hard-coding the size of the desired rectangle, we can make it flexible we can but sz to the parameter of the function like below and using sz all of the body of function
func makeRoundedRectangle(_ sz: CGSize) -> UIImage {
    let image = imageOfSize(sz) {
        let p = UIBezierPath(roundedRect: CGRect(origin: .zero, size: sz), cornerRadius: 8)
        p.stroke()
    }
    
    return image // After calling imageOfSize to get agrument from parameter from function wrap imageOfSize is makeRoundedRectangle then get address of object type allocted on the memory
}

// Using code:
let iv: UIImageView = UIImageView()
iv.image = makeRoundedRectangle(CGSize(width: 45, height: 20)) // Code is beautiful and very Convenient for reuse
print(iv)

// Go furhter, Instead of returning an object UIImage, our function can return a function that makes rounded rectangles of the specified size.
func makeRoundedRectangleMaker(_ sz: CGSize) -> () -> UIImage {
    func f() -> UIImage {
        let image = imageOfSize(sz) {
            let p = UIBezierPath(roundedRect: CGRect(origin: .zero, size: sz), cornerRadius: 8)
            p.stroke()
        }
        return image
    }
    return f
}

// we can write shorter, we don't declare a function and name, just return using like anonymous function
func makeRoundedRectangleMakerV2(_ sz: CGSize) -> () -> UIImage {
    return {
        return imageOfSize(sz) {
            let p = UIBezierPath(roundedRect: CGRect(origin: .zero, size: sz), cornerRadius: 8)
            p.stroke()
        }
    }
}

// or we can shorter not using keyword return with imageOfSize
func makeRoundedRectangleMakerV3(_ sz: CGSize) -> () -> UIImage {
    return {
        imageOfSize(sz) {
            let p = UIBezierPath(roundedRect: CGRect(origin: .zero, size: sz), cornerRadius: 8)
            p.stroke()
        }
    }
}
