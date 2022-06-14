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
//    var startstream = false
//    var checkSwipe = false
//    var lightswitch = false
//    var mute = false
//    var settingsOn = false
//    var omettoOn = false
//    var leftedge = false
//    var rightedge = false
//    var soapApplied : Int = 0
//    var activeRoom = 1
    private var curr : SKNode?
//    private var swipeStart : CGPoint?
//    private var swipeEnd : CGPoint?
    
    
    //    var wasInitialized: Bool = false
    

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


    


//    var wasInitialized: Bool = false


    override func didMove(to view: SKView) {
        setupInventoryScene()
//        hamburger.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
//        hamburger.setScale(0.1)
//        hamburger.name = "hamburger"
//        addChild(hamburger)
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
            
//            if node.name == "hamburger" {
//
//                print(Macro_Challenge_HurricaneApp.mochi.hunger)
//
//                Macro_Challenge_HurricaneApp.mochi.maxHunger = 100
//
//                Macro_Challenge_HurricaneApp.inventory.consume(mochi: Macro_Challenge_HurricaneApp.mochi, selected: 0)
//
//                print(Macro_Challenge_HurricaneApp.mochi.hunger)
//            }
            
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
//        leftCornerSymbol.setScale(1.0)
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
    
    func stats(mochi: Mochi){
        
        let hungerIcon = SKSpriteNode(imageNamed: "piattto.png")
        hungerIcon.setScale(0.4)
        hungerIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.85, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(hungerIcon)
        
        let thirstIcon = SKSpriteNode(imageNamed: "bicchiere.png")
        thirstIcon.setScale(0.4)
        thirstIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.71, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(thirstIcon)
        
        let cleanIcon = SKSpriteNode(imageNamed: "bolleicon.png")
        cleanIcon.setScale(0.4)
        cleanIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.57, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(cleanIcon)
        
        let energyIcon = SKSpriteNode(imageNamed: "energy.png")
        energyIcon.setScale(0.4)
        energyIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.43, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(energyIcon)
        
        let healthIcon = SKSpriteNode(imageNamed: "salute.png")
        healthIcon.setScale(0.4)
        healthIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.29, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
        self.addChild(healthIcon)
        
        let happyIcon = SKSpriteNode(imageNamed: "smile.png")
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
        
        let barwidth = (happyIcon.size.width) * 0.75
        let barheight = (frame.maxY)/23
        var hungerV = CGFloat(mochi.hunger)
        var thirstV = CGFloat(mochi.thirst)
        var cleanV = CGFloat(mochi.cleanlyness)
        var energyV = CGFloat(mochi.energy)
        var healthV = CGFloat(mochi.health)
        var happyV = CGFloat(mochi.happiness)
       
        var hungerBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
        
        var thirstBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
        
        var cleanBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
        
        var energyBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
        
        var healthBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
        
        var happyBarFill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 5)
       
        var hungerPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: hungerIcon.position.x - (hungerIcon.size.width)/(2 * 1.30), y: hungerIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        var thirstPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: thirstIcon.position.x - (thirstIcon.size.width)/(2 * 1.30), y: thirstIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        var cleanPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: cleanIcon.position.x - (cleanIcon.size.width)/(2 * 1.30), y: cleanIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        var energyPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: energyIcon.position.x - (energyIcon.size.width)/(2 * 1.30), y: energyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        var healthPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: healthIcon.position.x - (healthIcon.size.width)/(2 * 1.30), y: healthIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        var happyPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: happyIcon.position.x - (happyIcon.size.width)/(2 * 1.30), y: happyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
        
        hungerRectangle = CGRect(origin: CGPoint(x: hungerIcon.position.x - (hungerIcon.size.width)/(2 * 1.30), y: hungerIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
        thirstRectangle = CGRect(origin: CGPoint(x: thirstIcon.position.x - (thirstIcon.size.width)/(2 * 1.30), y: thirstIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
        cleanRectangle = CGRect(origin: CGPoint(x: cleanIcon.position.x - (cleanIcon.size.width)/(2 * 1.30), y: cleanIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
        energyRectangle = CGRect(origin: CGPoint(x: energyIcon.position.x - (energyIcon.size.width)/(2 * 1.30), y: energyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
        healthRectangle = CGRect(origin: CGPoint(x: healthIcon.position.x - (healthIcon.size.width)/(2 * 1.30), y: healthIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
        happyRectangle = CGRect(origin: CGPoint(x: happyIcon.position.x - (happyIcon.size.width)/(2 * 1.30), y: happyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23))
        
       
        hungerBarShapeNode.path = hungerPath.cgPath
        thirstBarShapeNode.path = thirstPath.cgPath
        cleanBarShapeNode.path = cleanPath.cgPath
        energyBarShapeNode.path = energyPath.cgPath
        healthBarShapeNode.path = healthPath.cgPath
        happyBarShapeNode.path = happyPath.cgPath
        
        hungerBarShapeNode.fillColor = UIColor.yellow
        hungerBarShapeNode.strokeColor = UIColor.yellow
        
        thirstBarShapeNode.fillColor = UIColor.yellow
        thirstBarShapeNode.strokeColor = UIColor.yellow
        
        cleanBarShapeNode.fillColor = UIColor.yellow
        cleanBarShapeNode.strokeColor = UIColor.yellow
        
        energyBarShapeNode.fillColor = UIColor.yellow
        energyBarShapeNode.strokeColor = UIColor.yellow
        
        healthBarShapeNode.fillColor = UIColor.yellow
        healthBarShapeNode.strokeColor = UIColor.yellow
        
        happyBarShapeNode.fillColor = UIColor.yellow
        happyBarShapeNode.strokeColor = UIColor.yellow
     
        self.addChild(hungerBarShapeNode)
        self.addChild(thirstBarShapeNode)
        self.addChild(cleanBarShapeNode)
        self.addChild(energyBarShapeNode)
        self.addChild(healthBarShapeNode)
        self.addChild(happyBarShapeNode)
        
    }
    
//    quando è 0 deve fare elemCorrente +=1 e row +=1
    
    func spawnObject(item: Consumable){
        let quadrato = SKShapeNode(rectOf: box)
        quadrato.position = CGPoint(x: initialPos.x + (HorizontalOffset * CGFloat(elemCorrente)), y: initialPos.y - (VerticalOffset * row))
        addChild(quadrato)
        let img = SKSpriteNode(imageNamed: item.consumable_image)
        img.size = CGSize(width: quadrato.frame.size.width * 0.7, height: quadrato.frame.size.height * 0.7)
        img.position = CGPoint( x: quadrato.position.x, y: quadrato.position.y - quadrato.frame.size.height * 0.145)
        img.zPosition = 20
        
        
        let roundedR = SKShapeNode(rect: CGRect(origin: CGPoint(x: (img.position.x) - (img.size.width)/2 , y: (img.position.y) - (img.size.width)/2) , size: img.size), cornerRadius: 10)
        roundedR.fillColor = UIColor.gray
        roundedR.zPosition = 10
        
        addChild(roundedR)
        img.size = CGSize(width: img.size.width * 0.88, height: img.size.height * 0.88)
        addChild(img)
        
        let imgName = SKLabelNode(text: item.name)
        
        

        
    }
    
    func calcoli() {
        let displayedI = inventario.selectForDisplay()
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
        }
    }
    
    func update_straight_bar (mochi: Mochi) {
        let barwidth = hungerRectangle.size.width
        let barheight = hungerRectangle.size.height
        var hungerV = CGFloat(mochi.hunger)
        var thirstV = CGFloat(mochi.thirst)
        var cleanV = CGFloat(mochi.cleanlyness)
        var energyV = CGFloat(mochi.energy)
        var healthV = CGFloat(mochi.health)
        var happyV = CGFloat(mochi.happiness)
        
        let verdeAcqua = UIColor(named: "verdeAcqua")!
        let arancione = UIColor(named:"arancione")!
        let rosso = UIColor(named: "rosso")!
        

        var hungerpath = UIBezierPath(roundedRect: CGRect(x: hungerRectangle.minX, y: hungerRectangle.minY, width: barwidth, height: barheight * (hungerV / CGFloat(mochi.maxHunger))), cornerRadius: 3)
        
        
        hungerBarShapeNode.path = hungerpath.cgPath
        if hungerV / CGFloat(mochi.maxHunger) > 0.49{
            hungerBarShapeNode.fillColor = verdeAcqua
            hungerBarShapeNode.strokeColor = verdeAcqua
        }
        else if hungerV / CGFloat(mochi.maxHunger) > 0.24 {
            hungerBarShapeNode.fillColor = arancione
            hungerBarShapeNode.strokeColor = arancione
        }else {
            hungerBarShapeNode.fillColor = rosso
            hungerBarShapeNode.strokeColor = rosso
        }
        
        var thirstpath = UIBezierPath(roundedRect: CGRect(x: thirstRectangle.minX, y: thirstRectangle.minY, width: barwidth, height: barheight * (thirstV / CGFloat(mochi.maxThirst))), cornerRadius: 3)
        
        thirstBarShapeNode.path = thirstpath.cgPath
        if thirstV / CGFloat(mochi.maxThirst) > 0.49{
            thirstBarShapeNode.fillColor = verdeAcqua
            thirstBarShapeNode.strokeColor = verdeAcqua
        }
        else if thirstV / CGFloat(mochi.maxThirst) > 0.24{
            thirstBarShapeNode.fillColor = arancione
            thirstBarShapeNode.strokeColor = arancione
        }else {
            thirstBarShapeNode.fillColor = rosso
            thirstBarShapeNode.strokeColor = rosso
        }
        
        var cleanpath = UIBezierPath(roundedRect: CGRect(x: cleanRectangle.minX, y: cleanRectangle.minY, width: barwidth, height: barheight * (cleanV / CGFloat(mochi.maxCleanlyness))), cornerRadius: 3)
        
        cleanBarShapeNode.path = cleanpath.cgPath
        if cleanV / CGFloat(mochi.maxCleanlyness) > 0.49{
            cleanBarShapeNode.fillColor = verdeAcqua
            cleanBarShapeNode.strokeColor = verdeAcqua
        }
        else if cleanV / CGFloat(mochi.maxCleanlyness) > 0.24 {
            cleanBarShapeNode.fillColor = arancione
            cleanBarShapeNode.strokeColor = arancione
        }else {
            cleanBarShapeNode.fillColor = rosso
            cleanBarShapeNode.strokeColor = rosso
        }
        
        var energypath = UIBezierPath(roundedRect: CGRect(x: energyRectangle.minX, y: energyRectangle.minY, width: barwidth, height: barheight * (energyV / CGFloat(mochi.maxEnergy))), cornerRadius: 3)
        
        energyBarShapeNode.path = energypath.cgPath
        if energyV / CGFloat(mochi.maxEnergy) > 0.49{
            energyBarShapeNode.fillColor = verdeAcqua
            energyBarShapeNode.strokeColor = verdeAcqua
        }
        else if energyV / CGFloat(mochi.maxEnergy) > 0.24 {
            energyBarShapeNode.fillColor = arancione
            energyBarShapeNode.strokeColor = arancione
        }else {
            energyBarShapeNode.fillColor = rosso
            energyBarShapeNode.strokeColor = rosso
        }
        
        var healthpath = UIBezierPath(roundedRect: CGRect(x: healthRectangle.minX, y: healthRectangle.minY, width: barwidth, height: barheight * (healthV / CGFloat(mochi.maxHealth))), cornerRadius: 3)
        
        
        healthBarShapeNode.path = healthpath.cgPath
        
        if healthV / CGFloat(mochi.maxHealth) > 0.49{
            healthBarShapeNode.fillColor = verdeAcqua
            healthBarShapeNode.strokeColor = verdeAcqua
        }
        else if healthV / CGFloat(mochi.maxHealth) > 0.24 {
            healthBarShapeNode.fillColor = arancione
            healthBarShapeNode.strokeColor = arancione
        }else {
            healthBarShapeNode.fillColor = rosso
            healthBarShapeNode.strokeColor = rosso
        }
        
        var happypath = UIBezierPath(roundedRect: CGRect(x: happyRectangle.minX, y: happyRectangle.minY, width: barwidth, height: barheight * (happyV / CGFloat(mochi.maxHealth))), cornerRadius: 3)
        
        happyBarShapeNode.path = happypath.cgPath
        if happyV / CGFloat(mochi.maxHappiness) > 0.49{
            happyBarShapeNode.fillColor = verdeAcqua
            happyBarShapeNode.strokeColor = verdeAcqua
        }
        else if happyV / CGFloat(mochi.maxHappiness) > 0.24 {
            happyBarShapeNode.fillColor = arancione
            happyBarShapeNode.strokeColor = arancione
        }else {
            happyBarShapeNode.fillColor = rosso
            happyBarShapeNode.strokeColor = rosso
        }
        
//        card.addChild(card.hpBar_Fill!)
        
    }
    func setupInventoryScene() {
        
        BlurEffect()
        BackButton()
        InventoryTitle()
//        stats()
        calcoli()
        
        //        self.wasInitialized = true
        
        stats(mochi: Macro_Challenge_HurricaneApp.mochi)
//        Macro_Challenge_HurricaneApp.mochi.hunger = 10
//        Macro_Challenge_HurricaneApp.mochi.cleanlyness = 30
        
        update_straight_bar(mochi: Macro_Challenge_HurricaneApp.mochi)
        
        

//        self.wasInitialized = true


    }
    
//    //
//    //  InventoryScene.swift
//    //  Macro-Challenge-Hurricane
//    //
//    //  Created by Antonio Emanuele Cutarella on 30/05/22.
//    //
//    //
//
//    import Foundation
//    import SpriteKit
//
//    class InventoryScene : SKScene {
//
//
//        let contentNode = SKNode()
//        let contentNodeBackButton = SKNode()
//        let blurNode = SKShapeNode()
//        let effectNode = SKEffectNode()
//        let square1 = SKShapeNode()
//        let square2 = SKShapeNode()
//        let square3 = SKShapeNode()
//
//
//        let hamburger = SKSpriteNode(imageNamed: "Hamburger.png")
//
//        let box = CGSize(width : UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
//        let initialPos = CGPoint(x: UIScreen.main.bounds.width * 0.17, y: UIScreen.main.bounds.height * 0.6)
//        var HorizontalOffset = CGFloat(UIScreen.main.bounds.width * 0.33)
//        var VerticalOffset = CGFloat(UIScreen.main.bounds.height * 0.001)
//        var elemCorrente = 1
//        var row : CGFloat = 0
//        var inventario = Inventory()
//        var settingContainer = SKShapeNode()
//        var nodes = [SKNode()]
//        var label = SKSpriteNode()
//    //    var startstream = false
//    //    var checkSwipe = false
//    //    var lightswitch = false
//    //    var mute = false
//    //    var settingsOn = false
//    //    var omettoOn = false
//    //    var leftedge = false
//    //    var rightedge = false
//    //    var soapApplied : Int = 0
//    //    var activeRoom = 1
//        private var curr : SKNode?
//    //    private var swipeStart : CGPoint?
//    //    private var swipeEnd : CGPoint?
//
//
//        //    var wasInitialized: Bool = false
//
//        override func didMove(to view: SKView) {
//            setupInventoryScene()
//    //        hamburger.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
//    //        hamburger.setScale(0.1)
//    //        hamburger.name = "hamburger"
//    //        addChild(hamburger)
//        }
//
//        override func update(_ currentTime: TimeInterval) {
//
//        }
//
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            if let touch = touches.first {
//                let location = touch.location(in: self)
//                let touchedNodes = self.nodes(at: location)
//                for node in touchedNodes {
//
//                    if node.name == "backbutton" {
//                        self.curr = node
//                    }
//
//                    if node.name == "hamburger" {
//                        self.curr = node
//                    }
//
//                }
//            }
//        }
//
//        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//            if let touch = touches.first, let node = self.curr {
//                let location = touch.location(in: self)
//
//                if node.name == "backbutton" {
//
//                    let tamagotchiMainScene = TamagotchiMainScene(size: (view?.frame.size)!)
//                    //                    tamagotchiMainScene.size = (view?.frame.size)!
//                    let transition = SKTransition.fade(withDuration: 0.5)
//                    self.view?.presentScene(tamagotchiMainScene, transition: transition)
//                }
//
//    //            if node.name == "hamburger" {
//    //
//    //                print(Macro_Challenge_HurricaneApp.mochi.hunger)
//    //
//    //                Macro_Challenge_HurricaneApp.mochi.maxHunger = 100
//    //
//    //                Macro_Challenge_HurricaneApp.inventory.consume(mochi: Macro_Challenge_HurricaneApp.mochi, selected: 0)
//    //
//    //                print(Macro_Challenge_HurricaneApp.mochi.hunger)
//    //            }
//
//            }
//
//            self.curr = nil
//
//        }
//
//
//        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        }
//
//        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        }
//    }
//
//
//    // MARK: - Schermata Principale
//    extension InventoryScene {
//
//        func BlurEffect(){
//
//            let filter = CIFilter(name: "CIGaussianBlur")
//            // Set the blur amount. Adjust this to achieve the desired effect
//            let blurAmount = 70.0
//            filter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
//            let texture = SKTexture(imageNamed: "Background.png")
//            let sprite = SKSpriteNode(texture: texture)
//            effectNode.filter = filter
//            effectNode.position = self.view!.center
//            effectNode.blendMode = .alpha
//            effectNode.addChild(sprite)
//            self.addChild(effectNode)
//
//        }
//
//
//        func BackButton() {
//            let leftCornerSymbol = SKSpriteNode(imageNamed: "BackButton.png")
//    //        leftCornerSymbol.setScale(1.0)
//            leftCornerSymbol.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.08 , y: frame.maxY - UIScreen.main.bounds.height * 0.15)
//
//            leftCornerSymbol.name = "backbutton"
//            addChild(leftCornerSymbol)
//        }
//
//        func InventoryTitle() {
//            let myLabel = SKLabelNode(fontNamed: "Mabook")
//            myLabel.text = "Inventory".localized()
//            myLabel.fontSize = 30
//            //        myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.09)
//            myLabel.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.49, y: frame.maxY - UIScreen.main.bounds.height * 0.165)
//            self.addChild(myLabel)
//        }
//
//        func stats(){
//            let hungerIcon = SKSpriteNode(imageNamed: "Hunger.png")
//            hungerIcon.setScale(0.4)
//            hungerIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.85, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(hungerIcon)
//
//            let thirstIcon = SKSpriteNode(imageNamed: "Glass.png")
//            thirstIcon.setScale(0.4)
//            thirstIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.71, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(thirstIcon)
//
//            let cleanIcon = SKSpriteNode(imageNamed: "Clean.png")
//            cleanIcon.setScale(0.4)
//            cleanIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.57, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(cleanIcon)
//
//            let energyIcon = SKSpriteNode(imageNamed: "Stamina.png")
//            energyIcon.setScale(0.4)
//            energyIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.43, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(energyIcon)
//
//            let healthIcon = SKSpriteNode(imageNamed: "Health.png")
//            healthIcon.setScale(0.4)
//            healthIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.29, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(healthIcon)
//
//            let happyIcon = SKSpriteNode(imageNamed: "Happiness.png")
//            happyIcon.setScale(0.4)
//            happyIcon.position = CGPoint(x:  frame.maxX - UIScreen.main.bounds.width * 0.15, y: frame.maxY - UIScreen.main.bounds.height * 0.105)
//            self.addChild(happyIcon)
//
//            let hungerBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: hungerIcon.position.x - (hungerIcon.size.width)/(2 * 1.30), y: hungerIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(hungerBar)
//
//            let thirstBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: thirstIcon.position.x - (thirstIcon.size.width)/(2 * 1.30), y: thirstIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(thirstBar)
//
//            let cleanBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: cleanIcon.position.x - (cleanIcon.size.width)/(2 * 1.30), y: cleanIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(cleanBar)
//
//            let energyBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: energyIcon.position.x - (energyIcon.size.width)/(2 * 1.30), y: energyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(energyBar)
//
//            let healthBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: healthIcon.position.x - (healthIcon.size.width)/(2 * 1.30), y: healthIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(healthBar)
//
//            let happyBar = SKShapeNode(rect: CGRect(origin: CGPoint(x: happyIcon.position.x - (happyIcon.size.width)/(2 * 1.30), y: happyIcon.position.y + (frame.maxY ) * 0.018), size: CGSize(width: (happyIcon.size.width) * 0.75, height: (frame.maxY)/23)), cornerRadius: 5)
//            self.addChild(happyBar)
//
//
//
//
//        }
//
//    //    quando è 0 deve fare elemCorrente +=1 e row +=1
//
//        func spawnQuadrati(){
//            let quadrato = SKShapeNode(rectOf: box)
//            quadrato.position = CGPoint(x: initialPos.x + (HorizontalOffset * row), y: initialPos.y + (VerticalOffset * row))
//            addChild(quadrato)
//        }
//
//        func calcoli() {
//            for el in inventario.i {
//                if elemCorrente%3 == 1 {
//                    spawnQuadrati()
//                    elemCorrente+=1
//                } else if elemCorrente%3 == 2 {
//                    spawnQuadrati()
//                    elemCorrente+=1
//                } else if elemCorrente%3 == 0 {
//                    spawnQuadrati()
//                    elemCorrente+=1
//                    row += 1
//                }
//            }
//        }
//
//        func setupInventoryScene() {
//
//            BlurEffect()
//            BackButton()
//            InventoryTitle()
//            stats()
//            calcoli()
//
//            //        self.wasInitialized = true
//
//        }
//
//
//    }

    
}


