//
//  main.swift
//  Bank-Account
//
//  Created by Ethan Houser
//

import Foundation

// Initiates an array of accounts
var accounts: [Account] = []

// Initiates the menu loop
var menu = true
while menu {
    print("\nAccount Menu:")
    print("0. Quit Program")
    print("1. Display Accounts Information")
    print("2. Add New Account")
    print("3. Remove an Account")
    print("4. Deposit to an Account")
    print("5. Withdraw from an Account")
    print("6. Find Account by ID")
    print("")
    
    // Prompts for input
    print("Menu option: ", terminator: "")
    fflush(stdout)
    
    let choice = readLine()
    
    switch choice {
    case "0": // Quit
        menu = false
        
    case "1": // Display all accounts information
        for acc in accounts {
            acc.display()
        }
        
    case "2": // Add New Account
        // Prompts for name
        print("Name: ", terminator: "")
        fflush(stdout)
        var name: String
        if let optName = readLine() {
            name = optName
        } else {
            print("Invalid Name")
            break
        }
       
        // Prompts for balance
        print("Balance: ", terminator: "")
        fflush(stdout)
        var balance: Double
        if let sBalance = readLine() {
            balance = Double(sBalance) ?? 0
        } else {
            print("Invalid amount")
            break
        }
        
        // Creates new account and adds it to the list
        let account = Account(name: name, balance: balance)
        accounts.append(account)
        
    case "3": // Remove an Account
        print("Account ID: ", terminator: "")
        fflush(stdout)
        // If invalid input is given, id lookup value is assigned -1
        var id = -1
        if let lookUp = readLine() {
            id = Int(lookUp) ?? -1
        } else {
            print("Invalid input")
            break
        }
        
        // Finds the account and removes it based on the index
        for (i, acc) in accounts.enumerated() {
            if acc.getID() == id{
                print("Account to be Removed")
                acc.display()
                
                // Removes account at the given index
                accounts.remove(at: i)
            }
        }
        
    case "4": // Deposit to an account
        print("Account ID: ", terminator: "")
        fflush(stdout)
        // If invalid input is given, id lookup value is assigned -1
        var id: Int
        if let lookUp = readLine() {
            id = Int(lookUp) ?? -1
        } else {
            print("Invalid input")
            break
        }
        
        // Check if account with matching ID exist
        for acc in accounts {
            if acc.getID() == id{
                acc.deposit()
            }
        }
        
    case "5": // Withdraw from Account
        print("Account ID: ", terminator: "")
        fflush(stdout)
        // If invalid input is given, id lookup value is assigned -1
        var id: Int
        if let lookUp = readLine() {
            id = Int(lookUp) ?? -1
        } else {
            print("Invalid input")
            break
        }
        
        // Check if account with matching ID exist
        for acc in accounts {
            if acc.getID() == id{
                let withdrawal = acc.withdraw()
            }
        }
        
    case "6": // Find account by ID
        print("Account ID: ", terminator: "")
        fflush(stdout)
        // If invalid input is given, id lookup value is assigned -1
        var id = -1
        if let lookUp = readLine() {
            id = Int(lookUp) ?? -1
        } else {
            print("Invalid input")
            break
        }
        
        // Finds and displays the account with the matching id number
        for acc in accounts {
            if acc.getID() == id {
                acc.display()
            }
        }
        
    default:
        print("Invalid input")
    }
}

