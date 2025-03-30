//
//  InquireScreenView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/30.
//

import SwiftUI

struct InquireScreenView: View {

    // 遷移先から遷移元へ戻るために必要なPropertyWrapper
    @Environment(\.dismiss) private var popToPrevious
    
    var body: some View {
        NavigationStack {
            Text("おといあわせ!")
        }
        .navigationBarTitle("お問い合わせ", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action: {
                    // 前に表示している画面へ戻る処理をこのタイミングで実行する
                    popToPrevious()
                },
                label: {
                    // MEMO: 戻るボタンを自前で作成する
                    // ※iOS15までサポートしていたり、UIKitとの混合であればUINavigationControllerの方がいいかも...
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                }
            )
        )
    }
}

#Preview {
    InquireScreenView()
}
