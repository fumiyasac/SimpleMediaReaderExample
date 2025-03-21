//
//  ConnectionErrorView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/21.
//

import SwiftUI

struct ConnectionErrorView: View {

    // MARK: - Typealias

    typealias TapButtonAction = () -> Void

    // MARK: - Property

    private var tapButtonAction: TapButtonAction

    // MARK: - Initializer

    init(tapButtonAction: @escaping ConnectionErrorView.TapButtonAction) {
        self.tapButtonAction = tapButtonAction
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            VStack {
                Text("エラー: 画面表示に失敗しました")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.bottom, 16.0)
                HStack {
                    Text("ネットワークの接続エラー等の要因でデータを取得することができなかった可能性があります。通信の良い環境等で再度のリクエスト実行をお試し下さい。またそれでも解決しない場合には、運営へのお問い合わせをお手数ですが宜しくお願い致します。")
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Spacer()
                    Button(
                        action: tapButtonAction, label: {
                        // MEMO: 縁取りをした角丸ボタンのための装飾
                        Text("再度リクエストを実行する")
                            .font(.callout)
                            .foregroundColor(Color(uiColor: UIColor(code: "#985e41")))
                            .background(.white)
                            .frame(width: 240.0, height: 48.0)
                            .cornerRadius(24.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24.0)
                                    .stroke(Color(uiColor: UIColor(code: "#985e41")), lineWidth: 1.0)
                            )
                    })
                    Spacer()
                }
                .padding(.vertical, 24.0)
            }
            Spacer()
        }
        .padding(.horizontal, 12.0)
    }
}

#Preview {
    ConnectionErrorView(tapButtonAction: {})
}
