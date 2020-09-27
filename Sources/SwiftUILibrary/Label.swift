//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/30/20.
//

import Foundation
import SwiftUI

@available(iOS, introduced: 13.0, deprecated: 14.0)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
public struct Label: View {
    
    private var systemIconName: String
    private var labelTitle: String
    private var shouldCenter: Bool
    
    public init(systemIconName: String, labelTitle: String, shouldCenter: Bool = true) {
        self.systemIconName = systemIconName
        self.labelTitle = labelTitle
        self.shouldCenter = shouldCenter
    }
    
    public var body: some View {
        
        HStack {
            
            Image(systemName: systemIconName)
                .font(.headline)
                .padding(.leading, shouldCenter ? 0 : 30)
            
            Text(labelTitle)
                .padding(.leading, 10)
                .font(.headline)
            
            if !shouldCenter {
                Spacer()
            }
            
        }
        
    }
    
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Label(localIconName: "miscellaneous.png", labelTitle: "ARKit")
    }
}
