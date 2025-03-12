//
//  PickupRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/11.
//

import Foundation

// MARK: - Protocol

protocol PickupRepositoryProtocol {
    func fetchPickups() -> [PickupEntity]
}

// MARK: - PickupRepository

final class PickupRepository: PickupRepositoryProtocol {

    // MARK: - Function

    func fetchPickups() -> [PickupEntity] {
        []
    }
}
