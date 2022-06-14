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
    
    
    let hamburger = SKSpriteNode(imageNamed: "Hamburger.png")
    
    var settingContainer = SKShapeNode()
    var nodes = [SKNode()]
    var label = SKSpriteNode()
    var startstream = false
    var checkSwipe = false
    var lightswitch = false
    var mute = false
    var settingsOn = false
    var omettoOn = false
    var leftedge = false
    var rightedge = false
    var soapApplied : Int = 0
    var activeRoom = 1
    private var curr : SKNode?
    private var swipeStart : CGPoint?
    private var swipeEnd : CGPoint?
    
    
    
    //    var wasInitialized: Bool = false
    
    override func didMove(to view: SKView) {
        setupInventoryScene()
        hamburger.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        hamburger.setScale(0.1)
        hamburger.name = "hamburger"
        addChild(hamburger)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                
                if node.name == "backbutton" {
                    self.curr = node
                }
                
                if node.name == "hamburger" {
                    self.curr = node
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            if node.name == "backbutton" {
                
                let tamagotchiMainScene = TamagotchiMainScene(size: (view?.frame.size)!)
                //                    tamagotchiMainScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(tamagotchiMainScene, transition: transition)
            }
            
            if node.name == "hamburger" {
                
                print(Macro_Challenge_HurricaneApp.mochi.hunger)
                
                Macro_Challenge_HurricaneApp.mochi.maxHunger = 100
                
                Macro_Challenge_HurricaneApp.inventory.consume(mochi: Macro_Challenge_HurricaneApp.mochi, selected: 0)
                
                print(Macro_Challenge_HurricaneApp.mochi.hunger)
            }
            
        }
        
        self.curr = nil
        
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        let leftCornerSymbol = SKSpriteNode(imageNamed: "BackButton.png")
        leftCornerSymbol.setScale(1.0)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.075)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.15)
        leftCornerSymbol.name = "backbutton"
        addChild(leftCornerSymbol)
    }
    
    func InventoryTitle() {
        let myLabel = SKLabelNode(fontNamed: "Mabook")
        myLabel.text = "Inventory".localized()
        myLabel.fontSize = 30
        //        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.09)
        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.165)
        self.addChild(myLabel)
    }
    
    func stats(){
        let hungerIcon = SKSpriteNode(imageNamed: "Hunger.png")
        hungerIcon.setScale(0.4)
        hungerIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.85, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(hungerIcon)
        
        let thirstIcon = SKSpriteNode(imageNamed: "Glass.png")
        thirstIcon.setScale(0.4)
        thirstIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.71, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(thirstIcon)
        
        let cleanIcon = SKSpriteNode(imageNamed: "Clean.png")
        cleanIcon.setScale(0.4)
        cleanIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.57, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(cleanIcon)
        
        let energyIcon = SKSpriteNode(imageNamed: "Stamina.png")
        energyIcon.setScale(0.4)
        energyIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.43, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(energyIcon)
        
        let healthIcon = SKSpriteNode(imageNamed: "Health.png")
        healthIcon.setScale(0.4)
        healthIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.29, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(healthIcon)
        
        let happyIcon = SKSpriteNode(imageNamed: "Happiness.png")
        happyIcon.setScale(0.4)
        happyIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.15, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(happyIcon)
        
        let hungerBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: hungerIcon.position.x - (hungerIcon.size.width)/(2 * 1.30), y: hungerIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(hungerBar)
        
        let thirstBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: thirstIcon.position.x - (thirstIcon.size.width)/(2 * 1.30), y: thirstIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(thirstBar)
        
        let cleanBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: cleanIcon.position.x - (cleanIcon.size.width)/(2 * 1.30), y: cleanIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(cleanBar)
        
        let energyBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: energyIcon.position.x - (energyIcon.size.width)/(2 * 1.30), y: energyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(energyBar)
        
        let healthBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: healthIcon.position.x - (healthIcon.size.width)/(2 * 1.30), y: healthIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(healthBar)
        
        let happyBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: happyIcon.position.x - (happyIcon.size.width)/(2 * 1.30), y: happyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        self.addChild(happyBar)
        
        
        
        
    }
    
    func setupInventoryScene() {
        
        BlurEffect()
        BackButton()
        InventoryTitle()
        stats()
        
        //        self.wasInitialized = true
        
    }
    
    
}
