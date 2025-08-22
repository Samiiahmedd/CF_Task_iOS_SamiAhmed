//
//  ProfileViewModel.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    //MARK: - Propirites
    @Published var userName: String
    @Published var userImageName: String
    @Published var description: String
    
    //MARK: - Init
    init(userName: String = "Sami Ahmed Mehidy",
         userImageName: String = "user_profile",
         description: String = "Skilled iOS Developer with experience building high-performance mobile apps using Swift, SwiftUI, and UIKit. Proficient in MVVM, Combine, RESTful APIs, Core Data, and custom UI components. Experienced in integrating external APIs, implementing reactive flows, and managing app lifecycle, network layers, and dynamic UI behavior. Strong problem-solving skills and a passion for creating seamless user experiences.") {
        
        self.userName = userName
        self.userImageName = userImageName
        self.description = description
    }
}
