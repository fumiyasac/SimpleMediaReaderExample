//
//  PickupRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/11.
//

// MARK: - Protocol

protocol PickupRepositoryProtocol {
    @MainActor func fetchPickups() -> [PickupEntity]
}

// MARK: - PickupRepository

final class PickupRepository: PickupRepositoryProtocol {

    // MARK: - Function

    func fetchPickups() -> [PickupEntity] {
        []
    }
}
