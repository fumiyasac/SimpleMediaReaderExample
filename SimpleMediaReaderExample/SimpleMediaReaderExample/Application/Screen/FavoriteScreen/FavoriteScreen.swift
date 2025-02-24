//
//  FavoriteScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/24.
//

import SwiftUI

struct FavoriteScreen: View {

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                Text("FavoriteScreen")
            }
            .navigationBarTitle("😍Favorite")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoriteScreen()
}
