import SubstiDomain
import Foundation

enum ProductMappingError: Error {
    case productNotFound
    case missingCode
    case missingName
}

struct OpenFoodFactsProductMapper: Sendable {
    func map(_ response: OpenFoodFactsProductResponseDTO) throws -> Product {
        guard let product = response.product else {
            throw ProductMappingError.productNotFound
        }

        guard
            let code = product.code?.trimmingCharacters(in: .whitespacesAndNewlines),
            !code.isEmpty
        else {
            throw ProductMappingError.missingCode
        }

        guard
            let name = product.productName?.trimmingCharacters(in: .whitespacesAndNewlines),
            !name.isEmpty
        else {
            throw ProductMappingError.missingName
        }

        return Product(
            id: ProductID(rawValue: code),
            name: name,
            category: product.categoriesTags?.first,
            brand: nonEmpty(product.brands),
            quantity: nonEmpty(product.quantity),
            imageURL: validImageURL(product.selectedImages?.preferredFrontURL)
        )
    }

    private func nonEmpty(_ value: String?) -> String? {
        guard let value = value?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }
        return value
    }

    private func validImageURL(_ value: String?) -> URL? {
        guard
            let value,
            let url = URL(string: value),
            url.scheme?.lowercased() == "https"
        else {
            return nil
        }
        return url
    }
}
