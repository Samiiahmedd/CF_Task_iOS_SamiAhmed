//
//  HomeCoordinator.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import Foundation
import SwiftUI

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
}

final class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showHome()
    }
    
    // MARK: - Functions
    func showHome() {
        let view = HomeView(viewModel: HomeViewModel())
        let viewController = UIHostingController(rootView: view)
        router.push(viewController)
    }
}

