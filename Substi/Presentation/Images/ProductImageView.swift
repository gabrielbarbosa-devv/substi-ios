import SwiftUI
import UIKit

@MainActor
struct ProductImageView: View {
    let imageURL: URL?
    let fallbackSymbolName: String
    let imageLoader: ProductImageLoader

    @State private var loadedImage: UIImage?

    var body: some View {
        Group {
            if let loadedImage {
                Image(uiImage: loadedImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: fallbackSymbolName)
                    .font(.system(size: 38, weight: .regular))
                    .foregroundStyle(Color(uiColor: DSColor.brandPrimary))
            }
        }
        .task(id: imageURL) {
            loadedImage = nil
            guard let imageURL else { return }
            loadedImage = await imageLoader.image(for: imageURL)
        }
        .accessibilityHidden(true)
    }
}
