//
//  Bedroom.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 23/05/22.
//

import Foundation
import SpriteKit

class BedroomScene :  SKScene {


    let bedroom = SKSpriteNode(imageNamed: "Bedroom.png")
    let squarestreaming = SKSpriteNode(imageNamed: "OmettoStreaming.png")
    let audiobutton = SKSpriteNode(imageNamed: "Sound.png")
    let twitchbutton = SKSpriteNode(imageNamed: "Twix.png")
    let languagebutton = SKSpriteNode(imageNamed: "Translation.png")
    let settingsCircle = SKSpriteNode(imageNamed: "SettingsCircle.png")
    let settingsCircleOval1 = SKSpriteNode(imageNamed: "Ovale.png")
    let settingsCircleOval2 = SKSpriteNode(imageNamed: "Ovale.png")
    let settingsCircleOval3 = SKSpriteNode(imageNamed: "Ovale.png")
    let setting = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let inventory = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let shop = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let customization = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let hunger = SKSpriteNode(imageNamed: "HungerButton.png")
    let thirst = SKSpriteNode(imageNamed: "ThirstGroup.png")
    let cleaning = SKSpriteNode(imageNamed: "CleanlinessGroup.png")
    let energy = SKSpriteNode(imageNamed: "StaminaGroup.png")
    let happiness = SKSpriteNode(imageNamed: "HappinessGroup.png")
    let health = SKSpriteNode(imageNamed: "HealthGroup.png")
    
    var settingContainer = SKShapeNode()
    
    var mute = false
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
                }
                
                else if node.name == "ometto" && omettoOn == true {
                    removeChildren(in: [hunger, thirst, cleaning, energy, happiness,health])
                    omettoOn = false
                }
                
                else if node.name == "twitch" && settingsOn == true {
                    
                    let rhytmGame = RhytmGame()
                    rhytmGame.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 1.5)
                    self.view?.presentScene(rhytmGame, transition: transition)
                    
                }
                
                else if node.name == "audio" && settingsOn == true {
                    if mute == false {
                        audiobutton.texture = SKTexture(imageNamed: "soundoff.png")
                        mute = true
                    } else {
                        audiobutton.texture = SKTexture(imageNamed: "Sound.png")
                        mute = false
                    }
                }
                
                if node.name == "shop" {
                    let shopScene = ShopScene()
                    shopScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 1.5)
                    self.view?.presentScene(shopScene, transition: transition)
                }
//                else if node.name == "inventory" {
//                    let inventoryScene = InventoryScene()
//                    inventoryScene.size = (view?.frame.size)!
//                    let transition = SKTransition.fade(withDuration: 1.5)
//                    self.view?.presentScene(inventoryScene, transition: transition)
//                }
                else if node.name == "customization"{
                    
                    let customizationScene = CustomizationScene()
                    customizationScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 1.5)
                    self.view?.presentScene(customizationScene, transition: transition)
                } else if node.name == "minigames"{
                    let minigamesScene = MinigamesScene()
                    minigamesScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 1.5)
                    self.view?.presentScene(minigamesScene, transition: transition)
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
extension BedroomScene {
    
    func spawnOmettoButtons(){
        addChild(hunger)
        addChild(thirst)
        addChild(cleaning)
        addChild(energy)
        addChild(happiness)
        addChild(health)
        
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
        
        let minigames = SKSpriteNode(imageNamed: "minigames.png")
        minigames.setScale(0.5)
        minigames.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.width * 0.25)
        minigames.name = "minigames"
        addChild(minigames)
        
        let shop = SKSpriteNode(imageNamed: "shop.png")
        shop.setScale(0.5)
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        shop.name = "shop"
        addChild(shop)
        
    }
    
    func spawnOmettoStats() {
        hunger.position = CGPoint(x: squarestreaming.position.x - UIScreen.main.bounds.width * 0.34, y: squarestreaming.position.y )
        hunger.name = "hunger"
        
        thirst.position = CGPoint(x: squarestreaming.position.x - UIScreen.main.bounds.width * 0.29, y: squarestreaming.position.y + UIScreen.main.bounds.height * 0.09)
        thirst.name = "thirst"
        
        cleaning.position = CGPoint(x: squarestreaming.position.x - UIScreen.main.bounds.width * 0.12, y: squarestreaming.position.y + UIScreen.main.bounds.height * 0.14)
        cleaning.name = "cleanliness"
        
        energy.position = CGPoint(x: squarestreaming.position.x + UIScreen.main.bounds.width * 0.12, y: squarestreaming.position.y + UIScreen.main.bounds.height * 0.14)
        energy.name = "energy"
        
        happiness.position = CGPoint(x: squarestreaming.position.x + UIScreen.main.bounds.width * 0.29, y: squarestreaming.position.y + UIScreen.main.bounds.height * 0.09)
        happiness.name = "happiness"
        
        health.position = CGPoint(x: squarestreaming.position.x + UIScreen.main.bounds.width * 0.34, y: squarestreaming.position.y)
        health.name = "health"
        
    }
    
    func spawnSettingButtons() {
        
        settingsCircle.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.13, y: frame.maxY - UIScreen.main.bounds.width * 0.3)
        settingsCircle.setScale(1)
        settingsCircle.name = "circle"
        settingContainer.isUserInteractionEnabled = false
        settingContainer.alpha = 0.0
        settingsCircle.alpha = 0.0
        settingContainer = SKShapeNode(rectOf: CGSize(width: frame.width, height: frame.height))
        settingContainer.lineWidth = 0
        addChild(settingContainer)
        settingContainer.addChild(settingsCircle)
        
        audiobutton.name = "audio"
        audiobutton.alpha = 0.0
        settingsCircleOval1.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.19, y: frame.maxY - UIScreen.main.bounds.width * 0.17)
        settingsCircleOval1.alpha = 0.0
        settingContainer.addChild(settingsCircleOval1)
        settingsCircleOval1.addChild((audiobutton))
        
        twitchbutton.name = "twitch"
        twitchbutton.alpha = 0.0
        settingsCircleOval2.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.145, y: frame.maxY - UIScreen.main.bounds.width * 0.355)
        settingsCircleOval2.alpha = 0.0
        settingContainer.addChild(settingsCircleOval2)
        settingsCircleOval2.addChild(twitchbutton)
        
        languagebutton.name = "language"
        languagebutton.alpha = 0.0
        settingsCircleOval3.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.height * 0.06, y: frame.maxY - UIScreen.main.bounds.width * 0.44)
        settingsCircleOval3.alpha = 0.0
        settingContainer.addChild(settingsCircleOval3)
        settingsCircleOval3.addChild(languagebutton)
        
    }
    
}

// MARK: - Game Scene Setup
extension BedroomScene {
    
    func spawnBedroom() {
        bedroom.position = CGPoint(x: frame.midX,y: frame.midY)
        bedroom.name = "bedroom"
        addChild(bedroom)
    }
    
    func spawnOmettoStreamer() {
        squarestreaming.setScale(0.95)
        squarestreaming.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.1, y: frame.midY - UIScreen.main.bounds.width * 0.42)
        squarestreaming.name = "omettostreamer"
        addChild(squarestreaming)
    }
    
    func setupScene() {
        
        spawnBedroom()
        spawnOmettoStreamer()
        
    }
    
}

// MARK: Elements Animations

extension BathroomScene {
    
    private func fadeInAnim(elem : SKSpriteNode, time : CGFloat) {
        let comparsa = SKAction.fadeIn(withDuration: time)
        elem.run(comparsa)
    }
    
    private func fadeOutAnim(elem: SKSpriteNode, time: CGFloat) {
        let scomparsa = SKAction.fadeOut(withDuration: time)
        elem.run(scomparsa)
    }
    
}

// MARK: Generic Functions

extension BathroomScene {
    
    private func settfadeOut() {
        
        fadeOutAnim(elem: self.audiobutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval1, time: 1.5)
        fadeOutAnim(elem: self.twitchbutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval2, time: 1.5)
        fadeOutAnim(elem: self.languagebutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval3, time: 1.5)
        fadeOutAnim(elem: self.settingsCircle, time: 1.5)
        
    }
}
