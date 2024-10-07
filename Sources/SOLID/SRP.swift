//
//  SRP.swift
//  SOLID
//
//  Created by 서광현 on 10/7/24.
//  Single Responsibility Principle
//  객체가 대표하는 업무는 하나여야 한다.

import Foundation

/// Wortst Case ( Violating SRP )
///
/// 1. 클래스의 코드가 복잡해진다.
/// 2. 역할을 직관적으로 이해하기 어려워진다.
/// 3. 수정할 이유가 많아짐, 책임의 개수만큼 -> 하나의 수정된 코드가 다른 부분에 영향을 줄 수 있음
/// 4. 책임이 서로 얽혀있기 때문에 리팩토링이 어려워질 수 있음.
/// 5. 확장성과 유연성의 제약이 생김.
public class UserService {
    func saveUser(_ user: User) {
        print("User saved to database: \(user.getName())")
    }
    
    func sendWelcomEmail(_ user: User) {
        print("Welcome email sent to \(user.getEmail())")
    }
    
    func logUserActivity(_ user: User) {
        print("Logging activity for \(user.getName())")
    }
}

// ---------------------------------------------------------------------------

/// Best Case ( Conforming SRP )
///
/// 1. 각 클래스는 맡은 책임에 변경사항이 있을때만 수정을 진행하면 됨.
/// 2. 책임별로 클래스를 분리했기 때문에 재사용성이 좋음.

public class UserRepository {
    func saveUser(_ user: User) {
        print("User saved to database: \(user.getName())")
    }
}

public class EmailService {
    func sendWelcomEmail(_ user: User) {
        print("Welcome email sent to \(user.getEmail())")
    }
}

public class UserActivityLogger {
    func logUserActivity(_ user: User) {
        print("Logging activity for \(user.getName())")
    }
}

// --------------------------- Helper Class -----------------------------------

class User {
    private let name: String
    private let email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getEmail() -> String {
        return self.email
    }
}
