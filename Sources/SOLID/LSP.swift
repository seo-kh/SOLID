//
//  LSP.swift
//
//
//  Created by alphacircle on 10/14/24.
//
//  Liskov Substitution Principle
//  자식 클래스는 언제나 부모 클래스를 대체할 수 있어야 한다.
//

import Foundation

// WORST CASE

// Parent class Bird
public class Bird {
    public func fly() {
        print("Bird is flying")
    }
}

// Child class Penguin that violates LSP
public class Penguin: Bird {
    @available(*, deprecated, message: "Penguin cannot fly")
    public override func fly() {
        // Penguin cannot fly
    }
}

public class LSPMain {
    public static func main(args: [String]) {
        let bird = Bird()
        bird.fly()
        
        let penguin: Bird = Penguin()
        penguin.fly() // not available
    }
}

// -----------------------------------------

// BEST CASE

public protocol Flyable {
    func fly()
}

// Base class Bird
public class _Bird {
    public func eat() {
        print("Bird is eating")
    }
}

// Class for a bird that can fly
public class Sparrow: _Bird, Flyable {
    public func fly() {
        print("sparrow is flying")
    }
}

// Class for a bird that cannot fly
public class _Penguin: _Bird {
    // Penguins do not implement Flyable
}
