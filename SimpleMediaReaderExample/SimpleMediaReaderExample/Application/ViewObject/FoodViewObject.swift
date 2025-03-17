//
//  FoodViewObject.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/17.
//

import Foundation

// MARK: - ViewObject

struct FoodViewObject: Identifiable, Equatable {

    // MARK: - Property

    let id: Int
    let title: String
    let category: String
    let summary: String
    let thumbnailUrl: String
    let publishedAt: String
    // MEMO: 表示処理時点でのハートマークの状態を示す
    var isFavorited: Bool = false

    // MARK: - Equatable

    static func == (lhs: FoodViewObject, rhs: FoodViewObject) -> Bool {
        return lhs.id == rhs.id
    }
}
