//
//  CustomizationScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Antonio Emanuele Cutarella on 30/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

class ShopScene : SKScene {
    
    
    let contentNode = SKNode()
    let contentNodeBackButton = SKNode()
    let blurNode = SKShapeNode()
    let effectNode = SKEffectNode()
    let box = CGSize(width : UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
    
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
    
    
    //    var wasInitialized: Bool = false
    
    override func didMove(to view: SKView) {
        setupShopScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                
                if node.name == "backbutton" {
                    let tamagotchiMainScene = TamagotchiMainScene(size: (view?.frame.size)!)
                    //                    tamagotchiMainScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 0.5)
                    self.view?.presentScene(tamagotchiMainScene, transition: transition)
                }
                
                
                if (node.name == "foodCategory") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "clothesCategory") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "pictureCategory") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "twitchCategory") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
                if (node.name == "controllerCategory") {
                    
                    self.curr = node
                    self.checkSwipe = false
                    nodes.append(node)
                    
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            
            if (node.name == "foodCategory") {
                scene?.childNode(withName: "shape")?.alpha = 1
                scene?.childNode(withName: "shape")?.position = CGPoint(x: node.position.x, y: node.position.y)
                //                scene?.childNode(withName: "shapeFood")?.alpha = 1
                //                scene?.childNode(withName: "shapeClothes")?.alpha = 0
                //                scene?.childNode(withName: "shapePicture")?.alpha = 0
                //                scene?.childNode(withName: "shapeTwitch")?.alpha = 0
                //                scene?.childNode(withName: "shapeController")?.alpha = 0
                
            }
            
            if (node.name == "clothesCategory") {
                scene?.childNode(withName: "shape")?.alpha = 1
                scene?.childNode(withName: "shape")?.position = CGPoint(x: node.position.x, y: node.position.y)
            }
            
            if (node.name == "pictureCategory") {
                scene?.childNode(withName: "shape")?.alpha = 1
                scene?.childNode(withName: "shape")?.position = CGPoint(x: node.position.x, y: node.position.y)
            }
            
            if (node.name == "twitchCategory") {
                scene?.childNode(withName: "shape")?.alpha = 1
                scene?.childNode(withName: "shape")?.position = CGPoint(x: node.position.x, y: node.position.y)
            }
            
            if (node.name == "controllerCategory") {
                scene?.childNode(withName: "shape")?.alpha = 1
                scene?.childNode(withName: "shape")?.position = CGPoint(x: node.position.x, y: node.position.y)
            }
            
            
            
        }
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}


// MARK: - Schermata Principale
extension ShopScene {
    
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
    
    func ShopTitle() {
        let myLabel = SKLabelNode(fontNamed: "Mabook")
        myLabel.text = "Shop".localized()
        myLabel.fontSize = 30
        //        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.09)
        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.165)
        self.addChild(myLabel)
    }
    
    func Coins() {
        let moneyLabel = SKLabelNode(fontNamed: "Mabook")
        moneyLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.money)"
        moneyLabel.fontSize = 20
        moneyLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.1, y: UIScreen.main.bounds.maxY*0.9)
        addChild(moneyLabel)
        
        let coin = SKSpriteNode(imageNamed: "Coin.png")
        coin.setScale(0.05)
        coin.position = CGPoint(x: UIScreen.main.bounds.maxX*0.2, y: UIScreen.main.bounds.maxY*0.9)
        addChild(coin)
    }
    
    func Bits() {
        let bitsLabel = SKLabelNode(fontNamed: "Mabook")
        bitsLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.bite)"
        bitsLabel.fontSize = 20
        bitsLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.4, y: UIScreen.main.bounds.maxY*0.9)
        addChild(bitsLabel)
        
        let bits = SKSpriteNode(imageNamed: "bits.png")
        bits.setScale(0.05)
        bits.position = CGPoint(x: UIScreen.main.bounds.maxX*0.5, y: UIScreen.main.bounds.maxY*0.9)
        addChild(bits)
    }
    
    func Followers() {
        let followerLabel = SKLabelNode(fontNamed: "Mabook")
        followerLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.followers)"
        followerLabel.fontSize = 20
        followerLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.7, y: UIScreen.main.bounds.maxY*0.9)
        addChild(followerLabel)
        
        let followers = SKSpriteNode(imageNamed: "followers.png")
        followers.setScale(0.05)
        followers.position = CGPoint(x: UIScreen.main.bounds.maxX*0.8, y: UIScreen.main.bounds.maxY*0.9)
        addChild(followers)
    }
    
    
    /*
     Category Bar
     */
    
    func foodCategory() {
        let food = SKSpriteNode(imageNamed: "food.png")
        food.name = "foodCategory"
        food.setScale(0.05)
        food.position = CGPoint(x: UIScreen.main.bounds.maxX*0.10, y: UIScreen.main.bounds.maxY*0.80)
        addChild(food)
        
        //        let quadrato = SKShapeNode(rectOf: box, cornerRadius: 6)
        //        quadrato.position = CGPoint(x: followers.position.x ,y: followers.position.y)
        //        quadrato.setScale(0.4)
        //        quadrato.strokeColor = UIColor.purple
        //        quadrato.name = "foodShape"
        //        quadrato.alpha = 1  // set red to 50% transparent
        //        addChild(quadrato)
    }
    
    
    func clothesCategory() {
        let clothes = SKSpriteNode(imageNamed: "clothes.png")
        clothes.name = "clothesCategory"
        clothes.setScale(0.05)
        clothes.position = CGPoint(x: UIScreen.main.bounds.maxX*0.30, y: UIScreen.main.bounds.maxY*0.80)
        addChild(clothes)
    }
    
    func pictureCategory() {
        let picture = SKSpriteNode(imageNamed: "picture.png")
        picture.name = "pictureCategory"
        picture.setScale(0.05)
        picture.position = CGPoint(x: UIScreen.main.bounds.maxX*0.50, y: UIScreen.main.bounds.maxY*0.80)
        addChild(picture)
    }
    
    func twitchCategory() {
        let twitch = SKSpriteNode(imageNamed: "twitch_category.png")
        twitch.name = "twitchCategory"
        twitch.setScale(0.05)
        twitch.position = CGPoint(x: UIScreen.main.bounds.maxX*0.70, y: UIScreen.main.bounds.maxY*0.80)
        addChild(twitch)
    }
    
    func controllerCategory() {
        let controller = SKSpriteNode(imageNamed: "controller.png")
        controller.name = "controllerCategory"
        controller.setScale(0.05)
        controller.position = CGPoint(x: UIScreen.main.bounds.maxX*0.90, y: UIScreen.main.bounds.maxY*0.80)
        addChild(controller)
    }
    
    func shapeSpawner() {
        
        var quadrato = SKSpriteNode(imageNamed: "shapeShop.png")
        
        quadrato.name = "shape"
        
        quadrato.setScale(0.1)
        
        quadrato.zPosition = 20000000
        
        quadrato.position = CGPoint(x: (scene?.childNode(withName: "foodCategory")?.position.x)!,y: (scene?.childNode(withName: "foodCategory")?.position.y)!)
        quadrato.alpha = 0
        addChild(quadrato)
    }
    
    
    func setupShopScene() {
        
        BlurEffect()
        BackButton()
        ShopTitle()
        Coins()
        Bits()
        Followers()
        foodCategory()
        clothesCategory()
        pictureCategory()
        twitchCategory()
        controllerCategory()
        shapeSpawner()
        
        //        self.wasInitialized = true
        
    }
    
    
}

