//
//  TabBarView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Properties
    @State private var selectedTab: Int = 0
    private let seeMoreViewModel: SeeMoreViewModel
    private let homeViewModel = HomeViewModel(
        repository: HomeRepositoryImplementation(
            dataSource: HomeRemoteDataSource()
        )
    )
    
    // MARK: - Init
    init(coordinator: HomeCoordinatorProtocol) {
        self.seeMoreViewModel = SeeMoreViewModel()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case 0:
                    HomeView(viewModel: homeViewModel)
                case 1:
                    ProfileView()
                case 2:
                    SeeMoreView(viewModel: seeMoreViewModel)
                default:
                    HomeView(viewModel: homeViewModel)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
