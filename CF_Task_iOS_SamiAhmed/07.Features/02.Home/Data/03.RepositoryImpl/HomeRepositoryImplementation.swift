//
//  HomeRepositoryImplementation.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import Foundation
import NetworkLayer

class HomeRepositoryImplementation: HomeRepository {
    
    // MARK: - Properties
    let dataSource: HomeDataSource
    
    // MARK: - Init
    init(dataSource: HomeDataSource) {
        self.dataSource = dataSource
    }
    
    // MARK: - Functions
    func getVenus(lat: Double, lon: Double) async throws -> [Venue] {
        let responseEntity = try await dataSource.getVenus(lat: lat, lon: lon)
        let entities = responseEntity.response?.venues ?? []
        let venues = entities.map { VenueMapper.map($0) }
        return venues
    }
}
