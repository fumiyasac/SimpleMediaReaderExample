//
//  FoodPageEntity.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/02/26.
//

import Foundation

struct FoodPageEntity: Hashable, Decodable, Sendable {

    // MARK: - Property

    private let uuid = UUID()

    let page: Int
    let hasNextPage: Bool
    let food: [FoodEntity]
    
    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case page
        case hasNextPage = "has_next_page"
        case food
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.page = try container.decode(Int.self, forKey: .page)
        self.hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        self.food = try container.decode([FoodEntity].self, forKey: .food)
    }
    // MARK: - Hashable

    // MEMO: Hashableプロトコルに適合させるための処理
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    static func == (lhs: FoodPageEntity, rhs: FoodPageEntity) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

