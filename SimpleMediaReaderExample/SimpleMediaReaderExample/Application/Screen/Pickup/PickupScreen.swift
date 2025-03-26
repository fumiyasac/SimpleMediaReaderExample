//
//  PickupScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/03.
//

import SwiftUI

struct PickupScreen: View {

    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                Text("PickupScreen")
            }
            .navigationBarTitle("🍒Pickup")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PickupScreen()
}
