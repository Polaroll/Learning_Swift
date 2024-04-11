//
//  account.swift
//  Bank-Account
//
//  Created by Ethan Houser on 4/9/24.
//

import Foundation

class Account {
    static var nextID = 1
    private let id: Int
    private var name: String
    private var balance: Double = 0
    
    
    init(name: String, balance: Double = 0) {
        self.id = Account.nextID
        Account.nextID += 1
        self.name = name
        self.balance = balance
    }
    
    
    // Getters
    func getName() -> String {
        return name
    }
    func getBalance() -> Double {
        return balance
    }
    func getID() -> Int {
        return id
    }
    
    
    // Setters
    func setName(name: String) {
        self.name = name
    }
    func setBalance(balance: Double) {
        self.balance = balance
    }
    
    func deposit() {
        /* Prompts for and adds an amount to the balance */
        
        // Prompts for input
        print("Amount to deposit: ", terminator: "")
        fflush(stdout)
        
        // Reads input
        if let amount = readLine() {
            // Converts input to type double from type string
            let num = Double(amount) ?? 0
            // Adds num to balance if greater than 0
            if num > 0 {
                balance += num
            } else {
                print("Invalid amount")
            }
            
        // If nothing is entered, returns this
        } else {
            print("Invalid Input")
        }
    }
    
    func withdraw() -> Double {
        /* Prompts for and removes an amount to the balance */
        
        // Prompts for input
        print("Amount to Withdraw: ", terminator: "")
        fflush(stdout)
        
        // Reads input
        if let amount = readLine() {
            // Converts input to type double from type string
            let num = Double(amount) ?? 0
            // Removes num from balance if less than 0 and less than balance
            if num > 0 && num < balance {
                balance -= num
                return num
            } else {
                print("Invalid amount")
                return 0
            }
            
        // If nothing is entered, returns this
        } else {
            print("Invalid Input")
            return 0
        }
    }
    
    func display() {
        /* Prints the accounts information in a friendly way */
        print("Name: \(name)")
        print("ID: \(id)")
        print("Balance: \(balance)\n")
    }
}
