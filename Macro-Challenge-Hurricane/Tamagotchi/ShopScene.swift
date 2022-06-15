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
    
    
    let initialPos = CGPoint(x: UIScreen.main.bounds.width * 0.17, y: UIScreen.main.bounds.height * 0.72)
    var HorizontalOffset = CGFloat(UIScreen.main.bounds.width * 0.33)
    var VerticalOffset = CGFloat(UIScreen.main.bounds.height * 0.15)
    var elemCorrente = 0
    var row : CGFloat = 0
    var inventario = Macro_Challenge_HurricaneApp.inventory
    
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
    
    func spawnObject(item: Consumable) {
        let quadrato = SKShapeNode(rectOf: box)
        quadrato.position = CGPoint(x: initialPos.x + (HorizontalOffset * CGFloat(elemCorrente)), y: initialPos.y - (VerticalOffset * row))
        addChild(quadrato)
        let img = SKSpriteNode(imageNamed: item.consumable_image)
        img.size = CGSize(width: quadrato.frame.size.width * 0.7, height: quadrato.frame.size.height * 0.7)
        img.position = CGPoint( x: quadrato.position.x, y: quadrato.position.y - quadrato.frame.size.height * 0.145)
        img.zPosition = 20
        img.name = item.name
        
        
        let roundedR = SKShapeNode(rect: CGRect(origin: CGPoint(x: (img.position.x) - (img.size.width)/2 , y: (img.position.y) - (img.size.height)/2) , size: img.size), cornerRadius: 10)
        roundedR.fillColor = UIColor.lightGray
        roundedR.zPosition = 10
        roundedR.alpha = 0.7
        
        addChild(roundedR)
        img.size = CGSize(width: img.size.width * 0.88, height: img.size.height * 0.88)
        addChild(img)
        
        let imgName = SKLabelNode(fontNamed: "Mabook")
        imgName.text = item.name
        imgName.fontSize = 18
        imgName.fontColor = UIColor.white
        imgName.position = CGPoint(x: img.position.x, y: img.position.y + img.size.height * 0.64)
        imgName.zPosition = 100
        
        addChild(imgName)
        
        quadrato.alpha = 0
    }
    
    
    func calcoli() {
        let displayedI = inventario.selectForDisplay()
        let quantityI = inventario.displayCount()
        var e = 0
        for el in displayedI {
            if (elemCorrente+1)%3 == 1 {
                spawnObject(item: el)
                elemCorrente+=1
            } else if (elemCorrente+1)%3 == 2 {
                spawnObject(item: el)
                elemCorrente+=1
            } else if (elemCorrente+1)%3 == 0 {
                spawnObject(item: el)
                elemCorrente = 0
                row += 1
            }
            e = e + 1
        }
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
        
        calcoli()
        
        //        self.wasInitialized = true
        
    }
    
    
}

