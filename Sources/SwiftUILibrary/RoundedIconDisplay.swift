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
public struct RoundedIconDisplay: View {
    
    private var isSystemIcon: Bool
    private var iconName: String
    
    private var backgroundColor: Color
    private var iconColor: Color
    
    public init(isSystemIcon: Bool, iconName: String, backgroundColor: Color = .black, iconColor: Color = .white) {
        self.isSystemIcon = isSystemIcon
        self.iconName = iconName
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
    }
    
    public var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 60)
                .foregroundColor(backgroundColor)
            
            if self.isSystemIcon {
                Image(systemName: iconName)
                    .foregroundColor(iconColor)
                    .font(.title)
            } else if (UIImage(named: iconName) != nil) {
                Image(uiImage: UIImage(named: iconName)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(iconColor)
                    .frame(width: 38, height: 38)
            }
            
        }
        .padding(.horizontal, 5)
        
    }
    
}

struct RoundedIconDisplay_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconDisplay(isSystemIcon: true, iconName: "arkit")
            .padding()
    }
}
