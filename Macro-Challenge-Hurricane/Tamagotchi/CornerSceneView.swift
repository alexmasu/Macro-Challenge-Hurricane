//
//  CornerSceneView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 06/06/22.
//

import SwiftUI
import SpriteKit

struct CornerSceneView: View {
    
    var scene : SKScene {
        let scene = CornerScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}

struct CornerSceneView_Previews: PreviewProvider {
    static var previews: some View {
        CornerSceneView()
    }
}
