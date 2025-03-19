//
//  FavoriteRowView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/20.
//

import NukeUI
import SwiftUI

struct FavoriteRowView: View {

    // MARK: - Property

    private let foodDataSource: FoodDataSource

    // MARK: - Initializer

    init(foodDataSource: FoodDataSource) {
        self.foodDataSource = foodDataSource
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack(alignment: .top, spacing: 0.0) {
                LazyImage(url: URL(string: foodDataSource.thumbnailUrl)) { imageState in
                    if let image = imageState.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 84.0, height: 56.0)
                            .cornerRadius(8.0)
                    } else {
                        Color(uiColor: UIColor(code: "#dddddd"))
                            .frame(width: 84.0, height: 56.0)
                            .cornerRadius(8.0)
                    }
                }
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(foodDataSource.title)
                        .font(.caption)
                        .fontWeight(.bold)
                    VStack {
                        Text(foodDataSource.category)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8.0)
                            .padding(.vertical, 2.0)
                    }
                    .background(.orange)
                    // MEMO: 角丸にしたい場合には.cornerRadiusと.overlayを両方設定する必要がある
                    .cornerRadius(16.0)
                    .padding(.vertical, 6.0)
                    Text(DateLabelFormatter.getDateStringFromAPI(apiDateString: foodDataSource.publishedAt))
                        .font(.caption)
                }
                .padding(.horizontal, 8.0)
                Spacer()
            }
            .padding(.horizontal, 4.0)
        }
    }
}

#Preview {
    let foodDataSource = FoodDataSource(
        targetFoodId: 1,
        title: "グルメ写真サンプルNo.1🍙",
        category: "Food",
        summary: "グルメ写真アプリサンプルNo.1になります。美味しそうな写真と一緒に是非雰囲気を味わってみて下さい😋",
        thumbnailUrl: "https://media-reader-example.s3.ap-northeast-1.amazonaws.com/meals_image_example1.jpg",
        publishedAt: "2025-03-10T00:00:00.000Z"
    )
    FavoriteRowView(foodDataSource: foodDataSource)
}
