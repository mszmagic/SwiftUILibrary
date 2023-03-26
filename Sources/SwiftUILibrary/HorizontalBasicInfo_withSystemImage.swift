//
//  SwiftUIView.swift
//  
//
//  Created by Sora on 2022/06/30.
//

import SwiftUI

@available(iOS 14.0, *)
@available(macOS 11.0, *)
@available(watchOS 7.0, *)
public struct HorizontalBasicInfo_withSystemImage: View {
    
    private var systemImageName: String
    private var title: String
    private var content: String
    
    public init(title: String, content: String, systemImageName: String) {
        self.title = title
        self.content = content
        self.systemImageName = systemImageName
    }
    
    public var body: some View {
        
        HStack {
            
            Label(title, systemImage: systemImageName)
                .font(.headline)
            
            Spacer()
            
            Text(content)
                .multilineTextAlignment(.trailing)
            
        }
        
    }
    
}

