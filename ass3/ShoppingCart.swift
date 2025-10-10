class ShoppingCart {
    // TODO: Add properties
    // - items: [CartItem] (private set, public get)
    // - discountCode: String? (optional)
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    // TODO: Implement initializer
    init() {
        // Initialize empty cart
    }
    
    // TODO: Add item to cart
    func addItem(product: Product, quantity: Int = 1) {
        // Check if product already exists in cart
        // If yes: update quantity
        // If no: add new CartItem
        guard quantity > 0 else { return }
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        } else {
            var newItem = CartItem(product: product, quantity: 1)
            newItem.updateQuantity(quantity)
            items.append(newItem)
        }
    }
    
    // TODO: Remove item from cart
    func removeItem(productId: String) {
        // Remove CartItem with matching product.id
        items.removeAll { $0.product.id == productId }
    }
    
    // TODO: Update item quantity
    func updateItemQuantity(productId: String, quantity: Int) {
        // Find item and update quantity
        // If quantity is 0, remove item
        if quantity == 0 {
            removeItem(productId: productId)
            return
        }
        guard quantity > 0 else { return }
        guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
        items[index].updateQuantity(quantity)
    }
    
    // TODO: Clear all items
    func clearCart() {
        // Remove all items
        items.removeAll()
    }
    
    // TODO: Computed property for subtotal
    var subtotal: Double {
        // Sum all item subtotals
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    // TODO: Computed property for discount amount
    var discountAmount: Double {
        // Calculate discount based on discountCode
        // Example: "SAVE10" = 10% off, "SAVE20" = 20% off
        guard let code = discountCode?.lowercased() else { return 0 }
        let percent: Double
        switch code {
            case "save10": percent = 0.10
            case "save20": percent = 0.20
            default: percent = 0.0
        }
        return subtotal * percent
    }
    
    // TODO: Computed property for total
    var total: Double {
        // subtotal - discountAmount
        max(0, subtotal - discountAmount)
    }
    
    // TODO: Computed property for item count
    var itemCount: Int {
        // Total number of individual items (sum of quantities)
        items.reduce(0) { $0 + $1.quantity }
    }
    
    // TODO: Check if cart is empty
    var isEmpty: Bool {
        // Return true if no items
        items.isEmpty
    }
}
