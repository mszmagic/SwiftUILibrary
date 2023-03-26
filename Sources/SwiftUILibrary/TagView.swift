//
//  SwiftUIView.swift
//  
//
//  Created by msz on 2023/02/02.
//

import SwiftUI

/**
 テキスト付きの単一のタグを表示します。
 */
@available(iOS 15.0, *)
@available(macOS 11, *)
@available(watchOS 7.0, *)
public struct TagView: View {
    
    public enum TagStyle {
        case borderedProminent
        case bordered
    }
    
    var tagContent: String
    var sfSymbolImageName: String
    
    var textFont: Font
    var textPadding: CGFloat
    
    var onTagSelected: (String) -> Void
    
    var tagBackgroundColor: Color
    
    var tagStyle: TagStyle
    
    public init(tagContent: String, tagBackgroundColor: Color = .blue, textFont: Font = .headline, textPadding: CGFloat = 8, style: TagStyle = .borderedProminent, sfSymbolImageName: String = "", onTagSelected: @escaping (String) -> Void = { _ in } ) {
        self.tagContent = tagContent
        self.textFont = textFont
        self.textPadding = textPadding
        self.onTagSelected = onTagSelected
        self.tagBackgroundColor = tagBackgroundColor
        self.tagStyle = style
        self.sfSymbolImageName = sfSymbolImageName
    }
    public var body: some View {
        Group {
            if sfSymbolImageName.isEmpty {
                Text(tagContent)
            } else {
                Label(tagContent, systemImage: sfSymbolImageName)
            }
        }
            .font(textFont)
            .foregroundColor((tagStyle == .borderedProminent) ? .white : tagBackgroundColor)
            .padding(textPadding)
#if os(iOS)
            .background(
                
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor((tagStyle == .borderedProminent) ? tagBackgroundColor : .init(uiColor: .systemGray6))
            )
#endif
            .onTapGesture(perform: {
                self.onTagSelected(tagContent)
            })
    }
}

@available(iOS 15.0, *)
@available(macOS 11, *)
@available(watchOS 7.0, *)
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tagContent: "Testing", sfSymbolImageName: "checkmark.circle")
        TagView(tagContent: "Testing", style: .bordered)
    }
}
