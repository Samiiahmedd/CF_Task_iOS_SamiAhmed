//
//  HomeViewModel.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import Foundation
import Combine
import CoreLocation

protocol HomeViewModelProtocol {
    func loadVenues() async
}

final class HomeViewModel: ObservableObject {
    
    // MARK: - Published
    @Published var isLoading: Bool = false
    @Published var venues: [Venue] = []
    @Published var coordinate: CLLocationCoordinate2D?
    @Published var errorMessage: String?
    
    // MARK: - Private
    private let repository: HomeRepository
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(repository: HomeRepository = HomeRepositoryImplementation(dataSource: HomeRemoteDataSource())
    ) {
        self.repository = repository
        bindLocationService()
        LocationService.shared.start()
    }
    
    // MARK: - Private Functions
    private func bindLocationService() {
        LocationService.shared.locationPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coordinate in
                self?.coordinate = coordinate
            }
            .store(in: &cancellables)
        
        LocationService.shared.errorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                switch error {
                case .permissionDenied:
                    self?.errorMessage = "Permission Denied"
                case .locationUnavailable:
                    self?.errorMessage = "Location Unavailable"
                case .unknown(let err):
                    self?.errorMessage = err.localizedDescription
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - API Calls
extension HomeViewModel: HomeViewModelProtocol {
    @MainActor
    func loadVenues() async {
        guard let coordinate = coordinate else {
            errorMessage = "No coordinates found"
            return
        }
        isLoading = true
        defer { isLoading = false }
        do {
            let result = try await repository.getVenus(
                lat: coordinate.latitude,
                lon: coordinate.longitude
            )
            venues = result
        } catch {
            errorMessage = error.localizedDescription
            print("Error :", error.localizedDescription)
        }
    }
}
