struct CartItem {
    // TODO: Add properties
    // - product: Product
    // - quantity: Int (must be positive)
    var product: Product
    private(set) var quantity: Int
    
    // TODO: Add computed property for subtotal
    var subtotal: Double {
        // Calculate: product.price * quantity
        product.price * Double(quantity)
    }
    
    // TODO: Add mutating method to update quantity
    mutating func updateQuantity(_ newQuantity: Int) {
        // Validate newQuantity > 0
        // Update quantity
        guard newQuantity > 0 else { return }
        quantity = newQuantity
    }
    
    // TODO: Add method to increase quantity
    mutating func increaseQuantity(by amount: Int) {
        // Add to existing quantity
        guard amount > 0 else { return }
        quantity += amount
    }
}
