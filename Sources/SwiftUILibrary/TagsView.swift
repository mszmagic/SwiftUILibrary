//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/11/25.
//

import SwiftUI

/**
 テキスト付きの単一のタグを表示します。
 */
@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
public struct TagView: View {
    
    var tagContent: String
    
    var textFont: Font
    var textPadding: CGFloat
    
    var onTagSelected: (String) -> Void
    
    var tagBackgroundColor: Color
    
    public init(tagContent: String, tagBackgroundColor: Color = .blue, textFont: Font = .headline, textPadding: CGFloat = 5, onTagSelected: @escaping (String) -> Void = { _ in } ) {
        self.tagContent = tagContent
        self.textFont = textFont
        self.textPadding = textPadding
        self.onTagSelected = onTagSelected
        self.tagBackgroundColor = tagBackgroundColor
    }
    public var body: some View {
        Text(tagContent)
            .font(textFont)
            .foregroundColor(.white)
            .padding(textPadding)
            .background(RoundedRectangle(cornerRadius: 6).foregroundColor(tagBackgroundColor))
            .onTapGesture(perform: {
                self.onTagSelected(tagContent)
            })
    }
}

@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
public struct TagsView: View {
    
    @Binding private var tags: [String]
    var onTagSelected: (String) -> Void
    
    public init(tags: Binding<[String]>, onTagSelected: @escaping (String) -> Void = { _ in } ) {
        _tags = tags
        self.onTagSelected = onTagSelected
    }
    
    public var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    TagView(tagContent: tag, onTagSelected: self.onTagSelected)
                }
            }
        }
        
    }
    
}

@available(iOS 13.0, *)
@available(macOS 11, *)
@available(watchOS 6.0, *)
struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: .constant(["Tag 1", "Tag 2", "Tag 3"]))
            .padding()
    }
}
