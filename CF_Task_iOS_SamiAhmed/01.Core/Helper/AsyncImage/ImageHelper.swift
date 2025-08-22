//
//  ImageHelper.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import SwiftUI

struct ImageHelper: View {
    
    //MARK: - Propirites
    let url: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let showPrimaryCircle: Bool
    
    //MARK: - Body
    var body: some View {
        ZStack {
            if showPrimaryCircle {
                Circle()
                    .fill(Color.appPrimary)
                    .frame(width: width + 10, height: height + 10) 
            }
            
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
