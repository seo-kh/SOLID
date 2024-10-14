//
//  ISP.swift
//
//
//  Created by alphacircle on 10/14/24.
//
//  Interface Segregation Principle
//  인터페이스 분리 원칙
//
//  클래스는 자신이 사용하지 않을 메소드를 구현받지 말아야 한다.
//
//  인터페이스도 책임에 따라 분리되어야 한다.

import Foundation

// WORST CASE

public protocol Worker {
    func work()
    func eat()
}

// Pass
public class Emplyee: Worker {
    public func work() {
        print("Employee is working")
    }
    
    public func eat() {
        print("Employee is eating")
    }
}

// Fail
public class Robot: Worker {
    public func work() {
        print("Robot is working")
    }
    
    // Robot case doesn't fit this method.
    public func eat() {
        fatalError("Robots do not eat")
    }
}

// ---------------------------------------

// BEST CASE

public protocol Workable {
    func work()
}

public protocol Eatable {
    func eat()
}

public class _Emplyee: Workable, Eatable {
    public func work() {
        
    }
    
    public func eat() {
        
    }
}

public class _Robot: Workable {
    public func work() {
        
    }
}
