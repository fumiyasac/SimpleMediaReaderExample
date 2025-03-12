//
//  FoodScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/24.
//

import SwiftUI

struct FoodScreen: View {

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                Text("FeedScreen")
            }
            .navigationBarTitle("🍽️Food")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FoodScreen()
}
