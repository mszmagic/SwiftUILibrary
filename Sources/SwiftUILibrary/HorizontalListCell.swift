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
                }
                
                if subtitle != "" {
                    Text(subtitle)
                        .font(.subheadline)
                }
                
                if subtitle2 != "" {
                    Text(subtitle2)
                        .padding(.bottom, 6)
                }
                
            }
            
            Spacer()
            
            Text(actionLabel)
                .padding(.trailing, 20)
            
        }
        
    }
    
}

struct HorizontalListCell_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            HorizontalListCell(systemIconName: "bag.fill", title: "Title", subtitle: "Subtitle", subtitle2: "Subtitle 2", actionLabel: "Label")
        }
    }
}
