//
//  TamagotchiMainScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 23/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

class TamagotchiMainScene : SKScene {
    
    var gameLogic: StreamMochiGameLogic = StreamMochiGameLogic.shared
    
    var switchpress = SKSpriteNode(imageNamed: "lampadina.png")
    let minigames = SKSpriteNode(imageNamed: "minigames.png")
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
    let square = SKSpriteNode(imageNamed: "mochibody000.png")
    let face = SKSpriteNode(imageNamed: "felicio.png")
    let monitor = SKSpriteNode(imageNamed: "Monitor.png")
    let streamingmonitor = SKSpriteNode(imageNamed: "Monitor2.png")
    let twitchbutton = SKSpriteNode(imageNamed: "Twix.png")
    let hunger = SKSpriteNode(imageNamed: "HungerButton.png")
    let thirst = SKSpriteNode(imageNamed: "ThirstGroup.png")
    let cleaning = SKSpriteNode(imageNamed: "CleanlinessGroup.png")
    let energy = SKSpriteNode(imageNamed: "StaminaGroup.png")
    let happiness = SKSpriteNode(imageNamed: "HappinessGroup.png")
    let health = SKSpriteNode(imageNamed: "HealthGroup.png")
    let soap1 = SKSpriteNode(imageNamed: "soap.png")
    let soap2 = SKSpriteNode(imageNamed: "soap.png")
    let soap3 = SKSpriteNode(imageNamed: "soap.png")
    let soap4 = SKSpriteNode(imageNamed: "soap.png")
    let soap5 = SKSpriteNode(imageNamed: "soap.png")
    let doccino = SKSpriteNode(imageNamed: "Doccino.png")
    let water1 = SKSpriteNode(imageNamed: "acqua.png")
    let water2 = SKSpriteNode(imageNamed: "acqua.png")
    let water3 = SKSpriteNode(imageNamed: "acqua.png")
    let water4 = SKSpriteNode(imageNamed: "acqua.png")
    let water5 = SKSpriteNode(imageNamed: "acqua.png")
    //    let poop = SKSpriteNode(imageNamed: "poop.png")
    
    var poopPositions: [CGPoint] = [
        CGPoint(x: UIScreen.main.bounds.maxX*0.24, y: UIScreen.main.bounds.maxY*0.18),
        CGPoint(x: UIScreen.main.bounds.maxX*0.10, y: UIScreen.main.bounds.maxY*0.2),
        CGPoint(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.49),
        CGPoint(x: UIScreen.main.bounds.maxX*0.8, y: UIScreen.main.bounds.maxY*0.2),
        CGPoint(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.2)
    ]
    
    //    var poopPositionsDict: [String: CGPoint] = [
    //        "position1":CGPoint(x: UIScreen.main.bounds.maxX*0.10, y: UIScreen.main.bounds.maxY*0.5),
    //        "position2":CGPoint(x: UIScreen.main.bounds.maxX*0.10, y: UIScreen.main.bounds.maxY*0.4),
    //        "position3":CGPoint(x: UIScreen.main.bounds.midX*0.24, y: UIScreen.main.bounds.midY*0.4),
    //        "position4":CGPoint(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.49),
    //        "position5":CGPoint(x: UIScreen.main.bounds.maxX*0.9, y: UIScreen.main.bounds.maxY*0.2)
    //    ]
    
    
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
    
    var arcHunger = UIBezierPath()
    var arcThirst = UIBezierPath()
    var arcClean = UIBezierPath()
    var arcEnergy = UIBezierPath()
    var arcHappy = UIBezierPath()
    var arcHealth = UIBezierPath()
    
    var arcHungerBar = SKShapeNode()
    var arcThirstBar = SKShapeNode()
    var arcCleanBar = SKShapeNode()
    var arcEnergyBar = SKShapeNode()
    var arcHappyBar = SKShapeNode()
    var arcHealthBar = SKShapeNode()
    
    let verdeAcqua = UIColor(named: "verdeAcqua")!
    let arancione = UIColor(named:"arancione")!
    let rosso = UIColor(named: "rosso")!
    
    var idlearray : [String] = ["000"]
    var idlemochi : [SKTexture] = []
    var idle_sounds : [String] = ["Nya Nya", "Miao", "Uwu Uwu", "Ora Ora Ora", "Muda Muda Muda", "Harambe", "Praise The Sun", "Merz", "King"]
    var soundtime = Int.random(in: 30...120)
//    var soundtime = 5
    var prev_sec : Double = 0
    
    var wasInitialized: Bool = false
    
    //    override init(size: CGSize) {
    //        super.init(size: size)
    //
    //        let doccino = SKSpriteNode(imageNamed: "Doccino")
    //        doccino.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.height * 0.09)
    //        doccino.name = "doccino"; // set the name for your sprite
    //        doccino.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
    //        bathroom.addChild(doccino)
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    
    override func didMove(to view: SKView) {
        
        label = SKSpriteNode(color: .clear, size: CGSize(width: (bedroom.size.width+background.size.width+bathroom.size.width), height: UIScreen.main.bounds.height))
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.isUserInteractionEnabled = false
        addChild(label)
        setupScene()
        addSwipeGestureRecognizers()
        poopGenerator(poop_number: Macro_Challenge_HurricaneApp.mochi.nPoop)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        if prev_sec == 0 {
            prev_sec = currentTime
//            print("inif")
        }
        else {
//            print("\(prev_sec)")
            if currentTime - prev_sec > 1 {
                
                soundtime -= 1
//                print("\(soundtime)")
                prev_sec = currentTime
            }

        }
        
        if soundtime == 0 {
            SKTAudio.sharedInstance().playSoundEffect(idle_sounds[Int.random(in: 0...8)])
            soundtime = Int.random(in: 30...120)
//            soundtime = 10
        }
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
                
                
                if (node.name == "monitor") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if node.name == ("monitor2") {
                    self.curr = node
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
                
                if (node.name == "switchpress") {
                    
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "doccino") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "sponge") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "soap1") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "soap2") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "soap3") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "soap4") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "soap5") {
                    self.curr = node
                    nodes.append(node)
                }
                
                
                if (node.name == "water1") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "water2") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "water3") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "water4") {
                    self.curr = node
                    nodes.append(node)
                }
                
                if (node.name == "water5") {
                    self.curr = node
                    nodes.append(node)
                }
                
                
                if (node.name == "shop") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                if (node.name == "inventory") {
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                }
                
                if (node.name == "customization") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                if (node.name == "minigames") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "poop") {
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                }
                
                if (node.name == "info") {
                    self.curr = node
                }
            }
            
        }
        for el in nodes {
            print("\(String(describing: el.name))-> ")
        }
        nodes.removeAll()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            
            
            //            else {
            print("\(String(describing: node.name))...")
            
            // Far lavare l'ometto.
            
            if (node.name == "ometto") && activeRoom != 2 {
                if omettoOn == false {
                    spawnStatsButtons()
                    updateStatBars()
                    
                    omettoOn = true
                }
                
                else if omettoOn == true {
                    omettofadeOut(fadetime: 0.5)
                    omettoOn = false
                }
            }
            
            else if (node.name == "ometto") && activeRoom == 2 {
                
                bathroom.removeChildren(in: [water1,water2,water3,water4,water5])
                spawnSoap()
            }
            
            if (node.name == "doccino") {
                removeSoap()
                soapApplied = 1
            }
            
            if (node.name == "twitch") {
                gameLogic.temp_bool = true
            }
            
            if node.name == "switchpress" {
                if lightswitch == false {
                    setBedroomBackgroundNight()
                    lightswitch = true
                } else if lightswitch == true {
                    setBedroomBackgroundDay()
                    lightswitch = false
                }
            }
            
            if (node.name == "monitor") {
                
                if omettoOn == false {
                    if startstream == false {
                        square.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.2, y: frame.midY + UIScreen.main.bounds.height * 0.045)
                        square.xScale = -0.8
                        //                        removeChildren(in: [monitor])
                        //                        background.addChild(streamingmonitor)
                        monitor.texture = SKTexture(imageNamed: "Monitor2.png")
                        startstream = true
                    }
                    else if startstream == true {
                        square.position = CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.21)
                        square.xScale = 1.0
                        square.setScale(0.8)
                        //                        background.removeChildren(in: [streamingmonitor])
                        monitor.texture = SKTexture(imageNamed: "Monitor.png")
                        startstream = false
                    }
                }
                else {
                    
                    omettofadeOut(fadetime: 0.5)
                    
                    
                    if startstream == false {
                        square.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.2, y: frame.midY + UIScreen.main.bounds.height * 0.045)
                        square.xScale = -0.8
                        //                        removeChildren(in: [monitor])
                        //                        background.addChild(streamingmonitor)
                        monitor.texture = SKTexture(imageNamed: "Monitor2.png")
                        startstream = true
                    }
                    else if startstream == true {
                        square.position = CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.21)
                        square.xScale = 1.0
                        square.setScale(0.8)
                        //                        background.removeChildren(in: [streamingmonitor])
                        monitor.texture = SKTexture(imageNamed: "Monitor.png")
                        startstream = false
                    }
                }
                
            }
            
            
            if (node.name == "shop") {
                
                let shopScene = ShopScene()
                shopScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(shopScene, transition: transition)
                
            }
            
            if (node.name == "inventory") {
                let inventoryScene = InventoryScene()
                inventoryScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(inventoryScene, transition: transition)
            }
            
            if (node.name == "customization") {
                
                let customizationScene = CustomizationScene()
                customizationScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(customizationScene, transition: transition)
                
            }
            
            if (node.name == "minigames") {
                Macro_Challenge_HurricaneApp.mochi.happiness = min(100, Macro_Challenge_HurricaneApp.mochi.happiness+10)
                let minigamesScene = MinigamesScene()
                minigamesScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(minigamesScene, transition: transition)
            }
            
            if (node.name == "poop") {
                print("poop toccato")
                Macro_Challenge_HurricaneApp.mochi.pickUpPoop()
                node.removeFromParent()
                print("npoop = \(Macro_Challenge_HurricaneApp.mochi.nPoop)")
            }
            
            if (node.name == "info") {
                
                if gameLogic.show_info == false {
                    gameLogic.show_info = true
                }
                else {
                    gameLogic.show_info = false
                }
                
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
        switchpress.texture = SKTexture(imageNamed: "spenta.png")
        bedroom.removeAllChildren()
        label.removeChildren(in: [bedroom])
        label.addChild(bedroomNight)
        bedroomNight.addChild(nightlight)
        lightswitch = true
    }
    
    func setBedroomBackgroundDay(){
        switchpress.texture = SKTexture(imageNamed: "lampadina.png")
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
        
        let info = SKSpriteNode(imageNamed: "info.png")
        info.setScale(0.65)
        info.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.13, y: frame.maxY - UIScreen.main.bounds.height * 0.17)
        info.name = "info"
        addChild(info)
        
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
        
        hunger.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.34, y: square.position.y + UIScreen.main.bounds.height * 0.4 )
        hunger.setScale(0.8)
        hunger.name = "hunger"
        hunger.alpha = 0.0
        
        thirst.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.29, y: square.position.y + UIScreen.main.bounds.height * 0.49)
        thirst.setScale(0.8)
        thirst.name = "thirst"
        thirst.alpha = 0.0
        
        cleaning.position = CGPoint(x: square.position.x - UIScreen.main.bounds.width * 0.11, y: square.position.y + UIScreen.main.bounds.height * 0.54)
        cleaning.setScale(0.8)
        cleaning.name = "cleanliness"
        cleaning.alpha = 0.0
        
        energy.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.11, y: square.position.y + UIScreen.main.bounds.height * 0.54)
        energy.setScale(0.8)
        energy.name = "energy"
        energy.alpha = 0.0
        
        happiness.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.34, y: square.position.y + UIScreen.main.bounds.height * 0.4)
        happiness.setScale(0.8)
        happiness.name = "happiness"
        happiness.alpha = 0.0
        
        health.position = CGPoint(x: square.position.x + UIScreen.main.bounds.width * 0.29, y: square.position.y + UIScreen.main.bounds.height * 0.49)
        health.setScale(0.8)
        health.name = "health"
        health.alpha = 0.0
        
        
        //        Macro_Challenge_HurricaneApp.mochi.hunger = 90
        
        arcHunger = UIBezierPath(arcCenter: hunger.position, radius: (hunger.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.hunger)) / Macro_Challenge_HurricaneApp.mochi.maxHunger) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHungerBar.lineWidth = (hunger.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcHungerBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcHungerBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcHungerBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) < 0.10 {
            arcHungerBar.fillColor = rosso
            
            arcHunger = UIBezierPath(arcCenter: hunger.position, radius: (hunger.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHungerBar.path = arcClean.cgPath
        arcHungerBar.alpha = 0.0
        
        addChild(arcHungerBar)
        //        Macro_Challenge_HurricaneApp.mochi.thirst = 100
        
        arcThirst = UIBezierPath(arcCenter: thirst.position, radius: (thirst.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.thirst)) / Macro_Challenge_HurricaneApp.mochi.maxThirst) + 90 ).degreesToRadians(), clockwise: false)
        
        arcThirstBar.lineWidth = (thirst.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) > 0.49{
            arcThirstBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxThirst) > 0.24 {
            
            arcThirstBar.strokeColor = arancione
        }else {
            arcThirstBar.strokeColor = rosso
        }
        
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) < 0.10 {
            arcThirstBar.fillColor = rosso
            
            arcThirst = UIBezierPath(arcCenter: thirst.position, radius: (thirst.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcThirstBar.path = arcThirst.cgPath
        arcThirstBar.alpha = 0.0
        
        addChild(arcThirstBar)
        
        arcClean = UIBezierPath(arcCenter: cleaning.position, radius: (cleaning.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.cleanlyness)) / Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) + 90 ).degreesToRadians(), clockwise: false)
        
        arcCleanBar.lineWidth = (cleaning.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcCleanBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcCleanBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcCleanBar.strokeColor = rosso
        }
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) < 0.10 {
            arcCleanBar.fillColor = rosso
            
            arcClean = UIBezierPath(arcCenter: cleaning.position, radius: (cleaning.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcCleanBar.path = arcClean.cgPath
        arcCleanBar.alpha = 0.0
        
        
        addChild(arcCleanBar)
        
        arcEnergy = UIBezierPath(arcCenter: energy.position, radius: (energy.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.energy)) / Macro_Challenge_HurricaneApp.mochi.maxEnergy) + 90 ).degreesToRadians(), clockwise: false)
        
        arcEnergyBar.lineWidth = (energy.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcEnergyBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcEnergyBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcEnergyBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) < 0.10 {
            arcEnergyBar.fillColor = rosso
            
            arcEnergy = UIBezierPath(arcCenter: energy.position, radius: (energy.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcEnergyBar.path = arcEnergy.cgPath
        arcEnergyBar.alpha = 0.0
        
        
        addChild(arcEnergyBar)
        
        arcHealth = UIBezierPath(arcCenter: health.position, radius: (health.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.health)) / Macro_Challenge_HurricaneApp.mochi.maxHealth) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHealthBar.lineWidth = (health.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) > 0.49{
            arcHealthBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) > 0.24 {
            arcHealthBar.strokeColor = arancione
        }else {
            arcHealthBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) < 0.10 {
            arcHealthBar.fillColor = rosso
            
            arcHealth = UIBezierPath(arcCenter: health.position, radius: (health.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHealthBar.path = arcHealth.cgPath
        arcHealthBar.alpha = 0.0
        
        addChild(arcHealthBar)
        
        arcHappy = UIBezierPath(arcCenter: happiness.position, radius: (happiness.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.happiness)) / Macro_Challenge_HurricaneApp.mochi.maxHappiness) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHappyBar.lineWidth = (happiness.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHappiness) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcHappyBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcHappyBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcHappyBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) < 0.10 {
            arcHappyBar.fillColor = rosso
            
            arcHappy = UIBezierPath(arcCenter: happiness.position, radius: (happiness.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHappyBar.path = arcHappy.cgPath
        arcHappyBar.alpha = 0.0
        
        addChild(arcHappyBar)
        
    }
    
    func updateStatBars(){
        
        //        Macro_Challenge_HurricaneApp.mochi.hunger = 0
        //        Macro_Challenge_HurricaneApp.mochi.thirst = 15
        //        Macro_Challenge_HurricaneApp.mochi.cleanlyness = 30
        //        Macro_Challenge_HurricaneApp.mochi.health = 58
        //        Macro_Challenge_HurricaneApp.mochi.happiness = 90
        
        
        
        
        
        arcHunger = UIBezierPath(arcCenter: hunger.position, radius: (hunger.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.hunger)) / Macro_Challenge_HurricaneApp.mochi.maxHunger) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHungerBar.lineWidth = (hunger.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcHungerBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcHungerBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcHungerBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.hunger) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHunger) < 0.10 {
            arcHungerBar.fillColor = rosso
            
            arcHunger = UIBezierPath(arcCenter: hunger.position, radius: (hunger.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHungerBar.path = arcHunger.cgPath
        arcHungerBar.alpha = 1
        
        
        arcThirst = UIBezierPath(arcCenter: thirst.position, radius: (thirst.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.thirst)) / Macro_Challenge_HurricaneApp.mochi.maxThirst) + 90 ).degreesToRadians(), clockwise: false)
        
        arcThirstBar.lineWidth = (thirst.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxThirst) > 0.49{
            arcThirstBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxThirst) > 0.24 {
            
            arcThirstBar.strokeColor = arancione
        }else {
            arcThirstBar.strokeColor = rosso
        }
        
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) / CGFloat(Macro_Challenge_HurricaneApp.mochi.thirst) < 0.10 {
            arcThirstBar.fillColor = rosso
            
            arcThirst = UIBezierPath(arcCenter: thirst.position, radius: (thirst.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcThirstBar.path = arcThirst.cgPath
        arcThirstBar.alpha = 1
        
        
        arcClean = UIBezierPath(arcCenter: cleaning.position, radius: (cleaning.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.cleanlyness)) / Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) + 90 ).degreesToRadians(), clockwise: false)
        
        arcCleanBar.lineWidth = (cleaning.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcCleanBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcCleanBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcCleanBar.strokeColor = rosso
        }
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.cleanlyness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxCleanlyness) < 0.10 {
            arcCleanBar.fillColor = rosso
            
            arcClean = UIBezierPath(arcCenter: cleaning.position, radius: (cleaning.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcCleanBar.path = arcClean.cgPath
        arcCleanBar.alpha = 1
        
        
        
        arcEnergy = UIBezierPath(arcCenter: energy.position, radius: (energy.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.energy)) / Macro_Challenge_HurricaneApp.mochi.maxEnergy) + 90 ).degreesToRadians(), clockwise: false)
        
        arcEnergyBar.lineWidth = (energy.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcEnergyBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcEnergyBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcEnergyBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.energy) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxEnergy) < 0.10 {
            arcEnergyBar.fillColor = rosso
            
            arcEnergy = UIBezierPath(arcCenter: energy.position, radius: (energy.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcEnergyBar.path = arcEnergy.cgPath
        arcEnergyBar.alpha = 1
        
        
        
        arcHealth = UIBezierPath(arcCenter: health.position, radius: (health.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.health)) / Macro_Challenge_HurricaneApp.mochi.maxHealth) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHealthBar.lineWidth = (health.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) > 0.49{
            arcHealthBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) > 0.24 {
            arcHealthBar.strokeColor = arancione
        }else {
            arcHealthBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.health) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHealth) < 0.10 {
            arcHealthBar.fillColor = rosso
            
            arcHealth = UIBezierPath(arcCenter: health.position, radius: (health.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHealthBar.path = arcHealth.cgPath
        arcHealthBar.alpha = 1
        
        
        arcHappy = UIBezierPath(arcCenter: happiness.position, radius: (happiness.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-360 * Macro_Challenge_HurricaneApp.mochi.happiness)) / Macro_Challenge_HurricaneApp.mochi.maxHappiness) + 90 ).degreesToRadians(), clockwise: false)
        
        arcHappyBar.lineWidth = (happiness.size.width / 2 * 0.28)
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.maxHappiness) > 0.49{
            //            arcHungerBar.fillColor = verdeAcqua
            arcHappyBar.strokeColor = verdeAcqua
        }
        else if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) > 0.24 {
            //            arcHungerBar.fillColor = arancione
            arcHappyBar.strokeColor = arancione
        }else {
            //            arcHungerBar.fillColor = rosso
            arcHappyBar.strokeColor = rosso
        }
        
        if CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) / CGFloat(Macro_Challenge_HurricaneApp.mochi.happiness) < 0.10 {
            arcHappyBar.fillColor = rosso
            
            arcHappy = UIBezierPath(arcCenter: happiness.position, radius: (happiness.size.width / 2 ) * 1.15 , startAngle: CGFloat(90).degreesToRadians(), endAngle: CGFloat((Int(Float(-15 + 90 )))).degreesToRadians(), clockwise: false)
            
        }
        arcHappyBar.path = arcHappy.cgPath
        arcHappyBar.alpha = 1
        
    }
    func statsBarDisappear(){
        arcHungerBar.alpha = 0.0
        arcThirstBar.alpha = 0.0
        arcHappyBar.alpha = 0.0
        arcEnergyBar.alpha = 0.0
        arcHealthBar.alpha = 0.0
        arcCleanBar.alpha = 0.0
        
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
    
    func spawnSoap() {
        
        if soapApplied == 0 {
            soapApplied+=1
            print("1")
        }
        
        else if soapApplied == 1 {
            soapApplied+=1
            soap1.setScale(0.5)
            bathroom.addChild(soap1)
            print("2")
        }
        
        else if soapApplied == 2 {
            soapApplied+=1
            soap2.setScale(0.5)
            bathroom.addChild(soap2)
            print("3")
        }
        
        else if soapApplied == 3 {
            soapApplied+=1
            soap3.setScale(0.5)
            bathroom.addChild(soap3)
            print("4")
        }
        
        else if soapApplied == 4 {
            soapApplied+=1
            soap4.setScale(0.5)
            bathroom.addChild(soap4)
            print("5")
            
        }
        else if soapApplied == 5 {
            soapApplied+=1
            soap5.setScale(0.5)
            bathroom.addChild(soap5)
            print("6")
            
        }
        
        else if soapApplied > 6 {
            print("bolleeeee")
        }
    }
    
    func removeSoap() {
        
        if soapApplied == 2 {
            
            bathroom.addChild(water1)
            bathroom.removeChildren(in: [soap1])
            //            soapApplied = 0
        } else if soapApplied == 3 {
            bathroom.addChild(water2)
            bathroom.removeChildren(in: [soap1, soap2])
            
            //            soapApplied = 0
        } else if soapApplied == 4 {
            bathroom.addChild(water3)
            bathroom.removeChildren(in: [soap1,soap2,soap3])
            
            //            soapApplied = 0
        } else if soapApplied == 5 {
            bathroom.addChild(water4)
            bathroom.removeChildren(in: [soap1,soap2,soap3,soap4])
            
            //            soapApplied = 0
        } else if soapApplied == 6 {
            bathroom.addChild(water5)
            bathroom.removeChildren(in:[soap1,soap2,soap3,soap4,soap5])
            
            //            soapApplied = 0
        }
        else {
            print("no soap left to clear")
        }
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
        
        streamingmonitor.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.42, y: frame.midY - UIScreen.main.bounds.height * 0.375)
        //        streamingmonitor.name = "monitor2"
        //        streamingmonitor.setScale(0.8)
        //        background.addChild(streamingmonitor)
        
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
        
        soap1.name = "soap1"
        //        soap1.setScale(2.0)
        soap1.zPosition = 100000.0
        soap1.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 1.1, y: frame.midY - UIScreen.main.bounds.height * 0.75)
        
        soap2.name = "soap2"
        soap2.zPosition = 1000000.0
        //        soap2.setScale(2.0)
        soap2.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.9, y: frame.midY - UIScreen.main.bounds.height * 0.6)
        
        soap3.name = "soap3"
        soap3.zPosition = 1000000.0
        //        soap3.setScale(2.0)
        soap3.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.7, y: frame.midY - UIScreen.main.bounds.height * 0.65)
        
        soap4.name = "soap4"
        soap4.zPosition = 1000000.0
        //        soap4.setScale(2.0)
        soap4.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.5, y: frame.midY - UIScreen.main.bounds.height * 0.58)
        
        soap5.name = "soap5"
        soap5.zPosition = 100000.0
        //        soap5.setScale(2.0)
        soap5.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.35, y: frame.midY - UIScreen.main.bounds.height * 0.68)
        
        switchpress.setScale(0.4)
        switchpress.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.height * 0.09)
        switchpress.name = "switchpress"
        
        doccino.name = "doccino"
        doccino.setScale(0.5)
        doccino.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.5 , y: frame.minY + UIScreen.main.bounds.height * 0.09)
        //        bathroom.addChild(doccino)
        
        water1.name = "water1"
        water1.setScale(2)
        water1.zPosition = 10000.0
        water1.position = CGPoint(x: frame.minX - UIScreen.main.bounds.width * 0.45 , y: frame.minY - UIScreen.main.bounds.height * 0.1)
        
        
        water2.name = "water2"
        water2.setScale(2)
        water2.zPosition = 10000.0
        water2.position = CGPoint(x: frame.minX - UIScreen.main.bounds.width * 0.35 , y: frame.minY - UIScreen.main.bounds.height * 0.1)
        
        
        water3.name = "water3"
        water3.setScale(2)
        water3.zPosition = 10000.0
        water3.position = CGPoint(x: frame.minX - UIScreen.main.bounds.width * 0.25 , y: frame.minY - UIScreen.main.bounds.height * 0.1)
        
        
        water4.name = "water4"
        water4.setScale(2)
        water4.zPosition = 10000.0
        water4.position = CGPoint(x: frame.minX - UIScreen.main.bounds.width * 0.15 , y: frame.minY - UIScreen.main.bounds.height * 0.1)
        
        
        water5.name = "water5"
        water5.setScale(2)
        water5.zPosition = 10000.0
        water5.position = CGPoint(x: frame.minX - UIScreen.main.bounds.width * 0.05 , y: frame.minY - UIScreen.main.bounds.height * 0.1)
        
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
        square.name = "ometto"
        addChild(square)
        
        square.addChild(face)
        
    }
    
    //    func spawnPopUp(){
    
    //        dialogueBackground.anchorPoint = CGPoint(x: 0, y: 0)
    //        labelwrite.position = CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.2, y: frame.midY + UIScreen.main.bounds.height * 0.045)
    //    }
    
    //    func despawnPopUp(){
    //        background.removeChildren(in: [dialogueBackground,labelwrite])
    //    }
    
    func setupScene() {
        
        spawnBackground()
        spawnCornerButtons()
        spawnRoomElements()
        spawnOmetto()
        spawnOmettoStats()
        spawnOmettoButtons()
        spawnSoap()
        removeSoap()
        idleAnim()
        //        spawnPopUp()
        //        despawnPopUp()
        
        self.wasInitialized = true
        
    }
    
}

// MARK: Elements Animations

extension TamagotchiMainScene {
    
    private func idleAnim() {
        var i = 1
        while ( i < 175) {
            if (i < 10) {
                idlearray.append("00" + "\(i)")
            }
            else if (i < 100) {
                idlearray.append("0" + "\(i)")
                
            }
            else if (i > 99) {
                idlearray.append("\(i)")
                
            }
            i += 1
        }
        for el in idlearray {
            idlemochi.append(SKTexture(imageNamed: "mochibody\(el).png"))
            idlemochi.last?.filteringMode = .nearest
        }
        let idle = SKAction.animate(with: idlemochi, timePerFrame: 0.033)
        let idle_forever = SKAction.repeatForever(idle)
        square.run(idle_forever)
        
    }
    
    private func fadeInAnim(elem : SKSpriteNode, time : CGFloat) {
        let comparsa = SKAction.fadeIn(withDuration: time)
        elem.run(comparsa)
    }
    
    private func fadeOutAnim(elem: SKSpriteNode, time: CGFloat) {
        let scomparsa = SKAction.fadeOut(withDuration: time)
        elem.run(scomparsa)
    }
    
    private func fadeOutArchi(elem: SKShapeNode, time: CGFloat) {
        let scomparsa = SKAction.fadeOut(withDuration: time)
        elem.run(scomparsa)
    }
    
    func showDoccino() {
        addChild(doccino)
    }
    
    func showMinigames() {
        
        addChild(minigames)
    }
    
    func hideMinigames() {
        
        removeChildren(in: [minigames])
    }
    
    func hideDoccino() {
        removeChildren(in: [doccino])
    }
    
    func showLightswitch() {
        addChild(switchpress)
    }
    
    func hideLightswitch() {
        removeChildren(in: [switchpress])
    }
    
    private func omettofadeOut(fadetime : CGFloat) {
        
        fadeOutAnim(elem: self.hunger, time: fadetime)
        fadeOutAnim(elem: self.thirst, time: fadetime)
        fadeOutAnim(elem: self.cleaning, time: fadetime)
        fadeOutAnim(elem: self.energy, time: fadetime)
        fadeOutAnim(elem: self.happiness, time: fadetime)
        fadeOutAnim(elem: self.health, time: fadetime)
        
        fadeOutArchi(elem: self.arcHungerBar, time: fadetime)
        fadeOutArchi(elem: self.arcThirstBar, time: fadetime)
        fadeOutArchi(elem: self.arcCleanBar, time: fadetime)
        fadeOutArchi(elem: self.arcEnergyBar, time: fadetime)
        fadeOutArchi(elem: self.arcHappyBar, time: fadetime)
        fadeOutArchi(elem: self.arcHealthBar, time: fadetime)
        
    }
    
    func spawnStatsButtons() {
        
        fadeInAnim(elem: hunger, time: 0.5)
        
        fadeInAnim(elem: thirst, time: 0.5)
        
        fadeInAnim(elem: cleaning, time: 0.5)
        
        fadeInAnim(elem: energy, time: 0.5)
        
        fadeInAnim(elem: happiness, time: 0.5)
        
        fadeInAnim(elem: health, time: 0.5)
        
    }
    
    func toBathroomAnim() {
        let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
        
        let azioni = SKAction.group([
            SKAction.run {
                [self] in
                label.run(goright)
            },
            SKAction.run {
                [self] in
                let move = SKAction.move(to: CGPoint(x: frame.midX - UIScreen.main.bounds.width * 0.15, y: frame.midY - UIScreen.main.bounds.height * 0.08), duration: 0.8)
                square.run(move)
            },
            SKAction.run {
                [self] in
                //                background.removeChildren(in: [streamingmonitor])
                //                background.addChild(monitor)
                monitor.texture = SKTexture(imageNamed: "Monitor.png")
                startstream = false
            }
        ])
        
        self.run(azioni)
    }
    
    func fromBathroomAnim() {
        let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
        
        let azioni1 = SKAction.group([
            SKAction.run {
                [self] in
                label.run(goleft)
            },
            SKAction.run {
                [self] in
                let move = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.21), duration: 0.6)
                square.run(move)
            }
        ])
        
        self.run(azioni1)
    }
    
    private func toBedroomAnim () {
        let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
        
        let azioni = SKAction.group([
            SKAction.run {
                [self] in
                label.run(goleft)
            },
            SKAction.run {
                [self] in
                let move = SKAction.move(to: CGPoint(x: frame.midX, y: frame.midY - UIScreen.main.bounds.height * 0.217), duration: 0.8)
                square.run(move)
            },
            SKAction.run {
                [self] in
                //                background.removeChildren(in: [streamingmonitor])
                //                background.addChild(monitor)
                monitor.texture = SKTexture(imageNamed: "Monitor.png")
                startstream = false
            }
        ])
        
        self.run(azioni)
    }
    
    
    func poopGenerator(poop_number:Int) {
        if poop_number > 0 {
            
            let count = 1...poop_number
            print("numero cacche=\(poop_number)")
            
            var temp_arr = poopPositions
            
            for _ in count {
                
                if let index = temp_arr.indices.randomElement() {
                    let value = temp_arr.remove(at: index)
                    let poop = SKSpriteNode(imageNamed: "poop.png")
                    poop.setScale(0.36)
                    poop.name = "poop"
                    poopPositions.shuffle()
                    poop.position = value
                    addChild(poop)
                }
            }
        }
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
                
                if omettoOn == false {
                    
                    if activeRoom == 0 {
                        
                        if lightswitch == false {
                            
                            let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
                            label.run(goright)
                            
                            showMinigames()
                            hideDoccino()
                            hideLightswitch()
                            
                            activeRoom =  1
                        }
                        else {
                            
                            setBedroomBackgroundDay()
                            lightswitch = false
                            
                            let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
                            label.run(goright)
                            
                            showMinigames()
                            hideDoccino()
                            hideLightswitch()
                            
                            activeRoom =  1
                        }
                        
                        
                        
                    }
                    
                    else if activeRoom == 1   {
                        
                        toBathroomAnim()
                        hideLightswitch()
                        hideMinigames()
                        showDoccino()
                        
                        activeRoom = 2
                        
                        
                    }
                    
                    else if activeRoom == 2 {
                        
                    }
                    
                    
                    print("LEFT, \(activeRoom)")
                }
                else {
                    
                    omettofadeOut(fadetime: 0.1)
                    omettoOn = false
                    if activeRoom == 0 {
                        
                        let goright = SKAction.move(by: CGVector(dx: (-background.frame.width * 1.0), dy: 0), duration: 0.6)
                        label.run(goright)
                        
                        showMinigames()
                        hideDoccino()
                        hideLightswitch()
                        
                        activeRoom =  1
                        
                        
                    }
                    
                    else if activeRoom == 1 {
                        
                        toBathroomAnim()
                        hideLightswitch()
                        hideMinigames()
                        showDoccino()
                        
                        activeRoom = 2
                        
                        
                    }
                    
                    else if activeRoom == 2 {
                        
                    }
                    
                    
                    print("LEFT, \(activeRoom)")
                }
                
                
            case .down :
                print("DOWN")
            case .right :
                
                if omettoOn == false {
                    
                    if activeRoom == 0 {
                        showLightswitch()
                        hideMinigames()
                        hideDoccino()
                    }
                    
                    else if activeRoom == 1 {
                        
                        //                        let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                        //                        label.run(goleft)
                        
                        toBedroomAnim()
                        showLightswitch()
                        hideDoccino()
                        hideMinigames()
                        
                        activeRoom = 0
                    }
                    
                    else if activeRoom == 2 {
                        
                        //                    let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                        //                    label.run(goleft)
                        
                        
                        fromBathroomAnim()
                        showMinigames()
                        hideDoccino()
                        hideLightswitch()
                        
                        activeRoom = 1
                        
                    }
                    
                    print("RIGHT, \(activeRoom)")
                    
                }
                else {
                    omettofadeOut(fadetime: 0.1)
                    omettoOn = false
                    if activeRoom == 0 {
                        showLightswitch()
                        hideMinigames()
                        hideDoccino()
                    }
                    
                    else if activeRoom == 1 {
                        
                        //                        let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                        //                        label.run(goleft)
                        
                        toBedroomAnim()
                        showLightswitch()
                        hideDoccino()
                        hideMinigames()
                        
                        activeRoom = 0
                    }
                    
                    else if activeRoom == 2 {
                        
                        //                    let goleft = SKAction.move(by: CGVector(dx: (background.frame.width * 1.0), dy: 0), duration: 0.6)
                        //                    label.run(goleft)
                        
                        
                        fromBathroomAnim()
                        showMinigames()
                        hideDoccino()
                        hideLightswitch()
                        
                        activeRoom = 1
                        
                    }
                    
                    print("RIGHT, \(activeRoom)")
                    
                }
                
                
                
                
            default :
                print("NOPE")
            }
        }
        
    }
}
