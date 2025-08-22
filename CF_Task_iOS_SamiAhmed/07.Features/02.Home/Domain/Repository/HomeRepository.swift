//
//  HomeRepository.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import Foundation

protocol HomeRepository {
    func getVenus(lat: Double, lon: Double) async throws ->  [Venue]
}
