//
//  ContentView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2024/09/12.
//

import SwiftUI

// SwiftDataでのお気に入り機能と画面遷移アニメーションを取り入れたサンプル

struct ContentView: View {

    // MARK: - Body

    var body: some View {
        TabView {
            // FeedScreenコンテンツ画面
            FeedScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "fork.knife.circle.fill")
                        Text("Feed")
                    }
                }
                .tag(0)
            // FavoriteScreenコンテンツ画面
            FavoriteScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.circle.fill")
                        Text("Favorite")
                    }
                }
                .tag(1)
        }
        .accentColor(Color(uiColor: UIColor(code: "#985e41")))
    }
}

#Preview {
    ContentView()
}
