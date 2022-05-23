//
//  GifImage.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 20/05/22.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable  {
    
    private let data : Data?
    private let name : String?
    
    init (data : Data) {
        self.data = data
        self.name = nil
    }
    
    public init(name: String){
        self.data = nil
        self.name = name
    }
    
    func makeUIView(context: Context) -> UIGIFImage {
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
    

}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("giffina")
    }
}


