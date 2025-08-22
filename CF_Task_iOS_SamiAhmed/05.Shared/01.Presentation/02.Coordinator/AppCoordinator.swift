//
//  AppCoordinator.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import UIKit
import SwiftUI

class AppCoordinator {
    
    var windo: UIWindow?
    var isLogin = false
    
    let router: Router
    
    static let shared = AppCoordinator()
    
    init() {
        self.router = AppRouter(navigationController: .init())
        self.router.navigationController.isNavigationBarHidden = true
    }
}

// MARK: - Main Coordinatot
extension AppCoordinator: Coordinator {
    func makeWindow(from windoScene: UIWindowScene) {
        let windo = UIWindow(windowScene: windoScene)
        windo.rootViewController = self.router.navigationController
        windo.makeKeyAndVisible()
        self.windo = windo
    }
    
    func resetWindo() {
        guard let window = windo else { return }
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.windo = window
    }
    
    func start() {
        showSplash()
    }
    
    func showSplash() {
        let view = SplashView()
        let viewController = UIHostingController(rootView: view)
        guard let window = windo else { return }
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight) {
            window.rootViewController = viewController
        }
    }
    
//    func showTabBar() {
//        let homeCoordinator = HomeCoordinator(router: router)
//        let tabBarView = TabBarView(coordinator: homeCoordinator)
//        let viewController = UIHostingController(rootView: tabBarView)
//        guard let window = windo else { return }
//        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight) {
//            window.rootViewController = viewController
//        }
//    }
    
    func showTabBar() {
                let homeCoordinator = HomeCoordinator(router: router)

        let tabBarView = TabBarView(coordinator: homeCoordinator)  // pass coordinator
        let tabBarVC = UIHostingController(rootView: tabBarView)
        let navController = UINavigationController(rootViewController: tabBarVC)
        navController.isNavigationBarHidden = true  // optional if you have a custom nav bar
        guard let window = windo else { return }
        
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight) {
            window.rootViewController = navController
        }
    }

}
