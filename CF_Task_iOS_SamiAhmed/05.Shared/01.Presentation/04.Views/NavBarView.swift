//
//  NavBarView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//


import SwiftUI

struct NavBarView: View {
    
    //MARK: - Propirites
    var backAction: () -> Void
    
    //MARK: - Body
    var body: some View {
        HStack {
            Button(action: {
                backAction()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(.appPrimary))
                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 40)
        .background(Color.clear)
    }
}
