//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/30/20.
//

import Foundation
import SwiftUI

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
                .padding(.leading, shouldCenter ? 0 : 30)
                .font(.headline)
            
            Text(labelTitle)
                .padding(.leading, 10)
                .font(.headline)
            
            if !shouldCenter {
                Spacer()
            }
            
        }
        
    }
    
}
