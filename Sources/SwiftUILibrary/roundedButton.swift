//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/22/20.
//

import Foundation
import SwiftUI

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