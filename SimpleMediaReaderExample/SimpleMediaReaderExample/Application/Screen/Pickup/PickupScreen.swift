//
//  PickupScreen.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/03.
//

import NukeUI
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

    // 浮き上がってくる様なAnimationに必要な名前空間
    @Namespace private var animation
 
    // 現在選択中のViewObjectを格納するための値
    @State private var selectedPickupViewObject: PickupViewObject?

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
                    // Grid一覧View要素を表示する
                    PickupGridListView()
                }
            }
            .navigationBarTitle("🍒Pickup")
            .navigationBarTitleDisplayMode(.inline)
            .onFirstAppear {
                pickupViewStateProvider.fetchInitialPickups()
            }
            // 浮き上がってくる様なAnimationを伴う画面遷移をPresent/Dismissの形で実施する
            .sheet(item: $selectedPickupViewObject) { pickupViewObject in
                PickupDetailView(pickupViewObject: pickupViewObject, animation: animation)
            }
        }
    }

    // MARK: - Private Function

    @ViewBuilder
    private func PickupGridListView() -> some View {
        GeometryReader { proxy in
            let gridWidth = CGFloat((proxy.frame(in: .global).size.width - 24.0) / 2)
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 8.0) {
                    ForEach(pickupViewStateProvider.pickupViewObjects) { pickupViewObject in
                        PickupGridView(pickupViewObject: pickupViewObject, tapGridViewAction: {
                            selectedPickupViewObject = pickupViewObject
                        }, namespace: animation)
                        .frame(width: gridWidth, height: gridWidth + 84.0)
                    }
                }
                .padding(8.0)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
