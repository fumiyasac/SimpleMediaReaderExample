//
//  AppConstants.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2021/05/13.
//

import Foundation
import UIKit

// MEMO: 本当はXcodeGen等を利用して自動生成できた方が良い
// https://github.com/SwiftGen/SwiftGen

struct Constants {

    // MARK: - Struct

    // このUI実装サンプルで利用する各種カラー定義
    struct Colors {
        static let primary: UIColor = UIColor(code: "#ffa000")
        static let navigationBarTitle: UIColor = UIColor.white
    }

    // このUI実装サンプルで利用する各種フォント定義
    struct Fonts {
        static let navigationBarTitle: UIFont = UIFont(name: "HiraginoSans-W6", size: 14.0)!
    }

    // このUI実装サンプルで利用するTabBar画面用デザイン定義
    struct TabBarStyles {
        static let itemSize = CGSize(width: 28.0, height: 28.0)
        static let normalColor: UIColor = UIColor.lightGray
        static let selectedColor: UIColor = Colors.primary
        static let tabBarItemFont = UIFont(name: "HelveticaNeue-Medium", size: 10)!

        // MEMO: タブの選択時・非選択時の色とアイコンのサイズを決める
        // UITabBarItem用のAttributeを決める
        static let normalAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: normalColor
        ]
        static let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: tabBarItemFont,
            NSAttributedString.Key.foregroundColor: selectedColor
        ]
    }
}
