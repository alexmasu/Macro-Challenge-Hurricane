//
//  BedroomView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 01/06/22.
//

import SwiftUI
import SpriteKit


struct BedroomView: View {
    
    var scene : SKScene {
        let scene = BedroomScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: UIScreen.main
                .bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}