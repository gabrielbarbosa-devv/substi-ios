import Foundation

enum ProductMappingError: Error {
    case missingCode
    case missingName
}

struct OpenFoodFactsProductMapper {
    func map(_ response: OpenFoodFactsProductResponseDTO) throws -> Product {
        guard
            let code = response.product.code?.trimmingCharacters(in: .whitespacesAndNewlines),
            !code.isEmpty
        else {
            throw ProductMappingError.missingCode
        }

        guard
            let name = response.product.productName?.trimmingCharacters(in: .whitespacesAndNewlines),
            !name.isEmpty
        else {
            throw ProductMappingError.missingName
        }

        return Product(
            id: ProductID(rawValue: code),
            name: name,
            category: response.product.categoriesTags?.first,
            brand: nonEmpty(response.product.brands),
            quantity: nonEmpty(response.product.quantity)
        )
    }

    private func nonEmpty(_ value: String?) -> String? {
        guard let value = value?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }
        return value
    }
}
