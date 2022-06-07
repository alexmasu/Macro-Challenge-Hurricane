//
//  TamagotchiView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 23/05/22.
//

import SwiftUI
import SpriteKit


struct TamagotchiView: View {
    
    @State public var showWebView = false
    
    var scene : SKScene {
        let scene = TamagotchiMainScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        NavigationView {
        ZStack{
//            if showWebView == true {
            
            NavigationLink(destination: WebView()) {
                Image("Twix.png")
            }
            
//                showWebView = false
//            } else if showWebView == false {
//                print ("porco dio")
//                showWebView = true
//            }
        }
        }
        
//        if showWebView == true {
//            WebView()
//            showWebView = false
//        } else if showWebView == false {
//            print ("p")
//            showWebView = true
//        }
        
//        SpriteView(scene: scene)
//            .frame(width: UIScreen.main
//                .bounds.width, height: UIScreen.main.bounds.height)
//            .ignoresSafeArea()
        
    }
    
//
//    SpriteView(scene: scene)
//        .frame(width: UIScreen.main
//            .bounds.width, height: UIScreen.main.bounds.height)
//        .ignoresSafeArea()

}

struct TamagotchiView_Previews: PreviewProvider {
    static var previews: some View {
        TamagotchiView()
    }
}
