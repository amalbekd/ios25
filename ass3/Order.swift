struct Order {
    // TODO: Add properties (all should be 'let')
    // - orderId: String (generate UUID)
    // - items: [CartItem] (copy from cart)
    // - subtotal: Double
    // - discountAmount: Double
    // - total: Double
    // - timestamp: Date
    // - shippingAddress: Address
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    // TODO: Implement initializer
    init(from cart: ShoppingCart, shippingAddress: Address) {
        // Create immutable snapshot of cart
        // Generate unique orderId
        // Set timestamp to now
        // Copy all values from cart
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    // TODO: Add computed property
    var itemCount: Int {
        // Total number of items in order
        items.reduce(0) { $0 + $1.quantity }
    }
}
