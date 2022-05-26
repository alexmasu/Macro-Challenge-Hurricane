//
//  RhytmGameView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 24/05/22.
//

import SwiftUI
import SpriteKit

struct RhytmGameView: View {
    
    var scene : SKScene {
        let scene = RhytmGame()
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


struct RhytmGameView_Previews: PreviewProvider {
    static var previews: some View {
        RhytmGameView()
    }
}
