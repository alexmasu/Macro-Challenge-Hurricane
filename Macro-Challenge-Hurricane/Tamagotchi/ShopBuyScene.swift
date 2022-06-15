//
//  ShopBuyScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Alessandro Masullo on 15/06/22.
//

import Foundation
import SpriteKit

class ShopBuyScene : SKScene {
    
    
    let contentNode = SKNode()
    let contentNodeBackButton = SKNode()
    let blurNode = SKShapeNode()
    let effectNode = SKEffectNode()
    let square1 = SKShapeNode()
    let square2 = SKShapeNode()
    let square3 = SKShapeNode()
    
    let hamburger = SKSpriteNode(imageNamed: "Hamburger.png")
    
    let box = CGSize(width : UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
    let initialPos = CGPoint(x: UIScreen.main.bounds.width * 0.17, y: UIScreen.main.bounds.height * 0.72)
    var HorizontalOffset = CGFloat(UIScreen.main.bounds.width * 0.33)
    var VerticalOffset = CGFloat(UIScreen.main.bounds.height * 0.15)
    var elemCorrente = 0
    var row : CGFloat = 0
    var inventario = Macro_Challenge_HurricaneApp.inventory
    var settingContainer = SKShapeNode()
    var nodes = [SKNode()]
    var label = SKSpriteNode()
    
    var item : Consumable
    
    private var curr : SKNode?
    
    var hungerBarShapeNode = SKShapeNode()
    var thirstBarShapeNode = SKShapeNode()
    var cleanBarShapeNode = SKShapeNode()
    var energyBarShapeNode = SKShapeNode()
    var healthBarShapeNode = SKShapeNode()
    var happyBarShapeNode = SKShapeNode()
    
    var hungerRectangle = CGRect()
    var thirstRectangle = CGRect()
    var cleanRectangle = CGRect()
    var energyRectangle = CGRect()
    var healthRectangle = CGRect()
    var happyRectangle = CGRect()
    
    override func didMove(to view: SKView) {
        setupInventoryUseScene()
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
                
                
                if node.name == "useButton" {
                    
                    Macro_Challenge_HurricaneApp.inventory.consume(mochi: Macro_Challenge_HurricaneApp.mochi, selected: item.id)
                    
                    let tamagotchiMainScene = TamagotchiMainScene(size: (view?.frame.size)!)
                    
                    let transition = SKTransition.fade(withDuration: 0.5)
                    self.view?.presentScene(tamagotchiMainScene, transition: transition)
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let node = self.curr {
            let location = touch.location(in: self)
            
            if node.name == "backbutton" {
                
                let shopScene = ShopScene(size: (view?.frame.size)!)
                //                    tamagotchiMainScene.size = (view?.frame.size)!
                let transition = SKTransition.fade(withDuration: 0.5)
                self.view?.presentScene(shopScene, transition: transition)
            }
            
        }
        
        self.curr = nil
        
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
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
}


// MARK: - Schermata Principale
extension ShopBuyScene {
    
    func BlurEffectUse(){
        
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
    
    
    func BackButtonUse() {
        let leftCornerSymbol = SKSpriteNode(imageNamed: "BackButton.png")
        //        leftCornerSymbol.setScale(1.0)
        leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.15)
        
        leftCornerSymbol.name = "backbutton"
        addChild(leftCornerSymbol)
    }
    
    func InventoryTitleUse() {
        let myLabel = SKLabelNode(fontNamed: "Mabook")
        myLabel.text = "Inventory".localized()
        myLabel.fontSize = 30
        //        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.09)
        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.165)
        self.addChild(myLabel)
        
    }
    
    func inventoryUseElements(){
        
        
        let itemNameLabel = SKLabelNode(fontNamed: "Mabook")
        itemNameLabel.text = item.name
        itemNameLabel.fontColor = UIColor.white
        itemNameLabel.position = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.735)
        itemNameLabel.fontSize = 40
        addChild(itemNameLabel)
        
        let quadrato = SKShapeNode(rectOf: box)
        quadrato.position = CGPoint(x:  frame.width * 0.5, y: frame.height * 0.63)
        addChild(quadrato)
        let img = SKSpriteNode(imageNamed: item.consumable_image)
        img.size = CGSize(width: quadrato.frame.size.width * 1.2, height: quadrato.frame.size.height * 1.2)
        img.position = CGPoint( x: quadrato.position.x, y: quadrato.position.y - quadrato.frame.size.height * 0.145)
        img.zPosition = 20
        
        
        
        let roundedR = SKShapeNode(rect: CGRect(origin: CGPoint(x: (img.position.x) - (img.size.width)/2 , y: (img.position.y) - (img.size.height)/2) , size: img.size), cornerRadius: 10)
        roundedR.fillColor = UIColor.lightGray
        roundedR.zPosition = 10
        roundedR.alpha = 0.7
        roundedR.strokeColor = .clear
        
        addChild(roundedR)
        img.size = CGSize(width: img.size.width * 0.88, height: img.size.height * 0.88)
        addChild(img)
        
        
        let itemDescLabel = SKLabelNode(fontNamed: "Mabook")
        itemDescLabel.text = item.info
        itemDescLabel.fontColor = UIColor.white
        itemDescLabel.fontSize = 28
        itemDescLabel.position = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.395)
        itemDescLabel.preferredMaxLayoutWidth = CGFloat(self.size.width * 0.9)
        itemDescLabel.yScale = 0.9
        itemDescLabel.xScale = 0.9
        itemDescLabel.numberOfLines = 4
        
        
        addChild(itemDescLabel)
        
        let roundedUse = SKShapeNode(rect: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width * 0.1 , y: UIScreen.main.bounds.height * 0.17) , size: CGSize(width: 0.8 * UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)), cornerRadius: 10)
        roundedUse.fillColor = UIColor.lightGray
        roundedUse.zPosition = 10
        roundedUse.alpha = 0.5
        roundedUse.strokeColor = .clear
        roundedUse.name = "useButton"
        
        addChild(roundedUse)
        
        let UseLabel = SKLabelNode(fontNamed: "Mabook")
        UseLabel.text = "Buy".localized()
        UseLabel.fontColor = UIColor.white
        UseLabel.position = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.2025)
        UseLabel.fontSize = 40
        UseLabel.zPosition = 200
        addChild(UseLabel)
        
        
        
        quadrato.alpha = 0
    }
    
    func setupInventoryUseScene() {
        
        BlurEffectUse()
        BackButtonUse()
        InventoryTitleUse()
        inventoryUseElements()
        
    }
}
