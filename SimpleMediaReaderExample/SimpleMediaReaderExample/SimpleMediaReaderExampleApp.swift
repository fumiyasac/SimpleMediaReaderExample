//
//  SimpleMediaReaderExampleApp.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2024/09/12.
//

import SwiftUI

@main
struct SimpleMediaReaderExampleApp: App {

    // MEMO: AppDelegateでの適用できる形にするための定義
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
