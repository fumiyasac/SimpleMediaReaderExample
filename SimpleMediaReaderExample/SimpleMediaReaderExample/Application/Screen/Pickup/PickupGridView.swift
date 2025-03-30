//
//  PickupGridView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/29.
//

import NukeUI
import SwiftUI

struct PickupGridView: View {

    // MARK: - Typealias

    typealias TapGridViewAction = () -> Void

    // MARK: - Property

    private var tapGridViewAction: PickupGridView.TapGridViewAction

    private let pickupViewObject: PickupViewObject

    private let namespace: Namespace.ID

    // MARK: - Initializer

    init(
        pickupViewObject: PickupViewObject,
        tapGridViewAction: @escaping PickupGridView.TapGridViewAction,
        namespace: Namespace.ID
    ) {
        self.pickupViewObject = pickupViewObject
        self.tapGridViewAction = tapGridViewAction
        self.namespace = namespace
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            ZStack {
                LazyImage(url: URL(string: pickupViewObject.thumbnailUrl)) { imageState in
                    if let image = imageState.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .matchedTransitionSource(id: pickupViewObject.id, in: namespace)
                            .cornerRadius(8.0)
                    } else {
                        Color(uiColor: UIColor(code: "#dddddd"))
                            .cornerRadius(8.0)
                    }
                }
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.36))
                VStack {
                    Spacer()
                    HStack {
                        Text(pickupViewObject.title)
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8.0)
                            .padding(.bottom, 10.0)
                            .lineLimit(2)
                        Spacer()
                    }
                }
            }
            VStack {
                Text(pickupViewObject.summary)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8.0)
                    .padding(.bottom, 2.0)
                    .padding(.top, 8.0)
                    .lineSpacing(2.0)
                    .lineLimit(4)
            }
            Spacer()
        }
        // MEMO: タップ領域の確保とタップ時の処理
        .contentShape(Rectangle())
        .onTapGesture(perform: tapGridViewAction)
        .cornerRadius(8.0)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .stroke(Color.secondary.opacity(0.5))
        )
    }
}

#Preview {
    PickupGridView(
        pickupViewObject: PickupViewObject(
            id: 1,
            title: "ステーキの美味しいお店特集No.1🥩",
            summary: "ジューシーな絶品ステーキを堪能できる人気店を厳選。肉好き必見の注目情報が満載！香り高いソースや多彩な部位も徹底紹介！",
            thumbnailUrl: "https://media-reader-example.s3.ap-northeast-1.amazonaws.com/steak_image_example1.jpg",
            publishedAt: "2025-03-10T00:00:00.000Z"
        ),
        tapGridViewAction: {},
        namespace: Namespace().wrappedValue
    )
}
