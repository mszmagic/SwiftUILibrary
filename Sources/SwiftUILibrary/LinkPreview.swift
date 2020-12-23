//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/12/23.
//

import SwiftUI
import LinkPresentation

@available(iOS 14.0, *)
public struct LinkPreview: View {
    
    @State var loaded: Bool = false
    @State var pageTitle: String
    @State var pageURLStr: String
    @State var pageImage: UIImage? = nil
    
    private var link: URL
    private var onTappingLink: (URL) -> Void
    // (title, url)
    private var onMetadataFetched: (String, String) -> Void
    
    public init(link: URL, onTappingLink: @escaping (URL) -> Void, onMetadataFetched: @escaping (String, String) -> Void) {
        self.link = link
        _pageTitle = .init(initialValue: "URL")
        _pageURLStr = .init(initialValue: link.absoluteString)
        self.onTappingLink = onTappingLink
        self.onMetadataFetched = onMetadataFetched
    }
    
    public var body: some View {
        
        Section {
            if let loadedImage = self.pageImage {
                HStack {
                    Spacer()
                    Image(uiImage: loadedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(6)
                        .padding(3)
                    Spacer()
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    if !loaded {
                        ProgressView()
                            .padding(.horizontal, 3)
                    }
                    Text(self.pageTitle)
                        .font(.title3)
                        .padding(3)
                }
                Text(self.pageURLStr)
                    .font(.headline)
                    .padding(.bottom, 3)
            }
        }
        .onTapGesture {
            self.onTappingLink(self.link)
        }
        .onAppear(perform: {
            let provider = LPMetadataProvider()
            provider.startFetchingMetadata(for: link) { (meta, error) in
                if let metadata = meta {
                    self.pageTitle = metadata.title ?? ""
                    self.pageURLStr = metadata.url?.absoluteString ?? ""
                    self.onMetadataFetched(self.pageTitle, self.pageURLStr)
                    metadata.imageProvider?.loadObject(ofClass: UIImage.self, completionHandler: { (obj, error) in
                        self.loaded = true
                        if let image = obj as? UIImage {
                            self.pageImage = image
                        }
                    })
                }
            }
        })
        
    }
    
}

@available(iOS 14.0, *)
struct LinkPreview_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            LinkPreview(link: URL(string: "https://developer.apple.com/")!) { _ in
                return
            } onMetadataFetched: { _, _ in
                return
            }
        }
    }
}
