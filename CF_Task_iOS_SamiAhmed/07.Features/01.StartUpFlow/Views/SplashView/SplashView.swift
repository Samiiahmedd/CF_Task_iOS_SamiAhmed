//
//  SplashView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import SwiftUI
import Lottie

struct SplashView: View {
    
    // MARK: - Properties
    @State private var isAnimationCompleted: Bool = false
    @State var isLoading: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .appPrimary,
                        .appTint
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            
            LottieView(animation: .named("logo_splash"))
                .playing()
                .animationDidFinish { completed in
                    if completed {
                        isAnimationCompleted = true
                        checkAndNavigate()
                    }
                }
                .frame(
                    width: Screen.width * 0.5,
                    height: Screen.width * 0.5
                )
            
                .onChange(of: isLoading) { _ in
                    checkAndNavigate()
                }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Functions
    private func checkAndNavigate() {
        if isAnimationCompleted {
            AppCoordinator.shared.showTabBar()
        }
    }
}
