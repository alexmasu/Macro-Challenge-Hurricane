//
//  CornerScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 06/06/22.
//

import Foundation
import SpriteKit


class CornerScene: SKScene {
    
   
    let twitchbutton = SKSpriteNode(imageNamed: "Twix.png")
    let setting = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let inventory = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let shop = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let customization = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))

    
    override func didMove(to view: SKView) {
        spawnCornerButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func
    touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

// MARK: Set corner buttons

extension CornerScene {
    
    func spawnCornerButtons() {
        let customization = SKSpriteNode(imageNamed: "customization.png")
        customization.setScale(0.5)
        customization.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        customization.name = "customization"
        addChild(customization)
        
        let setting = SKSpriteNode(imageNamed: "setting.png")
        setting.setScale(0.5)
        setting.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        setting.name = "setting"
        addChild(setting)
        
        let inventory = SKSpriteNode(imageNamed: "inventory.png")
        inventory.setScale(0.5)
        inventory.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        inventory.name = "inventory"
        addChild(inventory)
        
//        let minigames = SKSpriteNode(imageNamed: "minigames.png")
//        minigames.setScale(0.5)
//        minigames.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.width * 0.25)
//        minigames.name = "minigames"
//        addChild(minigames)
        
        let shop = SKSpriteNode(imageNamed: "shop.png")
        shop.setScale(0.5)
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        shop.name = "shop"
        addChild(shop)
        
    }
}
