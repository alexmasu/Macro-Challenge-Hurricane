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
    let contentNodeBackButton = SKNode()
    let blurNode = SKShapeNode()
    let effectNode = SKEffectNode()
    
    var wasInitialized: Bool = false
    
    override func didMove(to view: SKView) {
                setupInventoryScene()
    }
}


// MARK: - Schermata Principale
extension InventoryScene {
    
    func BlurEffect(){
        
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
    
    func BackButton() {
        let leftCornerSymbol = SKSpriteNode(imageNamed: "Twix.png")
        leftCornerSymbol.setScale(0.5)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.height * 0.085)
        leftCornerSymbol.name = "backbutton"
        addChild(leftCornerSymbol)
    }
    
    func InventoryTitle() {
        let myLabel = SKLabelNode(fontNamed: "Mabook")
        myLabel.text = "Inventory"
        myLabel.fontSize = 30
        myLabel.position = CGPoint(x: frame.minX, y: frame.maxY)
        self.addChild(myLabel)
    }
    
    func setupInventoryScene() {
        
        BlurEffect()
        BackButton()
        InventoryTitle()
        
        self.wasInitialized = true

    }

    
}
