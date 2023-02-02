//
//  FloatingView.swift
//  SakuraTravel App Clip
//
//  Created by Shunzhe Ma on R 2/12/16.
//  Copyright © Reiwa 2 Shunzhe Ma. All rights reserved.
//

import SwiftUI
import MapKit

#if os(iOS)

public enum FloatingViewPosition {
    case top
    case bottom
}

@available(iOS 13.0, *)
public extension View {
    /**
     SwiftUIビューに素早くオーバーレイを追加します。 `option`を押して、関数名`addOverlay`をクリックすると、この関数についてのさらなる詳細が表示されます。
     
     - parameter view: 追加したいオーバーレイビュー。
     - parameter floatingViewHeight: 追加されたフローティングオーバーレイ表示の高さ。
     - parameter position: オーバーレイ表示の位置。最上部または最下部。
     - parameter backgroundColor: オーバーレイ表示の背景色。`.clear` に設定して透明化することもできます。
     - parameter horizontalPadding: オーバーレイ表示の水平位置の補正。
     - parameter verticalOffset: オーバーレイビューの垂直オフセットです。
     - parameter isHidden: このオーバーレイビューが隠れているか表示されているかをコントロールします。
     
     # Example #
     ```
     Map(coordinateRegion: .constant(demoLocation))
         .addOverlay({
             HStack {
                 Spacer()
                 roundedButton(iconName: "magnifyingglass", buttonName: "Search", buttonColor: .blue)
             }
         }, floatingViewHeight: 50, position: .bottom, backgroundColor: .clear, horizontalPadding: 30, verticalOffset: 30)
     ```
     
     */
    func addOverlay<Content:View>(@ViewBuilder _ view: @escaping () -> Content?, floatingViewHeight: CGFloat, position: FloatingViewPosition, backgroundColor: Color, horizontalPadding: CGFloat = 0, verticalOffset: CGFloat = 0, isHidden: Bool = false) -> some View {
        return ZStack {
            self
            if !isHidden {
                GeometryReader(content: { geometry in
                    RoundedRectangle(cornerRadius: 10)
                        .size(width: geometry.size.width - horizontalPadding * 2, height: floatingViewHeight)
                        .offset(x: horizontalPadding, y: (position == .bottom) ? (geometry.size.height - (floatingViewHeight - 50 + verticalOffset)) : verticalOffset)
                        .foregroundColor(backgroundColor)
                })
                VStack {
                    if position == .bottom {
                        Spacer()
                        view()
                            .padding(.horizontal, horizontalPadding)
                            .padding(.bottom, verticalOffset)
                    }
                    if position == .top {
                        view()
                            .padding(.horizontal, horizontalPadding)
                            .padding(.top, verticalOffset)
                        Spacer()
                    }
                }
            }
        }
    }
}

@available(iOS 15, *)
struct SwiftUIAddOverlay_Previews: PreviewProvider {
    static var previews: some View {
        let demoLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.672366, longitude: 139.766033), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        Map(coordinateRegion: .constant(demoLocation))
            .ignoresSafeArea()
            .addOverlay({
                HStack {
                    Spacer()
                    TagView(tagContent: "リスト", textFont: .title2, textPadding: 10)
                    Spacer()
                }
            }, floatingViewHeight: 50, position: .top, backgroundColor: .clear, horizontalPadding: 30, verticalOffset: 80)
            .addOverlay({
                SearchTextFieldView(searchText: .constant(""))
            }, floatingViewHeight: 50, position: .top, backgroundColor: .clear)
    }
}

#endif
