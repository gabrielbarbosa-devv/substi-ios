import SubstiDomain
import Foundation

struct ProductComparisonViewModel {
    struct Item {
        let name: String
        let brand: String
        let category: String
        let quantity: String
        let price: String
    }

    struct Row: Identifiable {
        let title: String
        let originalValue: String
        let substituteValue: String

        var id: String { title }
    }

    let original: Item
    let substitute: Item
    let rows: [Row]

    init(originalProduct: Product, originalPrice: Decimal?, substituteProduct: Product) {
        let priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .currency
        priceFormatter.locale = Locale(identifier: "pt_BR")
        priceFormatter.currencyCode = "BRL"

        func formattedPrice(_ price: Decimal?) -> String {
            guard let price else { return "Não informado" }
            return priceFormatter.string(from: price as NSDecimalNumber) ?? "Não informado"
        }

        func displayCategory(_ category: String?) -> String {
            guard let category else { return "Não informado" }
            switch category {
            case "en:dairies": return "Laticínios"
            case "en:fruits": return "Frutas"
            case "en:eggs": return "Ovos"
            default: return category
            }
        }

        let original = Item(
            name: originalProduct.name,
            brand: originalProduct.brand ?? "Não informado",
            category: displayCategory(originalProduct.category),
            quantity: originalProduct.quantity ?? "Não informado",
            price: formattedPrice(originalPrice)
        )
        let substitute = Item(
            name: substituteProduct.name,
            brand: substituteProduct.brand ?? "Não informado",
            category: displayCategory(substituteProduct.category),
            quantity: substituteProduct.quantity ?? "Não informado",
            price: "Não informado"
        )

        self.original = original
        self.substitute = substitute
        rows = [
            Row(title: "Categoria", originalValue: original.category, substituteValue: substitute.category),
            Row(title: "Quantidade", originalValue: original.quantity, substituteValue: substitute.quantity),
            Row(title: "Marca", originalValue: original.brand, substituteValue: substitute.brand),
            Row(title: "Preço", originalValue: original.price, substituteValue: substitute.price)
        ]
    }
}
