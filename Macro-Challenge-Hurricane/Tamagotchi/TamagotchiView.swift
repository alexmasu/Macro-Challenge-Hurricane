//
//  TamagotchiView.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 23/05/22.
//

import SwiftUI
import SpriteKit



struct TamagotchiView: View {
    
    var scene : SKScene {
        let scene = TamagotchiMainScene()
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

struct TamagotchiView_Previews: PreviewProvider {
    static var previews: some View {
        TamagotchiView()
    }
}
