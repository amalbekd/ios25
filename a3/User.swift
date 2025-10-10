//
//  User.swift
//  
//
//  Created by Dimash Amalbek on 11.10.2025.
//


class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    // Add method to place order
    func placeOrder(_ order: Order) {
        // Add order to history
    }
    
    // Computed property for total spent
    var totalSpent: Double {
        // Sum all order totals
    }
}