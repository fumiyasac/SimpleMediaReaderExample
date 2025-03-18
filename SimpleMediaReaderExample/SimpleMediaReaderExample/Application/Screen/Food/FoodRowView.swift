//
//  FoodRowView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/17.
//

import NukeUI
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 16.0)
                            .stroke(.white, lineWidth: 1.0)
                    )
                    .padding(.vertical, 6.0)
                    Text(DateLabelFormatter.getDateStringFromAPI(apiDateString: foodViewObject.publishedAt))
                        .font(.footnote)
                }
                .padding(.horizontal, 8.0)
            }
            .padding(.horizontal, 8.0)
            HStack(spacing: 0.0) {
                Text(foodViewObject.summary)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .lineLimit(3)
                Spacer()
                Button(action: {
                    
                }, label: {
                    if foodViewObject.isFavorited {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                })
                .foregroundStyle(.yellow)
                .buttonStyle(PlainButtonStyle())
                .frame(width: 36.0, height: 36.0)
            }
            .padding(.horizontal, 8.0)
            .padding(.vertical, 8.0)
            Divider()
                .background(.gray)
                .padding(.horizontal, 8.0)
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
        isFavorited: false
    )
    FoodRowView(foodViewObject: foodViewObject)
}
