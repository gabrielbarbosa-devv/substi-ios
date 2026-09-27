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
        let coordinator = AppCoordinator(
            navigationController: navigationController,
            inventoryRepository: DemoInventoryRepository()
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
