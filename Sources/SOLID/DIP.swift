//
//  DIP.swift
//
//
//  Created by alphacircle on 10/14/24.
//
//  Dependency Inversion Principle
//  고수준 모듈은 저수준 모듈에 의존해서는 안 된다.

import Foundation

// WORST CASE

public class Fan {
    func spin() {
        print("Fan is spinning")
    }
    
    func stop() {
        print("Fan is stopping")
    }
}

public class Switch {
    private let fan: Fan
    
    init(fan: Fan) {
        self.fan = fan
    }
    
    // PROBLEM: Fan(저수준)에 의존적;
    // Fan이 변경되면 Switch 불가피하게 수정될 수 있음.
    // Fan 이외의 class 들을 사용하기 어려울 수 있음.
    func turnOn() {
        fan.spin()
    }
    
    func turnOff() {
        fan.stop()
    }
}

// -----------------------------------------

public protocol Switchable {
    func turnOn()
    func turnOff()
}

public class _Fan: Switchable {
    public func turnOn() {
        print("_fan is spinning")
    }
    
    public func turnOff() {
        print("_fan is stopping")
    }
}

// 인터페이스에 해당하는 어느 클래스들과도 소통이 가능함.
public class NewSwitch {
    private let device: Switchable
    
    init(device: Switchable) {
        self.device = device
    }
    
    func turnOn() {
        device.turnOn()
    }
    
    func turnOff() {
        device.turnOff()
    }
}
