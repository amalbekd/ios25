struct Product {
    // TODO: Add properties
    // - id: String (unique identifier)
    // - name: String
    // - price: Double (must be positive)
    // - category: Category enum
    // - description: String
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    // TODO: Define Category enum
    enum Category {
        // Add cases: electronics, clothing, food, books
        case electronics
        case clothing
        case food
        case books
    }
    
    // TODO: Add computed property
    var displayPrice: String {
        // Format price as currency string (e.g., "$19.99")
        String(format: "$%.2f", price)
    }
    
    
    // TODO: Add initializer with validation
    // Ensure price is positive, throw error or use failable init
    init?(id: String, name: String, price: Double, category: Category, description: String) {
            guard price > 0 else { return nil }
            self.id = id
            self.name = name
            self.price = price
            self.category = category
            self.description = description
        }
    
}
