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
    private var _foodViewObjects: [FoodViewObject] = []

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

    var foodViewObjects: [FoodViewObject] {
        _foodViewObjects
    }

    // MARK: - Initializer

    init(foodRepository: FoodRepositoryProtocol = FoodRepository()) {
        self.foodRepository = foodRepository
    }

    @MainActor
    func fetchInitialFoods() {

        // Loading状態にする＆初回読み込み実行時はpage番号をリセットする
        _isLoading = true
        _page = 1

        Task {
            do {
                let foodsPerPage = try await foodRepository.fetchFood(page: 1)
                // TODO: お気に入りをしているデータを反映する
                _foodViewObjects = foodsPerPage.foods.map {
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

        // 次のページが存在しない場合は以降の処理を実施しない
        if _hasNextPage == false {
            return
        }

        Task {
            do {
                let foodsPerPage = try await foodRepository.fetchFood(page: _page)
                // TODO: お気に入りをしているデータを反映する
                _foodViewObjects += foodsPerPage.foods.map {
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

