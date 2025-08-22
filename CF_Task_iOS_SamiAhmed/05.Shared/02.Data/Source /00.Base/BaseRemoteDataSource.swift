//
//  BaseRemoteDataSource.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 22/08/2025.
//


import Foundation
import NetworkLayer

class BaseRemoteDataSource {
    let network = APIRequestHandler()

    func extractData<T>(_ response: BaseModel<T>) throws -> T {
        guard response.status == .success, let data = response.data else {
            throw NetworkError.customError(error: response.message ?? "defult_error.m")
        }
        return data
    }
    
    func checkResponse(_ response: BaseModel<EmptyEntity>) throws {
        guard response.status == .success else {
            throw NetworkError.customError(error: response.message ?? "defult_error.m")
        }
    }
}
