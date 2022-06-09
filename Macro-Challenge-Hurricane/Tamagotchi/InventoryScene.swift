//
//  CustomizationScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 30/05/22.
//
//

import Foundation
import SpriteKit

class InventoryScene : SKScene {
    
    
    let contentNode = SKNode()
    let effectNode = SKEffectNode()
    let blurNode = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        let filter = CIFilter(name: "CIGaussianBlur")
        // Set the blur amount. Adjust this to achieve the desired effect
        let blurAmount = 70.0
        filter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        let texture = SKTexture(imageNamed: "Background.png")
        let sprite = SKSpriteNode(texture: texture)
        effectNode.filter = filter
        effectNode.position = self.view!.center
        effectNode.blendMode = .alpha
        effectNode.addChild(sprite)
        self.addChild(effectNode)
    }
    
}
