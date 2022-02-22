//
//  SelectableTagView.swift
//  
//
//  Created by Shunzhe on 2022/02/22.
//

import SwiftUI

public struct SelectableTagView: View {
    
    @Binding var isTagSelected: Bool
    
    var tagContent: String
    
    var textFont: Font
    var textPadding: CGFloat
    var styleColor: Color
    
    var onTagSelected: (String) -> Void
    
    public init(tagContent: String, textFont: Font = .headline, textPadding: CGFloat = 10, styleColor: Color = .blue, isTagSelected: Binding<Bool>, onTagSelected: @escaping (String) -> Void = { _ in } ) {
        self.tagContent = tagContent
        self.textFont = textFont
        self.textPadding = textPadding
        self.onTagSelected = onTagSelected
        self.styleColor = styleColor
        self._isTagSelected = isTagSelected
    }
    
    public var body: some View {
        Text(tagContent)
            .font(textFont)
            .foregroundColor(isTagSelected ? .white : styleColor)
            .padding(textPadding)
            .background(RoundedRectangle(cornerRadius: 16).foregroundColor(isTagSelected ? styleColor : .white))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(styleColor, lineWidth: 2)
            )
            .onTapGesture(perform: {
                self.onTagSelected(tagContent)
            })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SelectableTagView(tagContent: "Selected Button", isTagSelected: .constant(true))
            SelectableTagView(tagContent: "Normal Button", isTagSelected: .constant(false))
        }
    }
}
