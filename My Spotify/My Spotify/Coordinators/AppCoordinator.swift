//
//  File.swift
//  My Spotify
//
//  Created by Krunal Patel on 04/07/23.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        KeychainHelper.shared.accessToken == nil ? goToAuth() : goToSearch()
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        self.window.rootViewController = navigationController
        homeCoordinator.start()
    }
    
    func goToAuth(with code: String? = nil) {
        let authCoordinator = AuthCoordinator(navigationController: navigationController, with: code)
        self.window.rootViewController = navigationController
        authCoordinator.start()
    }
    
    func goToSearch() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        self.window.rootViewController = navigationController
        searchCoordinator.start()
    }
}
