//
//  HomeView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @ObservedObject private var viewModel: HomeViewModel
    
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Nearby Venues 🏙️")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.appPrimary)
                .padding(.horizontal)
                .padding(.top, 10)
            
            List(viewModel.venues, id: \.id) { venue in
                HStack(spacing: 12) {
                    
                    ImageHelper(
                        url: venue.categoryIconURL,
                        width: 60,
                        height: 60,
                        cornerRadius: 8, showPrimaryCircle: true
                    )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(venue.name)
                            .font(.headline)
                        
                        Text(venue.fullAddress)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(venue.categoryName)
                            .font(.caption)
                            .foregroundColor(.appTint)
                    }
                }
                .padding(.vertical, 8)
            }
            .listStyle(.plain)
        }
        .onAppear {
            Task {
                await viewModel.loadVenues()
            }
        }
    }
}
