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
                Text("FoodScreen")
            }
            .navigationBarTitle("🍽️Food")
            .navigationBarTitleDisplayMode(.inline)
            .onFirstAppear {
                Task { @MainActor in
                    do {
                        let result = try await APIClientManager.shared.getFoodPage(1)
                        print(result)
                    } catch let error {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    FoodScreen()
}
