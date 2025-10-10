//
//  Order.swift
//  
//
//  Created by Dimash Amalbek on 11.10.2025.
//


struct Order {
    // TODO: Add properties (all should be 'let')
    // - orderId: String (generate UUID)
    // - items: [CartItem] (copy from cart)
    // - subtotal: Double
    // - discountAmount: Double
    // - total: Double
    // - timestamp: Date
    // - shippingAddress: Address
    
    // TODO: Implement initializer
    init(from cart: ShoppingCart, shippingAddress: Address) {
        // Create immutable snapshot of cart
        // Generate unique orderId
        // Set timestamp to now
        // Copy all values from cart
    }
    
    // TODO: Add computed property
    var itemCount: Int {
        // Total number of items in order
    }
}