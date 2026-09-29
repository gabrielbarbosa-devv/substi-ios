import SubstiDomain
import SwiftUI
import Testing
import UIKit
@testable import Substi

@MainActor
struct AppCoordinatorNavigationTests {
    @Test
    func choosingAnotherReturnsToTheSameSuggestionsControllerWithoutConfirming() throws {
        let navigationController = UINavigationController()
        let inventoryRepository = DemoInventoryRepository()
        let imageLoader = ProductImageLoader(
            loadImage: LoadProductImageUseCase(repository: URLSessionProductImageRepository())
        )
        let screenFactory = AppScreenFactory(
            inventoryRepository: inventoryRepository,
            loadCandidatesUseCase: LoadSubstitutionCandidatesUseCase(
                productRepository: FixtureProductRepository()
            ),
            imageLoader: imageLoader,
            confirmSubstitutionUseCase: ConfirmSubstitutionUseCase(
                inventoryRepository: inventoryRepository
            )
        )
        let coordinator = AppCoordinator(
            navigationController: navigationController,
            screenFactory: screenFactory
        )
        coordinator.start()

        guard let launchViewController = navigationController.topViewController as? LaunchViewController else {
            Issue.record("Expected the launch screen as the initial navigation root")
            return
        }
        launchViewController.onAnimationCompleted?()

        guard let orderViewController = navigationController.topViewController as? OrderViewController else {
            Issue.record("Expected the order screen as the navigation root")
            return
        }
        orderViewController.onChooseSubstitute?(InventoryFixtures.unavailableProduct.id)

        guard let suggestionsViewController = navigationController.topViewController as? SuggestionsViewController else {
            Issue.record("Expected the suggestions screen after choosing a substitute")
            return
        }

        let candidate = SubstitutionCandidate(
            product: Product(
                id: ProductID(rawValue: "7898215151708"),
                name: "Leite integral",
                category: "en:dairies",
                brand: "Marca B",
                quantity: "1 L"
            )
        )
        suggestionsViewController.onShowComparison?(candidate)

        guard let comparisonController = navigationController.topViewController
            as? UIHostingController<ProductComparisonView> else {
            Issue.record("Expected the SwiftUI comparison hosted in UIKit navigation")
            return
        }

        comparisonController.rootView.onChooseAnother()

        #expect(navigationController.viewControllers.count == 2)
        #expect(navigationController.topViewController === suggestionsViewController)
        #expect(inventoryRepository.currentOrder().items[1].product.id == InventoryFixtures.unavailableProduct.id)
    }
}

private struct FixtureProductRepository: ProductRepository {
    func product(barcode: String) async throws -> Product {
        Product(
            id: ProductID(rawValue: barcode),
            name: "Leite integral",
            category: "en:dairies",
            brand: "Marca B",
            quantity: "1 L"
        )
    }
}
