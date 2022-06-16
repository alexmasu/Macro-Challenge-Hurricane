//
//  ShopBuyScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 15/06/22.
//

import Foundation
import SpriteKit
import SwiftUI

class ShopBuyScene : SKScene {
    
    
    var buyCount = 1
    let food = SKSpriteNode(imageNamed: "food.png")
    var boxSize = CGSize()
    var stdSize = CGSize()
    let contentNode = SKNode()
    let contentNodeBackButton = SKNode()
    let blurNode = SKShapeNode()
    let effectNode = SKEffectNode()
    let box = CGSize(width : UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
    
    var refPosition = CGPoint(x: UIScreen.main.bounds.maxX*0.15, y: UIScreen.main.bounds.maxY*0.80)
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
    
    
    let initialPos = CGPoint(x: UIScreen.main.bounds.width * 0.17, y: UIScreen.main.bounds.height * 0.716)
    let initialPos50 = CGPoint(x: UIScreen.main.bounds.width * 0.17, y: UIScreen.main.bounds.height * 0.406)
    var HorizontalOffset = CGFloat(UIScreen.main.bounds.width * 0.33)
    var VerticalOffset = CGFloat(UIScreen.main.bounds.height * 0.15)
    var elemCorrente = 0
    var elemCorrente50 = 0
    var row : CGFloat = 0
    var row50 : CGFloat = 0
    var inventario = Macro_Challenge_HurricaneApp.inventory
    var item : Consumable
    
    //    var wasInitialized: Bool = false
    
    init (itemName: String, size: CGSize){
        var tempName : String
        item = consumableV[0]
        for el in consumableV{
            tempName = el.name
            if tempName == itemName {
                item = el
            }
        }
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMove(to view: SKView) {
        setupShopBuyScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes {
                
                if node.name == "backbutton" {
                    let shopScene = ShopScene(size: (view?.frame.size)!)
                    //                    tamagotchiMainScene.size = (view?.frame.size)!
                    let transition = SKTransition.fade(withDuration: 0.5)
                    self.view?.presentScene(shopScene, transition: transition)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            
        }
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}


// MARK: - Schermata Principale
extension ShopBuyScene {
    
    func BlurEffectB(){
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
        
        //        let categoryBackground = SKShapeNode(rect: CGRect(origin: CGPoint(x: UIScreen.main.bounds.maxX * 0.064, y: UIScreen.main.bounds.maxY * 0.787), size: CGSize(width: UIScreen.main.bounds.maxX * 0.868, height: UIScreen.main.bounds.maxY * 0.0264)), cornerRadius: 5)
        //        categoryBackground.strokeColor = .clear
        //        categoryBackground.fillColor = UIColor(cgColor: CGColor(red: 0.2, green: 0, blue: 0.43, alpha: 0.42))
        let categoryBackground = SKSpriteNode(imageNamed: "selectorBackground1.png")
        categoryBackground.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.5, y: UIScreen.main.bounds.maxY * 0.83)
        categoryBackground.setScale(0.2024)
        categoryBackground.size = (CGSize(width: categoryBackground.size.width * 1.21, height: categoryBackground.size.height * 0.99))
        
        
        categoryBackground.zPosition = 1
        addChild(categoryBackground)
        categoryBackground.alpha = 0
        
        let currenciesBackground = SKSpriteNode(imageNamed: "selectorBackground1.png")
        currenciesBackground.position = CGPoint(x: categoryBackground.position.x, y: categoryBackground.position.y + UIScreen.main.bounds.maxY * 0.1)
        currenciesBackground.size = (CGSize(width: categoryBackground.size.width * 1, height: categoryBackground.size.height ))
        currenciesBackground.zPosition = 1
        addChild(currenciesBackground)
        
        self.addChild(effectNode)
        
        
        
    }
    
    
    func BackButtonB() {
        let leftCornerSymbol = SKSpriteNode(imageNamed: "BackButton.png")
        leftCornerSymbol.setScale(1.0)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.075)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.12)
        leftCornerSymbol.name = "backbutton"
        addChild(leftCornerSymbol)
    }
    
    func ShopTitleB() {
        let myLabel = SKLabelNode(fontNamed: "Mabook")
        myLabel.text = "Shop".localized()
        myLabel.fontSize = 30
        //        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.09)
        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.135)
        self.addChild(myLabel)
    }
    
    func CoinsB() {
        let moneyLabel = SKLabelNode(fontNamed: "Kefa")
        moneyLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.money)"
        moneyLabel.fontSize = 20
        moneyLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.113, y: UIScreen.main.bounds.maxY*0.92)
        moneyLabel.zPosition = 2
        addChild(moneyLabel)
        
        let coin = SKSpriteNode(imageNamed: "Coin.png")
        coin.setScale(0.05)
        coin.position = CGPoint(x: UIScreen.main.bounds.maxX*0.171, y: UIScreen.main.bounds.maxY*0.9308)
        coin.zPosition = 2
        addChild(coin)
    }
    
    func BitsB() {
        let bitsLabel = SKLabelNode(fontNamed: "Kefa")
        bitsLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.bite)"
        bitsLabel.fontSize = 20
        bitsLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.471, y: UIScreen.main.bounds.maxY*0.92)
        bitsLabel.zPosition = 2
        addChild(bitsLabel)
        
        let bits = SKSpriteNode(imageNamed: "bits.png")
        bits.setScale(0.052)
        bits.position = CGPoint(x: UIScreen.main.bounds.maxX*0.525, y: UIScreen.main.bounds.maxY*0.93)
        bitsLabel.zPosition = 2
        addChild(bits)
    }
    
    func FollowersB() {
        let followerLabel = SKLabelNode(fontNamed: "Kefa")
        followerLabel.text = "\(Macro_Challenge_HurricaneApp.currencies.followers)"
        followerLabel.fontSize = 20
        followerLabel.position = CGPoint(x: UIScreen.main.bounds.maxX*0.81, y: UIScreen.main.bounds.maxY*0.92)
        followerLabel.zPosition = 2
        addChild(followerLabel)
        
        let followers = SKSpriteNode(imageNamed: "followers002.png")
        followers.setScale(0.25)
        followers.position = CGPoint(x: UIScreen.main.bounds.maxX*0.87, y: UIScreen.main.bounds.maxY*0.93)
        followers.zPosition = 2
        addChild(followers)
    }
    
    
    /*
     Category Bar
     */
    
    
    func spawnObject() {
        let quadrato = SKShapeNode(rectOf: box)
        quadrato.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.5, y: UIScreen.main.bounds.maxY * 0.68)
        quadrato.setScale(2)
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
        
        let price = SKLabelNode(fontNamed: "Kefa")
        price.text = "\(item.price)"
        price.zPosition = 30
        price.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.445 , y: UIScreen.main.bounds.maxY * 0.33)
        price.fontColor = UIColor.white
        price.fontSize = 40
        addChild(price)
        
        let moneyIcon = SKSpriteNode(imageNamed: "Coin.001")
        moneyIcon.zPosition = 30
        moneyIcon.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.565,y: UIScreen.main.bounds.maxY * 0.3475)
        moneyIcon.setScale(0.4)
        
        let imgDescr = SKLabelNode(fontNamed: "Mabook")
        imgDescr.zPosition = 30
        imgDescr.position = CGPoint(x: img.position.x - img.size.width * 0.065 , y: UIScreen.main.bounds.maxY * 0.40)
        imgDescr.text = item.info
        imgDescr.preferredMaxLayoutWidth = UIScreen.main.bounds.maxX * 0.8
        imgDescr.numberOfLines = 3
        
        addChild(imgDescr)
        
        
        addChild(moneyIcon)
        
        let imgName = SKLabelNode(fontNamed: "Mabook")
        imgName.text = item.name
        imgName.fontSize = 40
        imgName.fontColor = UIColor.white
        imgName.position = CGPoint(x: img.position.x, y: img.position.y + img.size.height * 0.9)
        imgName.zPosition = 100
        
        
        
        addChild(imgName)
        
        let displayAmount = SKSpriteNode(imageNamed: "RectangleAmount.png")
        displayAmount.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.5, y: UIScreen.main.bounds.maxY * 0.26)
        displayAmount.setScale(0.3)
        
        addChild(displayAmount)
        
        let displayCount = SKLabelNode(fontNamed: "Kefa")
        displayCount.text = "\(buyCount)"
        displayCount.zPosition = 30
        displayCount.position = CGPoint(x: displayAmount.position.x, y: displayAmount.position.y - displayAmount.size.height * 0.269)
        displayCount.fontColor = UIColor.white
        displayCount.fontSize = 40
        addChild(displayCount)
        
        let roundedBuy = SKShapeNode(rect: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width * 0.1 , y: UIScreen.main.bounds.height * 0.1) , size: CGSize(width: 0.8 * UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)), cornerRadius: 10)
        roundedBuy.fillColor = UIColor.lightGray
        roundedBuy.zPosition = 10
        roundedBuy.alpha = 0.5
        roundedBuy.strokeColor = .clear
        roundedBuy.name = "buyButton"
        
        
        addChild(roundedBuy)
        
        let buy = SKLabelNode (fontNamed: "Mabook")
        buy.text = "buy".localized()
        buy.zPosition = 500
        buy.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.5 ,y: UIScreen.main.bounds.maxY * 0.135)
        buy.fontColor = UIColor.white
        buy.fontSize = 40
        addChild(buy)
        
        let plusCircle = SKShapeNode(circleOfRadius: UIScreen.main.bounds.maxX*0.05)
        plusCircle.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.73, y:UIScreen.main.bounds.maxY * 0.259)
        plusCircle.zPosition = 600
        plusCircle.name = "plusCircle"
        addChild(plusCircle)
        plusCircle.alpha = 0
        
        let plus = SKLabelNode(fontNamed: "Kefa")
        plus.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.73, y:UIScreen.main.bounds.maxY * 0.24)
        plus.fontSize = 50
        plus.text = "+"
        addChild(plus)
        
        
        let minusCircle = SKShapeNode(circleOfRadius: UIScreen.main.bounds.maxX*0.05)
        minusCircle.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.27, y:UIScreen.main.bounds.maxY * 0.259)
        minusCircle.zPosition = 600
        minusCircle.name = "minusCircle"
        addChild(minusCircle)
        minusCircle.alpha = 0
        
        let minus = SKLabelNode(fontNamed: "Kefa")
        minus.position = CGPoint(x: UIScreen.main.bounds.maxX * 0.27, y:UIScreen.main.bounds.maxY * 0.243 )
        minus.fontSize = 60
        minus.text = "-"
        addChild(minus)
        
        
        quadrato.alpha = 0
        
    }
    
    func setupShopBuyScene() {
        
        BlurEffectB()

        BackButtonB()
        ShopTitleB()
        CoinsB()
        BitsB()
        FollowersB()
        
        spawnObject()
        
        
        //        self.wasInitialized = true
        
    }
    
    
}

