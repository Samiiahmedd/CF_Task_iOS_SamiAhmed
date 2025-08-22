//
//  VenueMapper.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import Foundation

struct VenueMapper {
    
    static func map(_ entity: VenueEntity) -> Venue {
        let addressParts = [
            entity.location?.address,
            entity.location?.city,
            entity.location?.state,
            entity.location?.country
        ].compactMap { $0 }.joined(separator: ", ")
        
        let category = entity.categories?.first
        let categoryName = category?.name ?? "Unknown"
        
        let iconURL: String
        if let prefix = category?.icon?.prefix,
           let suffix = category?.icon?.suffix {
            iconURL = "\(prefix)64\(suffix)"
        } else {
            iconURL = ""
        }
        
        return Venue(
            id: entity.id ?? UUID().uuidString,
            name: entity.name ?? "Unknown",
            fullAddress: addressParts,
            categoryName: categoryName,
            categoryIconURL: iconURL
        )
    }
}
