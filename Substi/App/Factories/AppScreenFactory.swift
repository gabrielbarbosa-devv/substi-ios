import SubstiDomain
import SwiftUI
import UIKit

/// Builds feature screens and injects the dependencies they need.
/// Navigation decisions remain with AppCoordinator.
@MainActor
final class AppScreenFactory {
    private let inventoryRepository: any InventoryRepository
    private let loadCandidatesUseCase: LoadSubstitutionCandidatesUseCase
    private let imageLoader: ProductImageLoader
    private let confirmSubstitutionUseCase: ConfirmSubstitutionUseCase

    init(
        inventoryRepository: any InventoryRepository,
        loadCandidatesUseCase: LoadSubstitutionCandidatesUseCase,
        imageLoader: ProductImageLoader,
        confirmSubstitutionUseCase: ConfirmSubstitutionUseCase
    ) {
        self.inventoryRepository = inventoryRepository
        self.loadCandidatesUseCase = loadCandidatesUseCase
        self.imageLoader = imageLoader
        self.confirmSubstitutionUseCase = confirmSubstitutionUseCase
    }

    func makeLaunchViewController(onAnimationCompleted: @escaping () -> Void) -> LaunchViewController {
        let viewController = LaunchViewController()
        viewController.onAnimationCompleted = onAnimationCompleted
        return viewController
    }

    func makeOrderViewController(
        order: Order? = nil,
        onChooseSubstitute: @escaping (ProductID) -> Void
    ) -> OrderViewController {
        let viewModel = OrderViewModel(inventoryRepository: inventoryRepository, order: order)
        let viewController = OrderViewController(viewModel: viewModel)
        viewController.onChooseSubstitute = onChooseSubstitute
        return viewController
    }

    func makeSuggestionsViewController(
        for productID: ProductID,
        onShowComparison: @escaping (OrderItem, SubstitutionCandidate) -> Void
    ) -> SuggestionsViewController? {
        guard let viewModel = SuggestionsViewModel(
            productID: productID,
            inventoryRepository: inventoryRepository,
            loadCandidates: loadCandidatesUseCase
        ) else {
            return nil
        }

        let viewController = SuggestionsViewController(viewModel: viewModel, imageLoader: imageLoader)
        viewController.onShowComparison = { [originalItem = viewModel.originalOrderItem] candidate in
            onShowComparison(originalItem, candidate)
        }
        return viewController
    }

    func makeComparisonViewController(
        originalItem: OrderItem,
        candidate: SubstitutionCandidate,
        onChooseAnother: @escaping () -> Void,
        onConfirmSubstitute: @escaping (ProductID, SubstitutionCandidate, ProductComparisonViewModel) -> Void
    ) -> UIHostingController<ProductComparisonView> {
        let viewModel = ProductComparisonViewModel(
            originalProduct: originalItem.product,
            originalPrice: originalItem.price,
            substituteProduct: candidate.product
        )
        let view = ProductComparisonView(
            viewModel: viewModel,
            imageLoader: imageLoader,
            onChooseAnother: onChooseAnother,
            onConfirmSubstitute: {
                onConfirmSubstitute(originalItem.product.id, candidate, viewModel)
            }
        )
        return UIHostingController(rootView: view)
    }

    func makeConfirmationViewController(
        originalProductID: ProductID,
        candidate: SubstitutionCandidate,
        productViewModel: ProductComparisonViewModel,
        onConfirmed: @escaping (Order) -> Void,
        onCancel: @escaping () -> Void
    ) -> UIViewController {
        let viewModel = ConfirmationViewModel(
            originalProductID: originalProductID,
            candidate: candidate,
            confirmSubstitution: confirmSubstitutionUseCase
        )
        viewModel.onConfirmed = onConfirmed

        let view = ConfirmationView(
            productViewModel: productViewModel,
            viewModel: viewModel,
            imageLoader: imageLoader,
            onCancel: onCancel
        )
        let hostingController = UIHostingController(rootView: view)
        hostingController.modalPresentationStyle = .pageSheet
        if let sheet = hostingController.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = DSRadius.large
        }
        return hostingController
    }
}
