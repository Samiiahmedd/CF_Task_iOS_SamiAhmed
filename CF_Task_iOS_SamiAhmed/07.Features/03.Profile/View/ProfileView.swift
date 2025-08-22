//
//  ProfileView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//


import SwiftUI

struct ProfileView: View {
    
    //MARK: - Propirites
    @StateObject private var viewModel = ProfileViewModel()
    
    //MARK: - Body
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20) {
                
                Image(viewModel.userImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                
                Text(viewModel.userName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(viewModel.description)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .foregroundColor(.appSecoundry)
                
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.appPrimary))
    }
}
