//
//  FoodRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/12.
//

import Foundation

// MARK: - Protocol

protocol FoodRepositoryProtocol {
    func fetchFood(page: Int) async throws -> FoodPageEntity
}

// MARK: - FoodRepository

final class FoodRepository: FoodRepositoryProtocol {

    // MARK: - Property

    private let apiClientManager: APIClientManager

    // MARK: - Initializer

    public init(apiClientManager: APIClientManager = APIClientManager.shared) {
        self.apiClientManager = apiClientManager
    }

    // MARK: - Function

    func fetchFood(page: Int) async throws -> FoodPageEntity {
        try await apiClientManager.getFoodPage(page)
    }
}
