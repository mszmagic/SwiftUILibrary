//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/30/20.
//

import Foundation
import SwiftUI

public struct HorizontalListCell: View {
    
    // Image
    private var isSystemIcon: Bool
    private var iconName: String
    
    private var title: String
    private var subtitle: String
    private var subtitle2: String
    private var actionLabel: String
    
    public init(systemIconName: String, title: String, subtitle: String, subtitle2: String, actionLabel: String) {
        self.isSystemIcon = true
        self.iconName = systemIconName
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.actionLabel = actionLabel
    }
    
    public init(fileIconName: String, title: String, subtitle: String, subtitle2: String, actionLabel: String) {
        self.isSystemIcon = false
        self.iconName = fileIconName
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.actionLabel = actionLabel
    }
    
    public var body: some View {
        
        HStack {
            
            RoundedIconDisplay(isSystemIcon: isSystemIcon, iconName: iconName)
                .padding(.leading, 5)
            
            VStack(alignment: .leading, spacing: 3) {
                
                if title != "" {
                    Text(title)
                        .font(.headline)
                        .padding(.top, 6)
                        .foregroundColor(.white)
                }
                
                if subtitle != "" {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                if subtitle2 != "" {
                    Text(subtitle2)
                        .foregroundColor(.white)
                        .padding(.bottom, 6)
                }
                
            }
            
            Spacer()
            
            Text(actionLabel)
                .foregroundColor(.white)
                .padding(.trailing, 20)
            
        }
        .padding(6)
        .background(Color(.darkGray))
        .cornerRadius(20)
        .shadow(radius: 3)
        
    }
    
}
