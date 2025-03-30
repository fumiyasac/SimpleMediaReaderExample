//
//  PickupDetailView.swift
//  SimpleMediaReaderExample
//
//  Created by 酒井文也 on 2025/03/30.
//

import NukeUI
import SwiftUI
import ScalingHeaderScrollView

struct PickupDetailView: View {

    // MARK: - Property

    private let pickupViewObject: PickupViewObject

    private let animation: Namespace.ID

    // MARK: - Initializer

    init(
        pickupViewObject: PickupViewObject,
        animation: Namespace.ID
    ) {
        self.pickupViewObject = pickupViewObject
        self.animation = animation
    }

    // MARK: - Body

    var body: some View {
        ScalingHeaderScrollView {
            ZStack {
                LazyImage(url: URL(string: pickupViewObject.thumbnailUrl)) { imageState in
                    if let image = imageState.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .font(.system(size: 320))
                    } else {
                        Color(uiColor: UIColor(code: "#dddddd"))
                    }
                }
                .navigationTransition(.zoom(sourceID: pickupViewObject.id, in: animation))
                Rectangle()
                    .fill(.black.opacity(0.16))
            }
            .frame(height: 320.0)
        } content: {
            VStack(alignment: .leading, spacing: 0.0) {
                Group {
                    Text("こちらはアプリの使い方や応用的に活用する便利な方法を紹介するページです。お店の情報やストーリー等と共に様々なレストラン情報やお得な割引クーポン等を紹介していますので、是非使い倒して下さい。")
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.bottom, 12.0)
                    Text("Capter1:")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.gray)
                        .padding(.bottom, 8.0)
                    Text("（サンプル文章）こちらにはサンプルテキストが入ります。料理や食材に関する料理人のアピールポイントやこだわり、お店の特徴や口コミ等も掲載していますので、読み物としてだけではなく、お食事時に便利なクーポン情報の管理にも利用する事ができます。")
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.bottom, 12.0)
                    Image("pickup_slide1")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom, 12.0)
                    Text("Capter2:")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.gray)
                        .padding(.bottom, 8.0)
                    Text("（サンプル文章）こちらにはサンプルテキストが入ります。料理や食材に関する料理人のアピールポイントやこだわり、お店の特徴や口コミ等も掲載していますので、読み物としてだけではなく、お食事時に便利なクーポン情報の管理にも利用する事ができます。")
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.bottom, 12.0)
                    Image("pickup_slide2")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom, 12.0)
                    Text("Capter3:")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.gray)
                        .padding(.bottom, 8.0)
                    Text("（サンプル文章）こちらにはサンプルテキストが入ります。料理や食材に関する料理人のアピールポイントやこだわり、お店の特徴や口コミ等も掲載していますので、読み物としてだけではなく、お食事時に便利なクーポン情報の管理にも利用する事ができます。")
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.bottom, 12.0)
                    Image("pickup_slide3")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom, 12.0)
                    Text("Capter4:")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.gray)
                        .padding(.bottom, 8.0)
                    Text("（サンプル文章）こちらにはサンプルテキストが入ります。料理や食材に関する料理人のアピールポイントやこだわり、お店の特徴や口コミ等も掲載していますので、読み物としてだけではなく、お食事時に便利なクーポン情報の管理にも利用する事ができます。")
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.bottom, 12.0)
                    Image("pickup_slide4")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom, 12.0)
                }
            }
            .padding(16.0)
        }
        .height(min: 0.0, max: 320.0)
        .allowsHeaderCollapse()
        .allowsHeaderGrowth(true)
        .ignoresSafeArea(edges: [.top])
    }
}
