//
//  InventorySceneView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 08/06/22.
//

import Foundation
import SwiftUI
import SpriteKit


struct InventorySceneView: View {
    
    var scene : SKScene {
        let scene = InventoryScene()
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
