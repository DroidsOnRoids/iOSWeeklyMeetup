//: Playground - noun: a place where people can play

import UIKit

/*
* Public access enables entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use public access when specifying the public interface to a framework.

* Internal access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.

* Private access restricts the use of an entity to its own defining source file. Use private access to hide the implementation details of a specific piece of functionality.
*/


public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

/*
SomeInternalClass and someInternalConstant can be written without an explicit access level modifier, and will still have an access level of internal
*/

//class SomeInternalClass {}            
//let someInternalConstant = 0

private class SomePrivateClass2 {
    var somePrivateProperty = 0          // implicitly private class member
    func somePrivateMethod() {}          // implicitly private class member
}

public class SomePublicClass2 {
    var somePrivateProperty = 0                  // implicitly internal class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class TestClass {
    var fff = 0
    private var sss = 0
}

/*
Enums
*/

public enum CompassPoint {
    case North
    case South
    case East
    case West
}

/*
Subclassing

You can subclass any class that can be accessed in the current access context. A subclass cannot have a higher access level than its superclass—for example, you cannot write a public subclass of an internal superclass.
*/

public class A {
    private func someMethod() {}
}

public class B: A {
//    override internal func someMethod() {}
    public override func someMethod() {
        
    }
}

