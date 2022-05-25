//
//  TamagotchiMainScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 23/05/22.
//

import Foundation
import SpriteKit

class TamagotchiMainScene :  SKScene {
    
    let square = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.2)
    let setting = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let inventory = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let shop = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let customization = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let audiobutton = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let twitchbutton = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let languagebutton = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let hunger = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    let thirst = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    let cleaning = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    let energy = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    let happiness = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    let health = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.08)
    var settingsOn = false
    var omettoOn = false
    
    
    override func didMove(to view: SKView) {
        setupScene()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                if node.name == "ometto" && omettoOn == false {
                    spawnOmettoButtons()
                    omettoOn = true
                } else if node.name == "ometto" && omettoOn == true {
                    removeChildren(in: [hunger, thirst, cleaning, energy, happiness,health])
                    omettoOn = false
                }
                if node.name == "setting" && settingsOn == false {
                    
                    spawnButtons()
                    settingsOn = true
                    
                }
                else if node.name == "setting" && settingsOn == true {
                    removeChildren(in: [audiobutton, twitchbutton, languagebutton])
                    settingsOn = false
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}

// MARK: - Spawn Buttons for Game Scene
extension TamagotchiMainScene {
    
    func spawnOmettoButtons(){
        addChild(hunger)
        addChild(thirst)
        addChild(cleaning)
        addChild(energy)
        addChild(happiness)
        addChild(health)
        
    }
    
    func spawnButtons(){
        addChild(audiobutton)
        addChild(twitchbutton)
        addChild(languagebutton)
    }
    
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
        
        let shop = SKSpriteNode(imageNamed: "shop.png")
        shop.setScale(0.5)
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        shop.name = "shop"
        addChild(shop)
    }
    
    func spawnOmettoStats() {
        hunger.fillColor = UIColor.green
        hunger.strokeColor = UIColor.red
        hunger.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.32, y: square.position.y )
        hunger.name = "hunger"
        
        thirst.fillColor = UIColor.green
        thirst.strokeColor = UIColor.red
        thirst.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.27, y: square.position.y + UIScreen.main.bounds.height * 0.09)
        thirst.name = "thirst"
        
        cleaning.fillColor = UIColor.green
        cleaning.strokeColor = UIColor.red
        cleaning.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.1, y: square.position.y + UIScreen.main.bounds.height * 0.14)
        cleaning.name = "cleanliness"
        
        energy.fillColor = UIColor.green
        energy.strokeColor = UIColor.red
        energy.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.1, y: square.position.y + UIScreen.main.bounds.height * 0.14)
        energy.name = "energy"
        
        happiness.fillColor = UIColor.green
        happiness.strokeColor = UIColor.red
        happiness.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.27, y: square.position.y + UIScreen.main.bounds.height * 0.09)
        happiness.name = "happiness"
        
        health.fillColor = UIColor.green
        health.strokeColor = UIColor.red
        health.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.32, y: square.position.y)
        health.name = "health"
        
    }
    
    func spawnSettingButtons() {
        audiobutton.fillColor = UIColor.green
        audiobutton.strokeColor = UIColor.red
        audiobutton.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.20, y: frame.maxY - UIScreen.main.bounds.width * 0.185)
        audiobutton.name = "audio"
        
        twitchbutton.fillColor = UIColor.green
        twitchbutton.strokeColor = UIColor.red
        twitchbutton.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.154, y: frame.maxY - UIScreen.main.bounds.width * 0.360)
        twitchbutton.name = "twitch"
        
        languagebutton.fillColor = UIColor.green
        languagebutton.strokeColor = UIColor.red
        languagebutton.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.07, y: frame.maxY - UIScreen.main.bounds.width * 0.465)
        languagebutton.name = "language"
        
    }
    
}

// MARK: - Game Scene Setup
extension TamagotchiMainScene {
    
    func spawnOmetto() {
        square.fillColor = UIColor.red
        square.strokeColor = UIColor.red
        square.position = CGPoint(x: frame.midX, y: frame.midY)
        square.name = "ometto"
        addChild(square)
    }
    
    func setupScene() {
        spawnOmetto()
        spawnOmettoStats()
        spawnCornerButtons()
        spawnSettingButtons()
    }
    
}
