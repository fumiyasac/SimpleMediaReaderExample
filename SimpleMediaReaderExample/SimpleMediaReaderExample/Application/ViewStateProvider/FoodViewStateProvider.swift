//
//  FoodViewStateProvider.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/12.
//

import Foundation
import Observation

@Observable
final class FoodViewStateProvider {

    // MARK: - Property (Dependency)

    private let foodRepository: FoodRepositoryProtocol

    // MARK: - Property (Computed)

    private var _isLoading: Bool = false
    private var _errorMessage: String?
    private var _foods: [FoodViewObject] = []

    @ObservationIgnored
    private var _page: Int = 1

    @ObservationIgnored
    private var _hasNextPage: Bool = true

    // MARK: - Property (`@Observable`)

    var isLoading: Bool {
        _isLoading
    }

    var errorMessage: String? {
        _errorMessage
    }

    var foods: [FoodViewObject] {
        _foods
    }

    // MARK: - Initializer

    init(foodRepository: FoodRepositoryProtocol = FoodRepository()) {
        self.foodRepository = foodRepository
    }

    @MainActor
    func fetchInitialFoods() {
        // Loading状態にする
        _isLoading = true

        Task {
            do {
                let foodsPerPage = try await foodRepository.fetchFood(page: 1)
                // TODO: お気に入りをしているデータを反映する
                _foods = foodsPerPage.foods.map {
                    FoodViewObject(
                        id: $0.id,
                        title: $0.title,
                        category: $0.category,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt,
                        isFavorited: false
                    )
                }
                _hasNextPage = foodsPerPage.hasNextPage
                _page += 1
                _errorMessage = nil

            } catch {
                _errorMessage = """
                初回情報の取得に失敗しました。
                """
            }
        }
        
        // 処理が完了した後にはLoading状態を元に戻す
        _isLoading = false
    }

    @MainActor
    func fetchNextFoods() {

        if _hasNextPage == false {
            return
        }

        Task {
            do {
                let foodsPerPage = try await foodRepository.fetchFood(page: _page)
                // TODO: お気に入りをしているデータを反映する
                _foods += foodsPerPage.foods.map {
                    FoodViewObject(
                        id: $0.id,
                        title: $0.title,
                        category: $0.category,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt,
                        isFavorited: false
                    )
                }
                _hasNextPage = foodsPerPage.hasNextPage
                _page += 1
                _errorMessage = nil

            } catch {}
        }
    }
}

