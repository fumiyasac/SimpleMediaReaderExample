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
                    Text("読み込み中...")
                case (_, foodViewStateProvider.errorMessage) where foodViewStateProvider.errorMessage != nil:
                    // Error Message画面を表示する
                    Text("Error!!!")
                default:
                    ScrollView {
                        ForEach(foodViewStateProvider.foods, id: \.id) { food in
                            Text(food.title)
                        }
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
