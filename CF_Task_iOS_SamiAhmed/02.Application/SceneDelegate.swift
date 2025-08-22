//
//  SceneDelegate.swift
//  GoAppCaptain
//
//  Created by Sami Ahmed on 16/04/2025.
//


import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        AppCoordinator.shared.makeWindow(from: windowScene)
        AppCoordinator.shared.start()
    }
}
