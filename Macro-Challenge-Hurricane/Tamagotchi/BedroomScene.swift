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
    let bedroomNight = SKSpriteNode(imageNamed: "BedroomNight.png")
    let light = SKSpriteNode(imageNamed: "light.png")
    let nightlight = SKSpriteNode(imageNamed: "nightlight.png")
    let squarestreamingday = SKSpriteNode(imageNamed: "OmettoStreaming.png")
    let squarestreamingnight = SKSpriteNode(imageNamed: "OmettoStreaming.png")
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
    
    var isNight = false
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
                
//                da copiare
                if node.name == "omettostreamerday" && omettoOn == false {
                        spawnOmettoStats()
                        spawnStatsButtons()
                        omettoOn = true
                    
                } else if node.name == "omettostreamerday" && omettoOn == true {
                        omettofadeOut()
                        omettoOn = false
                    }
//
                if node.name == "setting" && settingsOn == false {
                    
                    spawnSettingsCircle()
                    spawnButtons()
                    settingsOn = true
                    
                } else if node.name == "setting" && settingsOn == true {
                    
                    settfadeOut()
                    settingsOn = false
                    
                }
                
//             da copiare
                if node.name == "light" || node.name == "nightlight" {
                    if isNight == false {
                        removeChildren(in: [bedroom,light,squarestreamingday])
                        addChild(bedroomNight)
                        addChild(nightlight)
                        addChild(squarestreamingnight)
                        isNight = true
                    } else if isNight == true {
                        removeChildren(in: [bedroomNight,nightlight,squarestreamingnight])
                        addChild(bedroom)
                        addChild(light)
                        addChild(squarestreamingday)
                        isNight = false
                    }
                }
//
                if node.name == "twitch" && settingsOn == true {
                    
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
    
    func spawnSettingsCircle(){
        
        fadeInAnim(elem: settingsCircle, time: 0.5)
    }
    
    func spawnButtons(){
        
        
        fadeInAnim(elem: settingsCircleOval1, time: 0.5)
        fadeInAnim(elem: audiobutton, time: 0.5)
        
        
        fadeInAnim(elem: settingsCircleOval2, time: 0.5)
        fadeInAnim(elem: twitchbutton, time: 0.5)
        
        
        fadeInAnim(elem: settingsCircleOval3, time: 0.5)
        fadeInAnim(elem: languagebutton, time: 0.5)
    }
    
    func spawnStatsButtons(){
        
        fadeInAnim(elem: hunger, time: 0.5)
        
        fadeInAnim(elem: thirst, time: 0.5)
        
        fadeInAnim(elem: cleaning, time: 0.5)
        
        fadeInAnim(elem: energy, time: 0.5)
        
        fadeInAnim(elem: happiness, time: 0.5)
        
        fadeInAnim(elem: health, time: 0.5)
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
        hunger.position = CGPoint(x: squarestreamingday.position.x - UIScreen.main.bounds.width * 0.34, y: squarestreamingday.position.y )
//        hunger.alpha = 0.0
        hunger.name = "hunger"
        addChild(hunger)
        
        thirst.position = CGPoint(x: squarestreamingday.position.x - UIScreen.main.bounds.width * 0.29, y: squarestreamingday.position.y + UIScreen.main.bounds.height * 0.09)
//        thirst.alpha = 0.0
        thirst.name = "thirst"
        addChild(thirst)
        
        cleaning.position = CGPoint(x: squarestreamingday.position.x - UIScreen.main.bounds.width * 0.12, y: squarestreamingday.position.y + UIScreen.main.bounds.height * 0.14)
//        cleaning.alpha = 0.0
        cleaning.name = "cleanliness"
        addChild(cleaning)
        
        energy.position = CGPoint(x: squarestreamingday.position.x + UIScreen.main.bounds.width * 0.12, y: squarestreamingday.position.y + UIScreen.main.bounds.height * 0.14)
//        energy.alpha = 0.0
        energy.name = "energy"
        addChild(energy)
        
        happiness.position = CGPoint(x: squarestreamingday.position.x + UIScreen.main.bounds.width * 0.29, y: squarestreamingday.position.y + UIScreen.main.bounds.height * 0.09)
//        happiness.alpha = 0.0
        happiness.name = "happiness"
        addChild(happiness)
        
        health.position = CGPoint(x: squarestreamingday.position.x + UIScreen.main.bounds.width * 0.34, y: squarestreamingday.position.y)
//        health.alpha = 0.0
        health.name = "health"
        addChild(health)
        
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
    
    func spawnOmettoNight() {
        squarestreamingnight.setScale(0.95)
        squarestreamingnight.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.01, y: frame.midY - UIScreen.main.bounds.width * 0.46)
        squarestreamingnight.name = "omettostreamernight"
        squarestreamingnight.color = SKColor.black
        squarestreamingnight.colorBlendFactor = 0.70
    }

    
}

// MARK: - Game Scene Setup
extension BedroomScene {
    
    func spawnBedroom() {
        bedroom.setScale(0.47)
        bedroom.position = CGPoint(x: frame.midX,y: frame.midY)
        bedroom.name = "bedroom"
        addChild(bedroom)
        
        bedroomNight.setScale(0.47)
        bedroomNight.position = CGPoint(x: frame.midX,y: frame.midY)
        bedroomNight.name = "bedroomnight"
        
        light.setScale(0.5)
        light.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.2,y: frame.midY + UIScreen.main.bounds.width * 0.15)
        light.name = "light"
        addChild(light)
        
        nightlight.setScale(0.5)
        nightlight.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.2,y: frame.midY + UIScreen.main.bounds.width * 0.15)
        nightlight.name = "nightlight"
    }
    
    func spawnOmettoDay() {
        squarestreamingday.setScale(0.95)
        squarestreamingday.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.01, y: frame.midY - UIScreen.main.bounds.width * 0.46)
        squarestreamingday.name = "omettostreamerday"
        addChild(squarestreamingday)
    }
    
    func setupScene() {
        
        spawnBedroom()
        spawnOmettoDay()
//        spawnOmettoStats()
        spawnSettingButtons()
        spawnCornerButtons()
        spawnOmettoNight()
        
    }
    
}

// MARK: Elements Animations

extension BedroomScene {
    
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

extension BedroomScene {
    
    private func settfadeOut() {
        
        fadeOutAnim(elem: self.audiobutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval1, time: 1.5)
        fadeOutAnim(elem: self.twitchbutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval2, time: 1.5)
        fadeOutAnim(elem: self.languagebutton, time: 1.5)
        fadeOutAnim(elem: self.settingsCircleOval3, time: 1.5)
        fadeOutAnim(elem: self.settingsCircle, time: 1.5)
        
    }
    
    private func omettofadeOut() {
        
        fadeOutAnim(elem: self.hunger, time: 0.5)
        fadeOutAnim(elem: self.thirst, time: 0.5)
        fadeOutAnim(elem: self.cleaning, time: 0.5)
        fadeOutAnim(elem: self.energy, time: 0.5)
        fadeOutAnim(elem: self.happiness, time: 0.5)
        fadeOutAnim(elem: self.health, time: 0.5)
        
    }
}
