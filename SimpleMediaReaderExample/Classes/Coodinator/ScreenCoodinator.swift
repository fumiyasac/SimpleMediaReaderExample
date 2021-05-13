//
//  ScreenCoodinator.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2021/05/13.
//

import Foundation

// 画面遷移の表示内容や遷移先を決めるためのScreenCoodinatorプロトコル
// 参考: https://medium.com/better-programming/leverage-the-coordinator-design-pattern-in-swift-5-cd5bb9e78e12

protocol ScreenCoordinator {

    // 任意の画面へ遷移するための遷移先定義における具体的な内容を決める
    func start()

    // 画面遷移処理の前段となる処理を定義する
    func coordinate(to coordinator: ScreenCoordinator)
}

// MARK: - ScreenCoordinator

extension ScreenCoordinator {

    // MEMO: ScreenCoodinatorプロトコルを適合したクラスを経由して画面を組み立てていく点がポイント
    func coordinate(to coordinator: ScreenCoordinator) {
        coordinator.start()
    }
}
