//
//  User.swift
//  SwiftBank
//
//  Created by 劉瑞元 on 2022/4/11.
//

import Foundation

class User {
    var username: String!
    var password: String!
    var name: String!
    var savings: Double = 0.0
    
    init?(username: String, password: String, name: String) {
        if username.isEmpty || password.isEmpty || name.isEmpty {
            return nil
        }
        
        self.username = username
        self.password = password
        self.name = name
    }
    
    func deposit(amount: Double) {
        savings += amount
    }
    
    func withdraw(amount: Double) -> Bool {
        let actualAmount = savings - amount
        if actualAmount <= 0.0 {
            return false
        }
        
        savings -= max(0.0, amount)
        return true
    }
    
    func outputDetails() {
        print("username: \(username!)")
        print("name: \(name!)")
        print("savings: \(savings)")
    }
}
