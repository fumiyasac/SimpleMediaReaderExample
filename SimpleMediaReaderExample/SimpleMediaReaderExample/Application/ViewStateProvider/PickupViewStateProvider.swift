//
//  PickupViewStateProvider.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/29.
//

import Foundation
import Observation

@Observable
final class PickupViewStateProvider {

    // MARK: - Property (Dependency)

    private let pickupRepository: PickupRepositoryProtocol

    // MARK: - Property (Computed)

    private var _isLoading: Bool = false
    private var _errorMessage: String?
    private var _pickupViewObjects: [PickupViewObject] = []
    
    // MARK: - Property (`@Observable`)

    var isLoading: Bool {
        _isLoading
    }

    var errorMessage: String? {
        _errorMessage
    }

    var pickupViewObjects: [PickupViewObject] {
        _pickupViewObjects
    }

    // MARK: - Initializer

    @MainActor
    init(pickupRepository: PickupRepositoryProtocol = PickupRepository()) {
        self.pickupRepository = pickupRepository
    }

    // MARK: - Function

    @MainActor
    func fetchInitialPickups() {

        // Loading状態にする＆初回読み込み実行時はpage番号をリセットする
        _isLoading = true

        Task {
            do {
                let pickupsPerPage = try await pickupRepository.fetchPickups()
                _pickupViewObjects = pickupsPerPage.map {
                    PickupViewObject(
                        id: $0.id,
                        title: $0.title,
                        summary: $0.summary,
                        thumbnailUrl: $0.thumbnailUrl,
                        publishedAt: $0.publishedAt
                    )
                }
                _errorMessage = nil

            } catch {
                _errorMessage = """
                初回情報の取得に失敗しました。
                """
            }
        }
        
        // 処理が完了した後にはLoading状態を元に戻す
        _isLoading = false
    }
}
