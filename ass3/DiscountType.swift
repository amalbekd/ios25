enum DiscountType {
    case percentage(Double)  // 10% off
    case fixedAmount(Double) // $5 off
    case buyXGetY(buy: Int, get: Int) // Buy 2 Get 1 Free
}
