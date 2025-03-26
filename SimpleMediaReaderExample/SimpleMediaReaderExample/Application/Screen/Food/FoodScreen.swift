//
//  FoodScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/24.
//

import SwiftUI

struct FoodScreen: View {

    // MARK: - ViewStateProvider

    private let foodViewStateProvider: FoodViewStateProvider

    // MARK: - Initializer

    init(foodViewStateProvider: FoodViewStateProvider = FoodViewStateProvider()) {
        self.foodViewStateProvider = foodViewStateProvider
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                switch (foodViewStateProvider.isLoading, foodViewStateProvider.errorMessage) {
                case (true, _):
                    // Loading Indicatorを表示する
                     ExecutingConnectionView()
                case (_, foodViewStateProvider.errorMessage) where foodViewStateProvider.errorMessage != nil:
                    // Error Message画面を表示する
                    ConnectionErrorView(
                        tapButtonAction: {
                            foodViewStateProvider.fetchInitialFoods()
                        }
                    )
                default:
                    ScrollView {
                        // 👉 spacingを0.0に設定しないと下側に8.0pxの余白が生まれてしまう...
                        LazyVStack(spacing: 0.0) {
                            ForEach(foodViewStateProvider.foodViewObjects, id: \.id) { foodViewObject in
                                // お気に入り処理が出来るようにする（SwiftDataと連携したお気に入りの保存）
                                FoodRowView(foodViewObject: foodViewObject, tapIsFavoritedButtonAction: { result in
                                    foodViewStateProvider.addOrDeleteFoodDataStore(foodViewObject: foodViewObject, shouldAdd: result)
                                })
                                .onAppear {
                                    if foodViewObject.id == foodViewStateProvider.foodViewObjects.count && foodViewStateProvider.foodViewObjects.count > 0 {
                                        foodViewStateProvider.fetchNextFoods()
                                    }
                                }
                            }
                        }
                        // 👉 LazyVStackにidを付与する事でFavoriteタブで解除したお気に入り状態を反映させる
                        // ※この方法が正しいかは正直自信がない...
                        .id(UUID().uuidString)
                    }
                    .onAppear {
                        foodViewStateProvider.reloadFoodViewObjects()
                    }
                    .refreshable {
                        foodViewStateProvider.fetchInitialFoods()
                    }
                }
            }
            .navigationBarTitle("🍽️Food")
            .navigationBarTitleDisplayMode(.inline)
            .onFirstAppear {
                foodViewStateProvider.fetchInitialFoods()
            }
        }
    }
}
