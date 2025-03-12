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
    func removeFoodDataSource(foodDataSource: FoodDataSource)
}

// MARK: - FavoriteRepository

final class FavoriteRepository: @preconcurrency FavoriteRepositoryProtocol {

    // MARK: - Function

    @MainActor
    func fetchFoodDataSource() -> [FoodDataSource] {
        FoodDataStoreManager.shared.fetchFoodDataSource()
    }

    @MainActor
    func removeFoodDataSource(foodDataSource: FoodDataSource) {
        FoodDataStoreManager.shared.removeFoodDataSource(foodDataSource: foodDataSource)
    }
}
