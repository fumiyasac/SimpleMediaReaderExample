//
//  FavoriteRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/09.
//

import Foundation

// MARK: - Protocol

protocol FavoriteRepositoryProtocol {
    func fetchFoodDataSource() -> [FoodDataSource]
    func removeFoodDataSource(targetFoodId: Int)
}

// MARK: - FavoriteRepository

final class FavoriteRepository: FavoriteRepositoryProtocol {

    // MARK: - Property

    private let foodDataStoreManager: FoodDataStoreManager

    // MARK: - Initializer

    @MainActor
    init(
        foodDataStoreManager: FoodDataStoreManager = FoodDataStoreManager.shared
    ) {
        self.foodDataStoreManager = foodDataStoreManager
    }

    // MARK: - Function

    func fetchFoodDataSource() -> [FoodDataSource] {
        foodDataStoreManager.fetchFoodDataSource()
    }

    func removeFoodDataSource(targetFoodId: Int) {
        foodDataStoreManager.removeFoodDataSource(targetFoodId: targetFoodId)
    }
}
