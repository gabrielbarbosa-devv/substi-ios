import Foundation

struct OpenFoodFactsProductResponseDTO: Decodable {
    let product: ProductDTO?

    struct ProductDTO: Decodable {
        let code: String?
        let productName: String?
        let categoriesTags: [String]?
        let brands: String?
        let quantity: String?
        let selectedImages: SelectedImagesDTO?

        private enum CodingKeys: String, CodingKey {
            case code
            case productName = "product_name"
            case categoriesTags = "categories_tags"
            case selectedImages = "selected_images"
            case brands
            case quantity
        }
    }

    struct SelectedImagesDTO: Decodable {
        let front: ImageVariantsDTO?

        var preferredFrontURL: String? {
            guard let front else { return nil }
            let variants = [front.display, front.small, front.thumb].compactMap { $0 }
            for language in ["pt", "en"] {
                for variant in variants {
                    if let localized = variant.first(where: { $0.key.lowercased().hasPrefix(language) })?.value {
                        return localized
                    }
                }
            }
            for variant in variants {
                if let fallback = variant.sorted(by: { $0.key < $1.key }).first?.value {
                    return fallback
                }
            }
            return nil
        }
    }

    struct ImageVariantsDTO: Decodable {
        let display: [String: String]?
        let small: [String: String]?
        let thumb: [String: String]?
    }
}
