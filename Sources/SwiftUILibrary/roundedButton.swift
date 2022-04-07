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
public struct roundedButton: View {
    var iconName: String
    var buttonName: String
    var buttonColor: Color
    
    public init(iconName: String, buttonName: String, buttonColor: Color) {
        self.iconName = iconName
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
                Image(systemName: iconName)
                    .font(.largeTitle)
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
@available(macOS 11, *)
@available(watchOS 6.0, *)
struct roundedButton_Previews: PreviewProvider {
    static var previews: some View {
        roundedButton(iconName: "arkit", buttonName: "ARKit", buttonColor: .blue)
            .padding()
    }
}
