//
//  VenueRowView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//


import SwiftUI

struct VenueRowView: View {
    
    //MARK: - Propirites
    let name: String
    let fullAddress: String
    let categoryName: String
    let categoryIconURL: String
    
    //MARK: - Body
    var body: some View {
        
        HStack(alignment: .top, spacing: 12) {
            ImageHelper(
                url: categoryIconURL,
                width: 60,
                height: 60,
                cornerRadius: 12, showPrimaryCircle: true
            )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(fullAddress)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Text(categoryName)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .bold()
            }
            
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
