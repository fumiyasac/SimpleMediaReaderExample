//
//  FoodRowView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/17.
//

import SwiftUI

struct FoodRowView: View {

    // MARK: - Property

    private let foodViewObject: FoodViewObject

    // MARK: - Initializer

    init(foodViewObject: FoodViewObject) {
        self.foodViewObject = foodViewObject
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack(spacing: 0.0) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading) {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    let foodViewObject = FoodViewObject(
        id: 1,
        title: "グルメ写真サンプルNo.1🍙",
        category: "Food",
        summary: "グルメ写真アプリサンプルNo.1になります。美味しそうな写真と一緒に是非雰囲気を味わってみて下さい😋",
        thumbnailUrl: "https://media-reader-example.s3.ap-northeast-1.amazonaws.com/meals_image_example1.jpg",
        publishedAt: "2025-03-10 00:00:00.000",
        isFavorited: true
    )
    FoodRowView(foodViewObject: foodViewObject)
}
