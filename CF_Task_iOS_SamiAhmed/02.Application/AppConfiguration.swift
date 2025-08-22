//
//  AppConfiguration.swift
//  GoAppCaptain
//
//  Created by Sami Ahmed on 15/04/2025.
//

import Foundation
import NetworkLayer
import UIKit

class AppConfiguration {
    /// Network Layer
    struct NetworkLayerConfigurations {
        static func configure() async {
            let networkManager = NetworkConfigurationManager.shared
            await networkManager.setBaseURL("api.foursquare.com")
#if DEBUG
            await networkManager.setLoggerEnabled(true)
#endif
        }
    }
    
    /// Location configurations
    struct LocationConfigurations {
        static func configure() {
            print("Start get coordinates ")
            LocationService.shared.start()
        }
    }
    
    /// Configuration
    @MainActor static func configure(_ app: UIApplication) {
        LocationConfigurations.configure()
        Task {
            await NetworkLayerConfigurations.configure()
        }
    }
}
