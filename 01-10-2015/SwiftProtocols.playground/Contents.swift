//: Protocol-Oriented Programming was introduced by Apple at the WWDC 2015 conference and is portrayed as the new go-to paradigm of iOS / OSX development.
//: For full details and examples be sure to watch https://developer.apple.com/videos/wwdc/2015/?id=408


//: Why Not Base Classes?
//: - Because types can conform to more than one protocol, they can be decorated with default behaviors from multiple protocols. Unlike multiple inheritance of classes which some programming languages support, protocol extensions do not introduce any additional state.
//: - Protocols can be adopted by classes, structs and enums. Base classes and inheritance are restricted to class types.

import Foundation

protocol Car: BooleanType {
  var name: String { get }
  var isEco: Bool { get }
}

//: `BooleanType` is a Swift Standard Library protocol that is conformed to by any type that wants to behave as a boolean. In other words, it can be resolved to a Bool type and can be used implicitly in an `if` statement.
//: In this extension, `BooleanType` is given default behavior for any `Car`, and returns the value of `isEco`.

extension BooleanType where Self: Car {
  var boolValue: Bool {
    return self.isEco
  }
}

//: By extending the Car protocol with an "Eco" constraint we can add a default behaviour so that all Eco types do not need to implement the isEco property.

extension Car where Self: Eco {
  var isEco: Bool { return true }
}

//: We could create an abstract class Eco and inherit after it but it involves many limitations, reduces flexibility, increases the amount of redundant code and btw who needs a function of a superclass which only implementation is a fatalError() to indicate the need to be overriden?

protocol Eco {
  var carbonEmission: Double { get }
}

struct Tesla: Car, Eco {
  let name: String
  let batteryCapacity: Double

  var carbonEmission: Double {
    return 0
  }
}

struct FordF150: Car {
  let name: String
  let isEco = false
}

struct FordMondeo: Car, Eco {
  var name: String
  let version: Double

  var carbonEmission: Double { return 1337 }
}

enum BMW: Car, Eco {
  case i3
  case i8

  var name: String {
    switch self {
    case .i3:
      return "ugly"
    case .i8:
      return "cool"
    }
  }

  var carbonEmission: Double {
    switch self {
    case .i3:
      return 0.0
    case .i8:
      return 49.0
    }
  }
}


if BMW.i3 {
    // is eco
} else {
    
}


//: A little example of how Apple leveraged new protocol possibilities in Swift's stdlib.

//: Swift 1.2
extension Array : _ArrayType {
    /// Return an `Array` containing the results of calling
    /// `transform(x)` on each element `x` of `self`
    func map<U>(transform: (T) -> U) -> [U]
}

extension Range {
    /// Return an array containing the results of calling
    /// `transform(x)` on each element `x` of `self`.
    func map<U>(transform: (T) -> U) -> [U]
}

//: Swift 2.0
extension CollectionType {
    /// Return an `Array` containing the results of mapping `transform`
    /// over `self`.
    ///
    /// - Complexity: O(N).
    func map<T>(@noescape transform: (Self.Generator.Element) -> T) -> [T]
}

//: other sources of knowledge on POP in Swift:
//: - https://developer.apple.com/videos/wwdc/2015/?id=408
//: - http://www.raywenderlich.com/109156/introducing-protocol-oriented-programming-in-swift-2
//: - http://matthewpalmer.net/blog/2015/08/30/protocol-oriented-programming-in-the-real-world
//: - https://medium.com/the-traveled-ios-developers-guide/protocol-oriented-programming-9e1641946b5c
