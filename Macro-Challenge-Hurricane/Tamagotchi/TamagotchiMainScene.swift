//
//  TamagotchiMainScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 23/05/22.
//

import Foundation
import SpriteKit

class TamagotchiMainScene :  SKScene {
    
    let background = SKSpriteNode(imageNamed: "Background.png")
    let sponge = SKSpriteNode(imageNamed: "sponge.png")
    let bath = SKSpriteNode(imageNamed: "bath.png")
    let bathroom = SKSpriteNode(imageNamed: "Bagno.png")
    let bedroom = SKSpriteNode(imageNamed: "Bedroom.png")
    let bedroomNight = SKSpriteNode(imageNamed: "BedroomNight.png")
    let lamp = SKSpriteNode(imageNamed: "lampada.png")
    let light = SKSpriteNode(imageNamed: "light.png")
    let nightlight = SKSpriteNode(imageNamed: "nightlight.png")
    let pc = SKSpriteNode(imageNamed: "pc2.png")
    let square = SKSpriteNode(imageNamed: "Ometto.png")
    let monitor = SKSpriteNode(imageNamed: "Monitor.png")
    let twitchbutton = SKSpriteNode(imageNamed: "Twix.png")
    let hunger = SKSpriteNode(imageNamed: "HungerButton.png")
    let thirst = SKSpriteNode(imageNamed: "ThirstGroup.png")
    let cleaning = SKSpriteNode(imageNamed: "CleanlinessGroup.png")
    let energy = SKSpriteNode(imageNamed: "StaminaGroup.png")
    let happiness = SKSpriteNode(imageNamed: "HappinessGroup.png")
    let health = SKSpriteNode(imageNamed: "HealthGroup.png")
    
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
    var activeRoom = 1
    
    private var curr : SKNode?
    private var swipeStart : CGPoint?
    private var swipeEnd : CGPoint?
    
    var wasInitialized: Bool = false
    
    
    
    
    override func didMove(to view: SKView) {
        
        label = SKSpriteNode(color: .clear, size: CGSize(width: (bedroom.size.width+background.size.width+bathroom.size.width), height: UIScreen.main.bounds.height))
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.isUserInteractionEnabled = false
        addChild(label)
        setupScene()
        
        addSwipeGestureRecognizers()
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                
                if (node.name == "ometto") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "twitch") {
                    
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                
                
                if (node.name == "monitor") && (omettoOn == false) {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "light") {
                    
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "nightlight") {
                    
                    self.curr = node
                    nodes.append(node)
                }
                
                
                
                if (node.name == "shop") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                else if (node.name == "inventory") {
                    let inventoryScene = InventoryScene()
                    inventoryScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 1.5)
                    self.view?.presentScene(inventoryScene, transition: transition)
                }
                
                else if (node.name == "customization") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                else if (node.name == "minigames") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                
            }
            
        }
        for el in nodes {
            print("\(el.name)-> ")
        }
        nodes.removeAll()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            
            
            //            else {
            print("\(node.name)...")
            
            //            if (node.name == "omettostreamerday") {
            //                if omettoOn == false {
            //                    spawnStatsButtons()
            //                    omettoOn = true
            //
            //                } else if omettoOn == true {
            //                    omettofadeOut()
            //                    omettoOn = false
            //                }
            //
            //            }
            
            
            if (node.name == "ometto") {
                
                if omettoOn == false {
                    spawnStatsButtons()
                    omettoOn = true
                }
                
                else if omettoOn == true {
                    omettofadeOut()
                    omettoOn = false
                }
                
            }
            if (node.name == "twitch") {
                
            }
            
            if node.name == "light" {
                setBedroomBackgroundNight()
            }
            
            if node.name == "nightlight" {
                setBedroomBackgroundDay()
            }
            
            if (node.name == "monitor") && (omettoOn == false) {
                
                if startstream == false {
                    square.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.2, y: frame.midY + UIScreen.main.bounds.height * 0.045)
                    square.xScale = -0.8
                    //                    square.setScale(0.8)
                    startstream = true
                }
                else if startstream == true {
                    square.position = CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.21)
                    square.xScale = 1.0
                    square.setScale(0.8)
                    startstream = false
                }
                
            }
            
            
            if (node.name == "shop") {
                
                let shopScene = ShopScene()
                shopScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 1.5)
                self.view?.presentScene(shopScene, transition: transition)
                
            }
            
            if (node.name == "customization") {
                
                let customizationScene = CustomizationScene()
                customizationScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 1.5)
                self.view?.presentScene(customizationScene, transition: transition)
                
            }
            
            if (node.name == "minigames") {
                
                let minigamesScene = MinigamesScene()
                minigamesScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 1.5)
                self.view?.presentScene(minigamesScene, transition: transition)
            }
        }
        
        self.curr = nil
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
    
    func setBedroomBackgroundNight(){
        bedroom.removeAllChildren()
        label.removeChildren(in: [bedroom])
        label.addChild(bedroomNight)
        bedroomNight.addChild(nightlight)
        lightswitch = true
    }
    
    func setBedroomBackgroundDay(){
        bedroomNight.removeAllChildren()
        label.removeChildren(in: [bedroomNight])
        label.addChild(bedroom)
        bedroom.addChild(light)
        lightswitch = false
    }
    
    
    func spawnCornerButtons() {
        let customization = SKSpriteNode(imageNamed: "customization.png")
        customization.setScale(0.5)
        customization.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.height * 0.085)
        customization.name = "customization"
        addChild(customization)
        
        let twitch = SKSpriteNode(imageNamed: "Twix.png")
        twitch.setScale(0.5)
        twitch.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.10 , y: frame.maxY - UIScreen.main.bounds.height * 0.085)
        twitch.name = "twitch"
        addChild(twitch)
        
        let inventory = SKSpriteNode(imageNamed: "inventory.png")
        inventory.setScale(0.5)
        inventory.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.height * 0.08)
        inventory.name = "inventory"
        addChild(inventory)
        
        let minigames = SKSpriteNode(imageNamed: "minigames.png")
        minigames.setScale(0.5)
        minigames.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.height * 0.09)
        minigames.name = "minigames"
        addChild(minigames)
        
        let shop = SKSpriteNode(imageNamed: "shop.png")
        shop.setScale(0.5)
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.height * 0.08)
        shop.name = "shop"
        addChild(shop)
        
    }
    
    func spawnOmettoStats() {
        
        hunger.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.34, y: square.position.y )
        hunger.name = "hunger"
        hunger.alpha = 0.0
        
        thirst.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.29, y: square.position.y + UIScreen.main.bounds.height * 0.09)
        thirst.name = "thirst"
        thirst.alpha = 0.0
        
        cleaning.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.12, y: square.position.y + UIScreen.main.bounds.height * 0.14)
        cleaning.name = "cleanliness"
        cleaning.alpha = 0.0
        
        energy.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.12, y: square.position.y + UIScreen.main.bounds.height * 0.14)
        energy.name = "energy"
        energy.alpha = 0.0
        
        happiness.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.29, y: square.position.y + UIScreen.main.bounds.height * 0.09)
        happiness.name = "happiness"
        happiness.alpha = 0.0
        
        health.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.34, y: square.position.y)
        health.name = "health"
        health.alpha = 0.0
        
    }
    
}

// MARK: - Game Scene Setup
extension TamagotchiMainScene {
    
    func spawnBackground() {
        
        background.position = CGPoint(x: frame.minX,y: frame.minY)
        background.name = "background"
        background.setScale(0.47)
        label.addChild(background)
        
        bathroom.position = CGPoint(x: frame.midX * 2.4 ,y: frame.minY)
        bathroom.name = "bathroom"
        bathroom.setScale(0.47)
        label.addChild(bathroom)
        
        bedroom.setScale(0.47)
        bedroom.position = CGPoint(x: (-frame.midX * 2.4),y: frame.minY)
        bedroom.name = "bedroom"
        label.addChild(bedroom)
        
        bedroomNight.setScale(0.47)
        bedroomNight.position = CGPoint(x: (-frame.midX * 2.4),y: frame.minY)
        bedroomNight.name = "bedroomnight"
        
    }
    
    func spawnRoomElements() {
        
        lamp.position = CGPoint(x: frame.midX + UIScreen.main.bounds.width * 0.42, y: frame.midY - UIScreen.main.bounds.height * 0.45)
        lamp.name = "lamp"
        lamp.setScale(1.8)
        background.addChild(lamp)
        
        monitor.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.42, y: frame.midY - UIScreen.main.bounds.height * 0.375)
        monitor.name = "monitor"
        monitor.setScale(0.8)
        background.addChild(monitor)
        
        pc.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 1.3, y: frame.midY - UIScreen.main.bounds.height * 0.42)
        pc.name = "pc"
        pc.setScale(1.8)
        background.addChild(pc)
        
        sponge.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 1.35 ,y: frame.midY - UIScreen.main.bounds.height * 0.3)
        sponge.name = "sponge"
        sponge.setScale(1.7)
        bathroom.addChild(sponge)
        
        bath.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.35,y: frame.midY - UIScreen.main.bounds.height * 0.94)
        bath.name = "bath"
        bath.setScale(2.0)
        bath.zPosition = 1.0
        bathroom.addChild(bath)
        
        light.setScale(0.8)
        light.position = CGPoint(x: frame.midX + UIScreen.main.bounds.width * 0.35,y: frame.midY - UIScreen.main.bounds.height * 0.3)
        light.name = "light"
        bedroom.addChild(light)
        
        nightlight.setScale(0.8)
        nightlight.position = CGPoint(x: frame.midX + UIScreen.main.bounds.width * 0.35,y: frame.midY - UIScreen.main.bounds.height * 0.3)
        nightlight.name = "nightlight"
        
    }
    
    func spawnOmetto() {
        square.setScale(0.8)
        square.position = CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.21)
//        square.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.15, y: frame.midY - UIScreen.main.bounds.height * 0.08)
        square.name = "ometto"
        addChild(square)
    }
    
    func setupScene() {
        
        spawnBackground()
        spawnCornerButtons()
        spawnRoomElements()
        spawnOmetto()
        spawnOmettoStats()
        spawnOmettoButtons()
        
        self.wasInitialized = true
        
    }
    
}

// MARK: Elements Animations

extension TamagotchiMainScene {
    
    private func fadeInAnim(elem : SKSpriteNode, time : CGFloat) {
        let comparsa = SKAction.fadeIn(withDuration: time)
        elem.run(comparsa)
    }
    
    private func fadeOutAnim(elem: SKSpriteNode, time: CGFloat) {
        let scomparsa = SKAction.fadeOut(withDuration: time)
        elem.run(scomparsa)
    }
    
    
    private func omettofadeOut() {
        
        fadeOutAnim(elem: self.hunger, time: 1.0)
        fadeOutAnim(elem: self.thirst, time: 1.0)
        fadeOutAnim(elem: self.cleaning, time: 1.0)
        fadeOutAnim(elem: self.energy, time: 1.0)
        fadeOutAnim(elem: self.happiness, time: 1.0)
        fadeOutAnim(elem: self.health, time: 1.0)
        
    }
    
    func spawnStatsButtons() {
        
        fadeInAnim(elem: hunger, time: 1.0)
        
        fadeInAnim(elem: thirst, time: 1.0)
        
        fadeInAnim(elem: cleaning, time: 1.0)
        
        fadeInAnim(elem: energy, time: 1.0)
        
        fadeInAnim(elem: happiness, time: 1.0)
        
        fadeInAnim(elem: health, time: 1.0)
        
    }
    
    func toBathroomAnim() {
        
    }
    
}

// MARK: Swipe Handler

extension TamagotchiMainScene {
    
    func addSwipeGestureRecognizers () {
        let gestureDirections : [UISwipeGestureRecognizer.Direction] = [.up, .right, .down, .left]
        for gestureDirection in gestureDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gestureDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    @objc func handleSwipe (gesture: UIGestureRecognizer) {
        
        if let gesture = gesture as? UISwipeGestureRecognizer {
            
            switch gesture.direction {
                
            case .up :
                print("UP")
            case .left :
                
                
                if activeRoom == 0 && lightswitch == false {
                    
                    let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
                    label.run(goright)
                    
                    activeRoom =  1
                    
                    
                }
                
                else if activeRoom == 1  && settingsOn == false {
                    
                    let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
                    label.run(goright)
                    
                    activeRoom = 2
                    
                    
                }
                
                else if activeRoom == 2 {
                    
                }
                
                
                print("LEFT, \(activeRoom)")
            case .down :
                print("DOWN")
            case .right :
                
                if activeRoom == 0 {
                    
                }
                
                else if activeRoom == 1 && settingsOn == false {
                    
                    let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                    label.run(goleft)
                    
                    activeRoom = 0
                }
                
                else if activeRoom == 2 {
                    
                    let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                    label.run(goleft)
                    
                    activeRoom = 1
                }
                
                
                
                print("RIGHT, \(activeRoom)")
            default :
                print("NOPE")
            }
        }
        
    }
}
