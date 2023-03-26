//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/11/25.
//

import SwiftUI

@available(iOS 15.0, *)
@available(macOS 11, *)
@available(watchOS 7.0, *)
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

@available(iOS 15.0, *)
@available(macOS 11, *)
@available(watchOS 7.0, *)
struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: .constant(["Tag 1", "Tag 2", "Tag 3"]))
            .padding()
    }
}
