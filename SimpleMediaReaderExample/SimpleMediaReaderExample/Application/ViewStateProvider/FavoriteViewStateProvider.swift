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

    @MainActor
    func removeFoodDataSource(foodDataSource: FoodDataSource) {
        // 👉 表示対象の要素から該当のFoodDataSourceを削除した後に、SwiftDataから削除を実施する
        _foodDataSources = _foodDataSources.filter { $0.targetFoodId != foodDataSource.targetFoodId }
        favoriteRepository.removeFoodDataSource(targetFoodId: foodDataSource.targetFoodId)
    }
}
