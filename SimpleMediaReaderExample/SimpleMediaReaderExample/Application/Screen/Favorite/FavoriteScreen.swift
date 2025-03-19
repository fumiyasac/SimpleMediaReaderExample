//
//  FavoriteScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/24.
//

import SwiftUI

struct FavoriteScreen: View {

    // MARK: - ViewStateProvider

    private let favoriteViewStateProvider: FavoriteViewStateProvider

    // MARK: - Initializer

    init(favoriteViewStateProvider: FavoriteViewStateProvider = FavoriteViewStateProvider()) {
        self.favoriteViewStateProvider = favoriteViewStateProvider
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(favoriteViewStateProvider.foodDataSources, id: \.id) { foodDataSource in
                        Text(foodDataSource.title)
                    }
                }
            }
            .onAppear {
                favoriteViewStateProvider.fetchFoodDataSources()
            }
            .navigationBarTitle("😍Favorite")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteScreen()
}
