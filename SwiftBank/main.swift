//
//  main.swift
//  SwiftBank
//
//  Created by 劉瑞元 on 2022/4/8.
//

import Foundation

//MARK: Properties
// 因為 User 的 initializer 是 Optional Initializer。這邊用 ! 來
// 強轉他不可能是 nil
var users: [User] = [
    User(username: "john", password: "abcd", name: "John")!,
    User(username: "david", password: "dcba", name: "David")!,
    User(username: "lisa", password: "aaaa", name: "Lisa")!,
]
var currentUser: User?

//MARK: Functions
func main() {
    repeat {
        Utils.cleanScreen()
        print("Welcome to Swift bank")
        print("1. Login")
        print("2. Signup")
        print("0. Exit")
        
        let userInput = Utils.readInput()
        let response = Int(userInput) ?? -1
        
        switch response {
        case 1:
            login()
        case 2:
            signUp()
        case 0:
            return
        default:
            continue
        }
    } while true
}

func login() {
    Utils.cleanScreen()
    
    print(">>>>>>>> Login")
    let username = Utils.readInput(prompt: "Username: ")
    let password = Utils.readInput(prompt: "Password: ")
    
    var foundUser = false
    for user in users {
        if user.username == username && user.password == password {
            foundUser = true
            currentUser = user
        }
    }
    
    if !foundUser {
        print("Invalid Credential.")
        return
    }
    
    print("Access Granted")
    Utils.pause()
    
    enterUserMenu()
}

func enterUserMenu() {
    repeat {
        Utils.cleanScreen()
        print(">>>>>>>> User Menu")
        print("1. View Account")
        print("2. Deposit Amount")
        print("3. Withdraw Amount")
        print("0. Signout")
        
        let userInput = Utils.readInput()
        let response = Int(userInput) ?? -1
        
        switch response {
        case 0:
            currentUser = nil
            return
        case 1:
            viewAccount()
        case 2:
            depositMoney()
        case 3:
            withdrawMoney()
        default:
            continue
        }
    } while true
}

//MARK: UserActions
func viewAccount() {
    guard
        let currentUser = currentUser else {
        fatalError("Current User is nil")
    }
    
    currentUser.outputDetails()
    Utils.pause()
}

func depositMoney() {
    guard
        let currentUser = currentUser else {
        fatalError("Current User is nil")
    }
    
    let amountString = Utils.readInput(prompt: "Deposit Amount:")
    guard let amount = Double(amountString), amount > 0
    else {
        print("Input amount is invalid")
        return
    }
    
    currentUser.deposit(amount: amount)
    print("\(amount) deposited successfully.")
    Utils.pause()
}
    
func withdrawMoney() {
    guard
        let currentUser = currentUser else {
        fatalError("Current User is nil")
    }
    
    let amountString = Utils.readInput(prompt: "Withdraw Amount:")
    guard let amount = Double(amountString), amount > 0
    else {
        print("Input amount is invalid")
        return
    }
    
    let isSuccessful = currentUser.withdraw(amount: amount)
    if isSuccessful {
        print("\(amount) withdrawed successfully.")
    } else {
        print("Withdraw money failed.")
    }
    Utils.pause()
}

func signUp() {
    Utils.cleanScreen()
    
    print(">>>>>>>> Signin")
    let username = Utils.readInput(prompt: "Username: ")
    let password = Utils.readInput(prompt: "Password: ")
    let name = Utils.readInput(prompt: "Name: ")
    
    users.append(User(username: username, password: password, name: name)!)
    print("Signup Successful")
//    Utils.pause()
    enterUserMenu()
}

main()
