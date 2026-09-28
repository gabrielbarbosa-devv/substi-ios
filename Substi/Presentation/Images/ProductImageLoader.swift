import UIKit

@MainActor
final class ProductImageLoader {
    private let loadImage: LoadProductImageUseCase
    private let imageCache = NSCache<NSURL, UIImage>()

    init(loadImage: LoadProductImageUseCase) {
        self.loadImage = loadImage
        imageCache.totalCostLimit = 16 * 1_024 * 1_024
    }

    func image(for url: URL) async -> UIImage? {
        let cacheKey = url as NSURL
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            return cachedImage
        }

        do {
            let data = try await loadImage.execute(for: url)
            guard !Task.isCancelled else { return nil }
            guard let image = UIImage(data: data) else {
                AppLog.images.error("Product image data could not be decoded")
                return nil
            }
            let decodedCost = image.cgImage.map { $0.bytesPerRow * $0.height } ?? data.count
            imageCache.setObject(image, forKey: cacheKey, cost: decodedCost)
            return image
        } catch {
            return nil
        }
    }
}
