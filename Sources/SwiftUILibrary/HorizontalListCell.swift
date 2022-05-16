//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/30/20.
//

#if os(iOS)

import Foundation
import SwiftUI
import UIKit

@available(iOS 13.0, *)
public enum ImageSource {
    case systemIconName(String)
    case localIconName(String)
    case imageObj(UIImage)
}

@available(iOS 13.0, *)
public struct HorizontalListCell: View {
    
    private var imgSource: ImageSource
    private var title: String
    private var subtitle: String
    private var subtitle2: String
    private var actionLabel: String
    
    public init(systemIconName: String, title: String, subtitle: String, subtitle2: String, actionLabel: String) {
        self.imgSource = .systemIconName(systemIconName)
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.actionLabel = actionLabel
    }
    
    public init(fileIconName: String, title: String, subtitle: String, subtitle2: String, actionLabel: String) {
        self.imgSource = .localIconName(fileIconName)
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.actionLabel = actionLabel
    }
    
    public init(imageObj: UIImage, title: String, subtitle: String, subtitle2: String, actionLabel: String) {
        self.imgSource = .imageObj(imageObj)
        self.title = title
        self.subtitle = subtitle
        self.subtitle2 = subtitle2
        self.actionLabel = actionLabel
    }
    
    public var body: some View {
        
        HStack {
            
            switch imgSource {
            case .systemIconName(let string):
                RoundedIconDisplay(isSystemIcon: true, iconName: string)
                    .padding(.leading, 5)
            case .localIconName(let string):
                RoundedIconDisplay(isSystemIcon: false, iconName: string)
                    .padding(.leading, 5)
            case .imageObj(let uIImage):
                Image(uiImage: uIImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .padding(.leading, 5)
            }
            
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

@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
struct HorizontalListCell_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            HorizontalListCell(systemIconName: "bag.fill", title: "Title", subtitle: "Subtitle", subtitle2: "Subtitle 2", actionLabel: "Label")
        }
    }
}

#endif
