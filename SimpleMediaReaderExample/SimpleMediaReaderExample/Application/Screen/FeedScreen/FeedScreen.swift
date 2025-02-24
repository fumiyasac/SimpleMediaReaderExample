//
//  FeedScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/24.
//

import SwiftUI

struct FeedScreen: View {

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                Text("FeedScreen")
            }
            .navigationBarTitle("🌽Feed")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FeedScreen()
}
