//
//  TermsView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//


import SwiftUI

struct TermsView: View {
    
    //MARK: - Propirites
    @StateObject private var viewModel = TermsViewModel()
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            termsContent
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
    
    //MARK: - Widgets
    private var termsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(viewModel.content)
                .font(.body)
                .foregroundColor(.appPrimary)
                .lineSpacing(6)
        }
        .padding()
    }
}
