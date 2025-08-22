//
//  TabBarButton.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import SwiftUI

struct TabBarButton: View {
    
    //MARK: - Propirites
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                
                Image(systemName: isSelected ? "\(icon).fill" : icon)
                    .font(.system(size: 22, weight: isSelected ? .bold : .regular))
                    .foregroundColor(isSelected ? .blue : .gray)
                    .scaleEffect(isSelected ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isSelected)
                
                Text(title)
                    .font(.caption2)
                    .fontWeight(isSelected ? .bold : .regular)
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
