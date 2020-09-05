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
public struct RoundedIconDisplay: View {
    
    private var isSystemIcon: Bool
    private var iconName: String
    
    public init(isSystemIcon: Bool, iconName: String) {
        self.isSystemIcon = isSystemIcon
        self.iconName = iconName
    }
    
    public var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 60)
                .foregroundColor(.black)
            
            if self.isSystemIcon {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .font(.title)
            } else if (UIImage(named: iconName) != nil) {
                Image(uiImage: UIImage(named: iconName)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 38, height: 38)
            }
            
        }
        .padding(.horizontal, 5)
        
    }
    
}
