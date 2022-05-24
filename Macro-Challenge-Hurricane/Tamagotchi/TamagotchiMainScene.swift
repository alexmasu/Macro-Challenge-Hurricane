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
    let hunger = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let thirst = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let cleaning = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let energy = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let happiness = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let health = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    var settingsOn = false
    var omettoOn = false
    
    func colorChange(cosino : SKShapeNode) {
        cosino.fillColor = UIColor.blue
        cosino.strokeColor = UIColor.blue
    }
    
    func spawnButtons(sett : SKShapeNode){
        self.setting.addChild(audiobutton)
        self.setting.addChild(twitchbutton)
        self.setting.addChild(languagebutton)
    }
    
    func spawnOmettoButtons(sett : SKShapeNode){
        self.square.addChild(hunger)
        self.square.addChild(thirst)
        self.square.addChild(cleaning)
        self.square.addChild(energy)
        self.square.addChild(happiness)
        self.square.addChild(health)
    }
    
    
    override func didMove(to view: SKView) {
        square.fillColor = UIColor.red
        square.strokeColor = UIColor.red
        square.position = CGPoint(x: frame.midX, y: frame.midY)
        square.name = "ometto"
        addChild(square)
        
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
        
        hunger.fillColor = UIColor.green
        hunger.strokeColor = UIColor.red
        hunger.position = CGPoint(x: frame.midX - UIScreen.main.bounds.height * 0.17, y: frame.midY )
        hunger.name = "hunger"
        
        thirst.fillColor = UIColor.green
        thirst.strokeColor = UIColor.red
        thirst.position = CGPoint(x: frame.midX - UIScreen.main.bounds.height * 0.12, y: frame.midY + UIScreen.main.bounds.width * 0.18)
        thirst.name = "thirst"
        
        cleaning.fillColor = UIColor.green
        cleaning.strokeColor = UIColor.red
        cleaning.position = CGPoint(x: frame.midX - UIScreen.main.bounds.height * 0.06 , y: frame.midY + UIScreen.main.bounds.width * 0.355)
        cleaning.name = "cleanliness"
        
        energy.fillColor = UIColor.green
        energy.strokeColor = UIColor.red
        energy.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.06, y: frame.midY + UIScreen.main.bounds.width * 0.355 )
        energy.name = "energy"
        
        happiness.fillColor = UIColor.green
        happiness.strokeColor = UIColor.red
        happiness.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.12, y: frame.midY + UIScreen.main.bounds.width * 0.18)
        happiness.name = "happiness"
        
        health.fillColor = UIColor.green
        health.strokeColor = UIColor.red
        health.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.17, y: frame.midY )
        health.name = "health"
        
        
        
        
        
        //        hunger.fillColor = UIColor.green
        //        hunger.strokeColor = UIColor.red
        //        hunger.position = CGPoint(x: frame.midX - UIScreen.main.bounds.height * 0.13, y: frame.midY - UIScreen.main.bounds.width * 0.25)
        //        hunger.name = "hunger"
        //
        //        thirst.fillColor = UIColor.green
        //        thirst.strokeColor = UIColor.red
        //        thirst.position = CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.width * 0.35)
        //        thirst.name = "thirst"
        //
        //        cleaning.fillColor = UIColor.green
        //        cleaning.strokeColor = UIColor.red
        //        cleaning.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.13, y: frame.midY - UIScreen.main.bounds.width * 0.25)
        //        cleaning.name = "cleanliness"
        //
        //        energy.fillColor = UIColor.green
        //        energy.strokeColor = UIColor.red
        //        energy.position = CGPoint(x: frame.midX - UIScreen.main.bounds.height * 0.13, y: frame.midY + UIScreen.main.bounds.width * 0.25 )
        //        energy.name = "energy"
        //
        //        happiness.fillColor = UIColor.green
        //        happiness.strokeColor = UIColor.red
        //        happiness.position = CGPoint(x: frame.midX, y: frame.midY + UIScreen.main.bounds.width * 0.35)
        //        happiness.name = "happiness"
        //
        //        health.fillColor = UIColor.green
        //        health.strokeColor = UIColor.red
        //        health.position = CGPoint(x: frame.midX + UIScreen.main.bounds.height * 0.13, y: frame.midY + UIScreen.main.bounds.width * 0.25)
        //        health.name = "health"
        
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
        
        //        setting.fillColor = UIColor.blue
        //        setting.strokeColor = UIColor.white
        //        setting.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        //        setting.name = "setting"
        //        addChild(setting)
        //
        //
        //        inventory.fillColor = UIColor.blue
        //        inventory.strokeColor = UIColor.white
        //        inventory.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.15)
        //        inventory.name = "inventory"
        //        addChild(inventory)
        //
        //        shop.fillColor = UIColor.blue
        //        shop.strokeColor = UIColor.white
        //        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.15)
        //        shop.name = "shop"
        //        addChild(shop)
        //
        //        customization.fillColor = UIColor.blue
        //        customization.strokeColor = UIColor.white
        //        customization.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        //        customization.name = "customization"
        //        addChild(customization)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                if node.name == "ometto" && omettoOn == false {
                    addChild(hunger)
                    addChild(thirst)
                    addChild(cleaning)
                    addChild(energy)
                    addChild(happiness)
                    addChild(health)
                    omettoOn = true
                } else if node.name == "ometto" && omettoOn == true {
                    removeChildren(in: [hunger, thirst, cleaning, energy, happiness,health])
                    omettoOn = false
                }
                if node.name == "setting" && settingsOn == false {
                    
                    addChild(audiobutton)
                    addChild(twitchbutton)
                    addChild(languagebutton)
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
