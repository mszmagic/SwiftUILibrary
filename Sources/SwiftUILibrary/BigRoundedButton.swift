//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/22/20.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
public struct BigRoundedButton: View {
    var systemIconName: String
    var buttonName: String
    var backgroundOpacity: Double = 0.8
    var buttonColor: Color
    
    public init(systemIconName: String, buttonName: String, backgroundOpacity: Double = 0.8, buttonColor: Color) {
        self.systemIconName = systemIconName
        self.buttonName = buttonName
        self.backgroundOpacity = backgroundOpacity
        self.buttonColor = buttonColor
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 60, alignment: .center)
                .foregroundColor(buttonColor)
                .opacity(backgroundOpacity)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            HStack {
                Image(systemName: systemIconName)
                    .foregroundColor(.white)
                Text(buttonName)
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
    
}

@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
struct BigRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        BigRoundedButton(systemIconName: "arkit", buttonName: "ARKit", buttonColor: .blue)
            .padding()
    }
}
