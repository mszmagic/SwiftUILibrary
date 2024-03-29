//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/30/20.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
public struct roundedButtonWithLargeLabels: View {
    var largeLabel: String
    var buttonName: String
    var buttonColor: Color
    
    public init(largeLabel: String, buttonName: String, buttonColor: Color) {
        self.largeLabel = largeLabel
        self.buttonName = buttonName
        self.buttonColor = buttonColor
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 90, height: 90, alignment: .center)
                .foregroundColor(buttonColor)
                .opacity(0.8)
            VStack {
                Text(largeLabel)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Text(buttonName)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
    
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
struct roundedButtonWithLargeLabels_Previews: PreviewProvider {
    static var previews: some View {
        roundedButtonWithLargeLabels(largeLabel: "ノヒー", buttonName: "猫の名前", buttonColor: .blue)
            .padding()
    }
}
