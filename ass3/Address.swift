struct Address {
    // TODO: Add properties
    // - street: String
    // - city: String
    // - zipCode: String
    // - country: String
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    // TODO: Add computed property for formatted address
    var formattedAddress: String {
        // Return multi-line formatted address
        "\(street)\n\(city), \(zipCode)\n\(country)"
    }
}
