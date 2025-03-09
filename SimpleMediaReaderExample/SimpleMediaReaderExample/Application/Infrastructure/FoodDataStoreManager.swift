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
        self.modelContainer = try! ModelContainer(for: FoodDataSource.self)
        self.modelContext = modelContainer.mainContext
    }

    // MARK: - Function

    func addFoodDataSource(foodDataSource: FoodDataSource) {
        modelContext.insert(foodDataSource)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchFoodDataSource() -> [FoodDataSource] {
        do {
            return try modelContext.fetch(FetchDescriptor<FoodDataSource>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeFoodDataSource(foodDataSource: FoodDataSource) {
        modelContext.delete(foodDataSource)
    }
}
