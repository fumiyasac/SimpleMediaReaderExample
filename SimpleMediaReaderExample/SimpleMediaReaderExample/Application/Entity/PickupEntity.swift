//
//  PickupEntity.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/03.
//

import Foundation

struct PickupEntity: Hashable, Decodable {
    
    // MARK: - Property

    let id: Int
    let title: String
    let summary: String
    let thumbnailUrl: String
    let publishedAt: String

    // MARK: - Enum

    private enum Keys: String, CodingKey {
        case id
        case title
        case summary
        case thumbnailUrl = "thumbnail_url"
        case publishedAt = "published_at"
    }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {

        // JSONの配列内の要素を取得する
        let container = try decoder.container(keyedBy: Keys.self)

        // JSONの配列内の要素にある値をDecodeして初期化する
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
    }

    // MARK: - Hashable

    // MEMO: Hashableプロトコルに適合させるための処理
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: PickupEntity, rhs: PickupEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
