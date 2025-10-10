class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    
    // Add method to place order
    func placeOrder(_ order: Order) {
        // Add order to history
        orderHistory.append(order)
    }
    
    // Computed property for total spent
    var totalSpent: Double {
        // Sum all order totals
        orderHistory.reduce(0) { $0 + $1.total }
    }
}
