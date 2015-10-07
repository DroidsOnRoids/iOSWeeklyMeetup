import Foundation
//: Protocols

//
//
// Requirements & Properties
//
//

protocol Enumerable {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSetable: Int { get }
    static var typeProperty: Int { get }
}

struct LeConstant: Enumerable {
    var mustBeSettable: Int
    var doesNotNeedToBeSetable: Int
    static var typeProperty: Int {
        return 7
    }
}

let constantin = LeConstant(mustBeSettable: 1, doesNotNeedToBeSetable: 0)
LeConstant.typeProperty


//
//
// Method requirements
//
//

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("My random number: \(generator.random())")


//
//
// Mutating method requirements
//
//

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case On, Off
    mutating func toggle() {
        switch self {
        case On: // Looks like you don't need to specify dot before enum case
            self = Off
        case .Off:
            self = On
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()


//
//
// Init requirements
//
//

protocol Buildable {
    init(buildFailurePercentage: Int)
}

class Xcode: Buildable {
    required init(buildFailurePercentage: Int) {
        // Hue
    }
}


//
//
// Protocol conformance with Extension
//
//

protocol TextRepresentable {
    func asText() -> String
}

extension Xcode: TextRepresentable {
    func asText() -> String {
        return "Xcode - My favourite IDE 😇"
    }
}

let mysteriousIDE = Xcode(buildFailurePercentage: 10)
mysteriousIDE.asText()


//
//
// Collection of Protocol Types
//
//

let buildables: [TextRepresentable] = [mysteriousIDE, Xcode(buildFailurePercentage: 0)]
for buildable in buildables {
    print(buildable.asText())
}


//
//
// Class-only Protocols
//
//

protocol classOnlyProtocol: class {
    // class only definition
}


//
//
// Protocol Composition
//
//

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let antoni = Person(name: "Antoni", age: 7)
wishHappyBirthday(antoni)


//
//
// Protocol Conformance
//
//

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
//    if object is HasArea {
//        print("I'm conforming to HasArea protocol!!!!! WOOOOO!!!")
//    }
    
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("I'm a bad, bad object without area!")
    }
}


//
//
// Protocol Conformance
//
//

@objc protocol CounterDataSource {
    optional func incrementalForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}


//// With NSObject
//@objc class ThreeSource: NSObject, CounterDataSource {
//    let fixedIncrement = 3
//}

// Without subclassing NSObject
class ThreeSource: CounterDataSource {
    @objc let fixedIncrement = 3
}


//
//
// Constraints in Protocol Extensions
//
//

extension CollectionType where Generator.Element: TextRepresentable {
    func asList() -> String {
        return "(" + map({$0.asText()}).joinWithSeparator(", ") + ")"
    }
}

let buildables2 = [Xcode(buildFailurePercentage: 1), Xcode(buildFailurePercentage: 2)]

print(buildables2.asList())

