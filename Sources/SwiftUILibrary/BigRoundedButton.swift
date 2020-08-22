//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/22/20.
//

import Foundation
import SwiftUI

struct bigRoundedButton: View {
    var iconName: String
    var buttonName: String
    var backgroundOpacity: Double = 0.8
    var buttonColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 60, alignment: .center)
                .foregroundColor(buttonColor)
                .opacity(backgroundOpacity)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                Text(buttonName)
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}
