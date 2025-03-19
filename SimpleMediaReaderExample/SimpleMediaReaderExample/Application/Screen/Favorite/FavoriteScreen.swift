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
                    Section(header: Text("あなたが登録したお気に入り一覧:")) {
                        ForEach(favoriteViewStateProvider.foodDataSources, id: \.id) { foodDataSource in
                            FavoriteRowView(foodDataSource: foodDataSource)
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .onAppear {
                favoriteViewStateProvider.fetchFoodDataSources()
            }
            .navigationBarTitle("😍Favorite")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
