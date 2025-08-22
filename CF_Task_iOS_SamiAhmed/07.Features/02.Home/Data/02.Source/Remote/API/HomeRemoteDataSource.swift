//
//  HomeRemoteDataSource.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import Foundation
import NetworkLayer

final class HomeRemoteDataSource: BaseRemoteDataSource, HomeDataSource {
    func getVenus(lat: Double, lon: Double) async throws -> VenueResponseEntity {
        let endPoint = HomeEndPoint.getVenus(latitude: lat, longitude: lon)
        let request = RequestModel(endPoint: endPoint)
        let response: VenueResponseEntity = try await network.requestWithBase(request)
        return response
    }
}

