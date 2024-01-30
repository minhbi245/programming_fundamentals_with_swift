//: [Previous](@previous)

import Foundation

struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    var people: [Person] = []
    
    lazy var oldest: Person? = {
        print("Lazy varr oldest initialized")
        return people.max(by: {$0.age < $1.age})
    }()
    
    lazy var youngest: Person? = {
        print("That's will be initialized")
        return people.min(by: {$0.age < $1.age})
    }()
    
    init(people: [Person]) {
        self.people = people
        print("View model initialized")
    }
}

var viewModel = PeopleViewModel(people: [
    Person(name: "Antoine", age: 30),
    Person(name: "Jaap", age: 3),
    Person(name: "Lady", age: 3),
    Person(name: "Maaike", age: 27)
])

if let people = viewModel.oldest { // variable oldest has already accessed that's variable initialize
    print(people)
}
