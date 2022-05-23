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
    var settingsOn = false
    
    func colorChange(cosino : SKShapeNode) {
        cosino.fillColor = UIColor.blue
        cosino.strokeColor = UIColor.blue
    }
    
    func spawnButtons(sett : SKShapeNode){
        self.setting.addChild(audiobutton)
        self.setting.addChild(twitchbutton)
        self.setting.addChild(languagebutton)
    }
    
    
    override func didMove(to view: SKView) {
        square.fillColor = UIColor.red
        square.strokeColor = UIColor.red
        square.position = CGPoint(x: frame.midX, y: frame.midY)
        square.name = "ometto"
        addChild(square)
        
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
        
        setting.fillColor = UIColor.blue
        setting.strokeColor = UIColor.white
        setting.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        setting.name = "setting"
        addChild(setting)
        
        
        inventory.fillColor = UIColor.blue
        inventory.strokeColor = UIColor.white
        inventory.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.15)
        inventory.name = "inventory"
        addChild(inventory)
        
        shop.fillColor = UIColor.blue
        shop.strokeColor = UIColor.white
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.15)
        shop.name = "shop"
        addChild(shop)
        
        customization.fillColor = UIColor.blue
        customization.strokeColor = UIColor.white
        customization.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        customization.name = "customization"
        addChild(customization)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                if node.name == "ometto" {
                    colorChange(cosino: (node as! SKShapeNode ))
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
