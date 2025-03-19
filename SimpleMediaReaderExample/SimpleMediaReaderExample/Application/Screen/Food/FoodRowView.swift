//
//  FoodRowView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/17.
//

import NukeUI
import SwiftUI

struct FoodRowView: View {

    // MARK: - Typealias

    typealias TapIsFavoritedButtonAction = (Bool) -> Void

    // MARK: - Property

    // Favoriteボタン（ハート型ボタン要素）の状態を管理するための変数
    @State private var isFavorited: Bool = false

    private var tapIsFavoritedButtonAction: FoodRowView.TapIsFavoritedButtonAction

    private let foodViewObject: FoodViewObject

    // MARK: - Initializer

    init(
        foodViewObject: FoodViewObject,
        tapIsFavoritedButtonAction: @escaping FoodRowView.TapIsFavoritedButtonAction
    ) {
        self.foodViewObject = foodViewObject
        self.tapIsFavoritedButtonAction = tapIsFavoritedButtonAction
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack(alignment: .top, spacing: 0.0) {
                LazyImage(url: URL(string: foodViewObject.thumbnailUrl)) { imageState in
                    if let image = imageState.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96.0, height: 64.0)
                            .cornerRadius(8.0)
                    } else {
                        Color(uiColor: UIColor(code: "#dddddd"))
                            .frame(width: 96.0, height: 64.0)
                            .cornerRadius(8.0)
                    }
                }
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(foodViewObject.title)
                        .font(.callout)
                        .fontWeight(.bold)
                    VStack {
                        Text(foodViewObject.category)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8.0)
                            .padding(.vertical, 2.0)
                    }
                    .background(.orange)
                    // MEMO: 角丸にしたい場合には.cornerRadiusと.overlayを両方設定する必要がある
                    .cornerRadius(16.0)
                    .padding(.vertical, 6.0)
                    Text(DateLabelFormatter.getDateStringFromAPI(apiDateString: foodViewObject.publishedAt))
                        .font(.caption)
                }
                .padding(.horizontal, 8.0)
            }
            .padding(.top, 12.0)
            .padding(.horizontal, 12.0)
            HStack(spacing: 0.0) {
                Text(foodViewObject.summary)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(3)
                Spacer()
                Button(action: {
                    isFavorited = !isFavorited
                    tapIsFavoritedButtonAction(isFavorited)
                }, label: {
                    // TODO: お気に入り処理をSwiftDataで実施するための処理後に元に戻す
                    //if foodViewObject.isFavorited {
                    if isFavorited {
                        Image(systemName: "suit.heart.fill")
                    } else {
                        Image(systemName: "suit.heart")
                    }
                })
                .foregroundStyle(.pink)
                .buttonStyle(PlainButtonStyle())
                .frame(width: 36.0, height: 36.0)
            }
            .padding(.horizontal, 12.0)
            .padding(.top, 6.0)
            .padding(.bottom, 10.0)
            Divider()
                .background(.gray)
                .padding(.horizontal, 12.0)
                .padding(.vertical, 0.0)
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
        publishedAt: "2025-03-10T00:00:00.000Z",
        isFavorited: false
    )
    FoodRowView(
        foodViewObject: foodViewObject,
        tapIsFavoritedButtonAction: { _ in }
    )
}
