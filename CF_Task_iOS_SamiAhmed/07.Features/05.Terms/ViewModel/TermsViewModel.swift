//
//  TermsViewModel.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//


import SwiftUI

final class TermsViewModel: ObservableObject {
    
    //MARK: - Propirities
    @Published var title: String
    @Published var content: String
    
    //MARK: - Init
    init(title: String = "Terms & Conditions", content: String = """
Welcome to our app. By using this app, you agree to the following terms and conditions:
1. You shall not misuse the app.
2. All information provided is for reference only.
3. We reserve the right to update these terms at any time.
""") {
        self.title = title
        self.content = content
    }
}
