//
//  FavoriteViewStateProvider.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/19.
//

import Foundation
import Observation

@Observable
final class FavoriteViewStateProvider {

    // MARK: - Property (Dependency)

    private let favoriteRepository: FavoriteRepositoryProtocol

    // MARK: - Property (Computed)

    private var _foodDataSources: [FoodDataSource] = []

    var foodDataSources: [FoodDataSource] {
        _foodDataSources
    }

    // MARK: - Initializer

    @MainActor
    init(favoriteRepository: FavoriteRepositoryProtocol = FavoriteRepository()) {
        self.favoriteRepository = favoriteRepository
    }

    // MARK: - Function

    @MainActor
    func fetchFoodDataSources() {
        _foodDataSources = favoriteRepository.fetchFoodDataSource()
    }
}
