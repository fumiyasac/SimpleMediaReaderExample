//
//  FoodDataSource.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/09.
//

import Foundation
import SwiftData

@Model
final class Item {

    // MARK: - Property

    var title: String
    var category: String
    var summary: String
    var thumbnailUrl: String
    var publishedAt: String

    // MARK: - Initializer

    init(
        title: String,
        category: String,
        summary: String,
        thumbnailUrl: String,
        publishedAt: String
    ) {
        self.title = title
        self.category = category
        self.summary = summary
        self.thumbnailUrl = thumbnailUrl
        self.publishedAt = publishedAt
    }
}
