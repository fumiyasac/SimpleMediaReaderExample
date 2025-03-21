//
//  ExecutingConnectionView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/21.
//

import SwiftUI

struct ExecutingConnectionView: View {

    // MARK: - Body

    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            VStack {
                Text("読み込み中です...")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 4.0)
                LoadingIndicatorViewRepresentable(isLoading: .constant(true))
            }
            .frame(width: 122.0, height: 88.0)
            // MEMO: VStack自体に囲み線をつける対応
            // https://ios-docs.dev/stack-border/
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(.gray, lineWidth: 1.0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            Spacer()
        }
    }
}

#Preview {
    ExecutingConnectionView()
}
