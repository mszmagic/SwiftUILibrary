//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/12/23.
//

import SwiftUI

public struct SearchTextFieldView: View {
    
    @Binding private var searchText: String
    private var placeHolderText: String
    
    @State private var isEditing: Bool = false
    
    private var textFieldOnEditingChanged: (Bool) -> Void
    private var textFieldOnCommit: () -> Void
    
    public init(searchText: Binding<String>,
                placeHolderText: String = "検索キーワード",
                onEditingChanged: @escaping (Bool) -> Void = {_ in},
                onCommit: @escaping () -> Void = {}) {
        self._searchText = searchText
        self.placeHolderText = placeHolderText
        self.textFieldOnEditingChanged = onEditingChanged
        self.textFieldOnCommit = onCommit
    }
    
    public var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
                .foregroundColor(.init(.systemGray6))
            if searchText.isEmpty {
                Text(placeHolderText)
                    .foregroundColor(.init(UIColor.darkGray))
            }
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("", text: $searchText, onEditingChanged: self.textFieldOnEditingChanged, onCommit: self.textFieldOnCommit)
                if searchText.count > 0 {
                    Spacer()
                    Button(action: {
                        self.searchText = ""
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.init(UIColor.darkGray))
                    })
                }
            }
            .padding()
        }
        .padding(.horizontal, 20)
        
    }
    
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(searchText: .constant(""))
    }
}
