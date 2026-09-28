enum ProductImagePlaceholder {
    static func symbolName(for category: String?) -> String {
        let category = category?.lowercased() ?? ""

        if category.contains("dair") || category.contains("milk") {
            return "drop.fill"
        }
        if category.contains("fruit") || category.contains("vegetable") {
            return "leaf.fill"
        }
        return "fork.knife"
    }
}
