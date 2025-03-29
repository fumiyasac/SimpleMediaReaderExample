//
//  PickupDetailView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/30.
//

import NukeUI
import SwiftUI

struct PickupDetailView: View {

    @Environment(\.dismiss) var dismiss

    var pickupViewObject: PickupViewObject
    var animation: Namespace.ID

    var body: some View {
        ScrollView {
            HStack {
                Button(action: {
                    dismiss()
                    print("Button pressed")
                }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Text("Back")
                }
              }
                Spacer()
            }
            
            LazyImage(url: URL(string: pickupViewObject.thumbnailUrl)) { imageState in
                if let image = imageState.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .font(.system(size: 270))
                } else {
                    Color(uiColor: UIColor(code: "#dddddd"))
                }
            }
            .navigationTransition(.zoom(sourceID: pickupViewObject.id, in: animation))

            Text("スポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツ")
            Text("スポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツ")
            Text("スポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツスポーツ")
        
        }
    }
}

//#Preview {
//    PickupDetailView()
//}
