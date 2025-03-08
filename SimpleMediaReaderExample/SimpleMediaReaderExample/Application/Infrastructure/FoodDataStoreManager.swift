//
//  FoodDataStoreManager.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/09.
//

import Foundation
import SwiftData

final class FoodDataStoreManager {

    // MARK: - Property

    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    // MARK: - Singleton Instance

    @MainActor
    static let shared = FoodDataStoreManager()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Item.self)
        self.modelContext = modelContainer.mainContext
    }

    // MARK: - Function

    func appendItem(item: Item) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchItems() -> [Item] {
        do {
            return try modelContext.fetch(FetchDescriptor<Item>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeItem(_ item: Item) {
        modelContext.delete(item)
    }
}
