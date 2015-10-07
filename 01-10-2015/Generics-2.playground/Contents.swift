//: Playground - noun: a place where people can play

import UIKit

/*
Generics
*/

var items = ["A", "B", "C"]
var numbers = [1, 2, 3, 4]

func flip<T>(array: [T]) -> [T] {
    var tempArray = [T]()
    
    for item in array.reverse() {
        tempArray.append(item)
    }
    
    return tempArray
}

flip(items)
flip(numbers)

class Flipper<T> {
    
    var elements: [T]
    
    init(elements: [T]) {
        self.elements = elements
    }
    
    func flip() -> [T] {
        var tempArray = [T]()
        
        for item in elements.reverse() {
            tempArray.append(item)
        }
        
        return tempArray
    }
}

var newFlipper = Flipper<String>(elements: items)
newFlipper.flip()

/*
Protokoły
*/

protocol TestProtocol {
    
}

class Flipper2<T:TestProtocol> {
    var elements: [T]
    
    init(elements: [T]) {
        self.elements = elements
    }
    
    func flip() -> [T] {
        var tempArray = [T]()
        
        for item in elements.reverse() {
            tempArray.append(item)
        }
        
        return tempArray
    }
}

class Test: TestProtocol {
    
}

let testA = Test()
let testB = Test()
let testC = Test()

let testArray = [testA, testB, testC]

var newFlipper2 = Flipper2<Test>(elements: testArray)
newFlipper2.flip()

