//
//  HomeDataSource.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import Foundation

protocol HomeDataSource {
    func getVenus(lat: Double, lon: Double) async throws ->VenueResponseEntity
}
