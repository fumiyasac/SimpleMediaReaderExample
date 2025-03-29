//
//  PickupScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/03.
//

import SwiftUI

struct PickupScreen: View {

    // MARK: - ViewStateProvider

    private let pickupViewStateProvider: PickupViewStateProvider

    // MARK: - Initializer

    init(pickupViewStateProvider: PickupViewStateProvider = PickupViewStateProvider()) {
        self.pickupViewStateProvider = pickupViewStateProvider
    }

    // MARK: - Property

    private let gridColumns = [
        GridItem(spacing: 8.0),
        GridItem(spacing: 0.0)
    ]
    
    // MARK: - Body

    var body: some View {
        NavigationStack {
            Group {
                switch (pickupViewStateProvider.isLoading, pickupViewStateProvider.errorMessage) {
                case (true, _):
                    // Loading Indicatorを表示する
                    ExecutingConnectionView()
                case (_, pickupViewStateProvider.errorMessage) where pickupViewStateProvider.errorMessage != nil:
                    // Error Message画面を表示する
                    ConnectionErrorView(
                        tapButtonAction: {
                            pickupViewStateProvider.fetchInitialPickups()
                        }
                    )
                default:
                    GeometryReader { proxy in
                        let gridWidth = CGFloat((proxy.frame(in: .global).size.width - 24.0) / 2)
                        ScrollView {
                            // MEMO: 上下に8.0の行間をつけるためにSpacing値を8.0としています。
                            LazyVGrid(columns: gridColumns, spacing: 8.0) {
                                ForEach(pickupViewStateProvider.pickupViewObjects) { pickupViewObject in
                                    PickupGridView(pickupViewObject: pickupViewObject, tapGridViewAction: {
                                        print("Tapped")
                                    })
                                    .frame(width: gridWidth, height: gridWidth + 102.0)
                                }
                            }
                            .padding(8.0)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationBarTitle("🍒Pickup")
            .navigationBarTitleDisplayMode(.inline)
            .onFirstAppear {
                pickupViewStateProvider.fetchInitialPickups()
            }
        }
    }
}

//#Preview {
//    PickupScreen()
//}
