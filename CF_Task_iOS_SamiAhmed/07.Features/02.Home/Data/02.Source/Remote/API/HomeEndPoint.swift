//
//  HomeEndPoint.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//

import NetworkLayer
import Foundation

// MARK: - Cases
enum HomeEndPoint: EndPoint {
    case getVenus(latitude: Double, longitude: Double)
}

// MARK: - Paths
extension HomeEndPoint {
    var clientName: String { "" }
    
    var path: String {
        switch self {
        case .getVenus:
            return "/v2/venues/search"
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: Headers {
        [
            "Accept": "application/json"
        ]
    }
}

// MARK: - Parameters
extension HomeEndPoint {
    var parameters: [URLQueryItem] {
        switch self {
        case .getVenus(let lat, let lng):
            return [
                URLQueryItem(name: "ll", value: "\(lat),\(lng)"),
                URLQueryItem(name: "client_id", value: "4EQRZPSGKBZGFSERGJY055FRW2OSPJRZYR4C3J0JN2CQQFIV"),
                URLQueryItem(name: "client_secret", value: "AJR4B5LLRONWAJWJJOACHAFLCWS2YJAZMGQNFFZQP0IB3THR"),
                URLQueryItem(name: "v", value: "20180910")
            ]
        }
    }
}
