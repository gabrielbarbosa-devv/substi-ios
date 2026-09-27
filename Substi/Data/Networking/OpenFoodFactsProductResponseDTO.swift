import Foundation

struct OpenFoodFactsProductResponseDTO: Decodable {
    let product: ProductDTO

    struct ProductDTO: Decodable {
        let code: String?
        let productName: String?
        let categoriesTags: [String]?
        let brands: String?
        let quantity: String?

        private enum CodingKeys: String, CodingKey {
            case code
            case productName = "product_name"
            case categoriesTags = "categories_tags"
            case brands
            case quantity
        }
    }
}
