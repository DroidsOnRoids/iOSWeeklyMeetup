//: Extensions

//
//
// Properties & Inits
//
//

extension Double {
    // Adding computed properties
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    
    // Define new initializers
    init(m: Double) {
        self.init(m)
    }
}

Double(1.0)
Double(m: 1.0)


//
//
// Instance methods
//
//

extension Int {
    // Instance methods
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

5.repetitions { print("OK") }
4.repetitions({ print("OK2") })


//
//
// Mutating instance methods
//
//

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()


//
//
// Subscripts
//
//

extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        
        return (self / decimalBase) % 10
    }
}


//
//
// Nested types
//
//

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ")
        case .Zero:
            print("0 ")
        case .Positive:
            print("+ ")
        }
    }
}

printIntegerKinds([1, -5, 0, 7])
