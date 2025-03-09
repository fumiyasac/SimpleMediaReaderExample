//
//  FavoriteRepository.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/09.
//

import Foundation

// MARK: - Protocol

protocol FavoriteRepositoryProtocol {
    @MainActor func fetchFoodDataSource() -> [FoodDataSource]
    @MainActor func removeFoodDataSource(foodDataSource: FoodDataSource)
}

// MARK: - FavoriteRepository

final class FavoriteRepository: FavoriteRepositoryProtocol {

    // MARK: - Function

    func fetchFoodDataSource() -> [FoodDataSource] {
        FoodDataStoreManager.shared.fetchFoodDataSource()
    }

    func removeFoodDataSource(foodDataSource: FoodDataSource) {
        FoodDataStoreManager.shared.removeFoodDataSource(foodDataSource: foodDataSource)
    }
}
