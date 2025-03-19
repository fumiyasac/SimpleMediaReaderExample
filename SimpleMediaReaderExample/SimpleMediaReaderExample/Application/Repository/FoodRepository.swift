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
    func fetchFoodDataSource() -> [FoodDataSource]
    func addFoodDataSource(foodDataSource: FoodDataSource)
    func removeFoodDataSource(targetFoodId: Int)
}

// MARK: - FoodRepository

final class FoodRepository: FoodRepositoryProtocol {

    // MARK: - Property

    private let apiClientManager: APIClientManager
    private let foodDataStoreManager: FoodDataStoreManager

    // MARK: - Initializer

    @MainActor
    public init(
        apiClientManager: APIClientManager = APIClientManager.shared,
        foodDataStoreManager: FoodDataStoreManager = FoodDataStoreManager.shared
    ) {
        self.apiClientManager = apiClientManager
        self.foodDataStoreManager = foodDataStoreManager
    }

    // MARK: - Function

    func fetchFood(page: Int) async throws -> FoodPageEntity {
        try await apiClientManager.getFoodPage(page)
    }

    func fetchFoodDataSource() -> [FoodDataSource] {
        foodDataStoreManager.fetchFoodDataSource()
    }

    func addFoodDataSource(foodDataSource: FoodDataSource) {
        foodDataStoreManager.addFoodDataSource(foodDataSource: foodDataSource)
    }

    func removeFoodDataSource(targetFoodId: Int) {
        foodDataStoreManager.removeFoodDataSource(targetFoodId: targetFoodId)
    }
}
