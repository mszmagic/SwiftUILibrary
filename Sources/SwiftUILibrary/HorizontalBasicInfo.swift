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
public struct HorizontalBasicInfo: View {
    
    private var title: String
    private var content: String
    
    public init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        
        HStack {
            
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Text(content)
                .multilineTextAlignment(.trailing)
            
        }
        
    }
    
}
