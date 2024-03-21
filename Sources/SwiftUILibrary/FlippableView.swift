//
//  FlippableView.swift
//  AIVocabularyBook
//
//  Created by Msz on 2023/05/10.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
public struct FlippableView<Front: View, Back: View>: View {
    
    var cardFrontView: Front
    var cardBackView: Back
    
    @State private var isFlipped = false
    private let animationDuration = 0.3
    
    public init(@ViewBuilder front: () -> Front, @ViewBuilder back: () -> Back) {
        self.cardFrontView = front()
        self.cardBackView = back()
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ZStack {
                if isFlipped {
                    cardBackView
                        .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                } else {
                    cardFrontView
                }
            }
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.easeInOut(duration: animationDuration), value: isFlipped)
            .onTapGesture {
                withAnimation {
                    self.isFlipped.toggle()
                }
            }
            Spacer()
        }
    }
}


struct FlippableView_Previews: PreviewProvider {
    static var previews: some View {
        FlippableView {
            Text("Front of card")
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
        } back: {
            Text("Back of card")
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.red))
        }

    }
}
