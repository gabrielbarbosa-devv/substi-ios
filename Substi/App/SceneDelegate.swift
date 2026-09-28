import SubstiDomain
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let navigationController = UINavigationController()
        guard let apiBaseURL = URL(string: "https://world.openfoodfacts.org") else {
            preconditionFailure("A URL base da Open Food Facts deve ser válida.")
        }
        let apiClient = URLSessionAPIClient(
            baseURL: apiBaseURL,
            userAgent: "Substi/1.0 (https://github.com/gabrielbarbosa-devv/substi-ios)"
        )
        let productRepository: any ProductRepository
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("--uitest-demo-catalog") {
            productRepository = DemoCatalogProductRepository()
        } else {
            productRepository = OpenFoodFactsProductRepository(apiClient: apiClient)
        }
        #else
        productRepository = OpenFoodFactsProductRepository(apiClient: apiClient)
        #endif
        let coordinator = AppCoordinator(
            navigationController: navigationController,
            inventoryRepository: DemoInventoryRepository(),
            productRepository: productRepository
        )
        coordinator.start()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.appCoordinator = coordinator
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        appCoordinator = nil
        window = nil
    }
}
