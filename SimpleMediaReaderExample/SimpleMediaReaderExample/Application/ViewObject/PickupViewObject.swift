//
//  PickupViewObject.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/26.
//

// MARK: - ViewObject

struct PickupViewObject: Identifiable, Equatable {

    // MARK: - Property

    let id: Int
    let title: String
    let summary: String
    let thumbnailUrl: String
    let publishedAt: String

    // MARK: - Equatable

    static func == (lhs: PickupViewObject, rhs: PickupViewObject) -> Bool {
        return lhs.id == rhs.id
    }
}
