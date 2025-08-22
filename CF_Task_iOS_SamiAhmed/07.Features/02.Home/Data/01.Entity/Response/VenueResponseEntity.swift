//
//  VenueResponseEntity.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//


// MARK: - API Response
struct VenueResponseEntity: Codable {
    let response: VenuesContainerEntity?
}

struct VenuesContainerEntity: Codable {
    let venues: [VenueEntity]?
}

// MARK: - Venue
struct VenueEntity: Codable {
    let id: String?
    let name: String?
    let location: LocationEntity?
    let categories: [CategoryEntity]?
}

// MARK: - Location
struct LocationEntity: Codable {
    let address: String?
    let city: String?
    let state: String?
    let country: String?
}

// MARK: - Category
struct CategoryEntity: Codable {
    let id: String?
    let name: String?
    let icon: IconEntity?
}

struct IconEntity: Codable {
    let prefix: String?
    let suffix: String?
}
