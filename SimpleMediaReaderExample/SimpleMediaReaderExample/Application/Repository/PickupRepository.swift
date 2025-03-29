//
//  PickupRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/11.
//

import Foundation

// MARK: - Protocol

protocol PickupRepositoryProtocol {
    func fetchPickups() async throws -> [PickupEntity]
}

// MARK: - PickupRepository

final class PickupRepository: PickupRepositoryProtocol {

    // MARK: - Property

    private let apiClientManager: APIClientManager

    // MARK: - Initializer

    init(apiClientManager: APIClientManager = APIClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    func fetchPickups() async throws -> [PickupEntity] {
        try await apiClientManager.getPickup()
    }
}
