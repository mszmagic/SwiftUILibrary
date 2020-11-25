//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/11/25.
//

import SwiftUI

public struct TagsView: View {
    
    @Binding private var tags: [String]
    
    public init(tags: Binding<[String]>) {
        _tags = tags
    }
    
    public var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.blue))
                }
            }
        }
        
    }
    
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: .constant(["Tag 1", "Tag 2", "Tag 3"]))
            .padding()
    }
}
