//
//  CustomTabBar.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import SwiftUI

import SwiftUI

struct CustomTabBar: View {
    
    //MARK: - Properties
    @Binding var selectedTab: Int
    
    let tabs: [TabItem] = [
        TabItem(title: "Home", icon: "house"),
        TabItem(title: "Profile", icon: "person"),
        TabItem(title: "More", icon: "doc.text")
    ]
    
    //MARK: - Body
    var body: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self) { index in
                let tab = tabs[index]
                
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(selectedTab == index ? .white : .gray)
                            .scaleEffect(selectedTab == index ? 1.3 : 1.0)
                            .padding(12)
                            .background(
                                Circle()
                                    .fill(selectedTab == index ? .appPrimary : Color.clear)
                            )
                        
                        Text(tab.title)
                            .font(.caption2)
                            .fontWeight(selectedTab == index ? .bold : .regular)
                            .foregroundColor(selectedTab == index ? .appPrimary : .gray)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 20)
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 5)
        )
        .padding(.horizontal, 25)
        .padding(.bottom, 20)
    }
}
