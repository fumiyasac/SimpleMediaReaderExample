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

    @MainActor
    init(foodRepository: FoodRepositoryProtocol = FoodRepository()) {
        self.foodRepository = foodRepository
    }

    // MARK: - Function

    @MainActor
    func fetchInitialFoods() {

        // Loading状態にする＆初回読み込み実行時はpage番号をリセットする
        _isLoading = true
        _page = 1

        Task {
            do {
                let foodsPerPage = try await foodRepository.fetchFood(page: 1)
                _foodViewObjects = foodsPerPage.foods.map {
                    FoodViewObject(
                        id: $0.id,
                        title: $0.title,
                        category: $0.category,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt,
                        isFavorited: getTargetFoodIds().contains($0.id)
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
                _foodViewObjects += foodsPerPage.foods.map {
                    FoodViewObject(
                        id: $0.id,
                        title: $0.title,
                        category: $0.category,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt,
                        isFavorited: getTargetFoodIds().contains($0.id)
                    )
                }
                _hasNextPage = foodsPerPage.hasNextPage
                _page += 1
                _errorMessage = nil

            } catch {}
        }
    }

    @MainActor
    func addOrDeleteFoodDataStore(foodViewObject: FoodViewObject, shouldAdd: Bool) {
        if shouldAdd {
            let newFoodDataSource = FoodDataSource(
                targetFoodId: foodViewObject.id,
                title: foodViewObject.title,
                category: foodViewObject.category,
                summary: foodViewObject.summary,
                thumbnailUrl: foodViewObject.thumbnailUrl,
                publishedAt: foodViewObject.publishedAt
            )
            foodRepository.addFoodDataSource(foodDataSource: newFoodDataSource)
        } else {
            foodRepository.removeFoodDataSource(targetFoodId: foodViewObject.id)
        }
        replaceNewFoodViewObjects(targetFoodId: foodViewObject.id, shouldAdd: shouldAdd)
    }

    func reloadFoodViewObjects() {

        // 表示対象のViewObjectが空の場合は以降の処理を実施しない
        if _foodViewObjects.count == 0 {
            return
        }

        // 最新のお気に入りデータを反映して、再度表示対象の変数に反映する
        var newFoodViewObjects: [FoodViewObject] = []
        let _ = _foodViewObjects.forEach {
            let newFoodViewObject = FoodViewObject(
                id: $0.id,
                title: $0.title,
                category: $0.category,
                summary: $0.summary,
                thumbnailUrl: $0.thumbnailUrl,
                publishedAt: $0.publishedAt,
                isFavorited: getTargetFoodIds().contains($0.id)
            )
            newFoodViewObjects.append(newFoodViewObject)
        }
        _foodViewObjects = newFoodViewObjects
    }
    
    // MARK: - Private Function

    private func getTargetFoodIds() -> [Int] {
        let foodDataSources = foodRepository.fetchFoodDataSource()
        return foodDataSources.map { $0.targetFoodId }
    }

    private func replaceNewFoodViewObjects(targetFoodId: Int, shouldAdd: Bool) {
        var newFoodViewObjects: [FoodViewObject] = []
        let _ = _foodViewObjects.forEach {
            if $0.id == targetFoodId {
                let newFoodViewObject = FoodViewObject(
                    id: $0.id,
                    title: $0.title,
                    category: $0.category,
                    summary: $0.summary,
                    thumbnailUrl: $0.thumbnailUrl,
                    publishedAt: $0.publishedAt,
                    isFavorited: shouldAdd
                )
                newFoodViewObjects.append(newFoodViewObject)
            } else {
                newFoodViewObjects.append($0)
            }
        }
        _foodViewObjects = newFoodViewObjects
    }
}
