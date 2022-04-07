//
//  File.swift
//  
//
//  Created by Shunzhe on 2022/04/07.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
@available(watchOS 6.0, *)
public extension View {
    @ViewBuilder
    func centered() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    @ViewBuilder
    func leadingAligned() -> some View {
        HStack {
            self
            Spacer()
        }
    }
}


