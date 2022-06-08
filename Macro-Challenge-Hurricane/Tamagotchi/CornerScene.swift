//
//  CornerScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 06/06/22.
//

import Foundation
import SpriteKit


class CornerScene: SKScene {
    
    let studio = TamagotchiMainScene()
    let bathroom = BathroomScene()
    let bedroom = BedroomScene()
    let twitchbutton = SKSpriteNode(imageNamed: "Twix.png")
    let setting = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let inventory = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let shop = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    let customization = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    
    
    override func didMove(to view: SKView) {
       

        spawnCornerButtons()
        settamagotchi()
        addSwipeGestureRecognizers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func
    touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

// MARK: Set corner buttons

extension CornerScene {
    
    func spawnCornerButtons() {
        let customization = SKSpriteNode(imageNamed: "customization.png")
        customization.setScale(0.5)
        customization.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        customization.name = "customization"
        customization.zPosition = 1.0
        addChild(customization)
        
        let setting = SKSpriteNode(imageNamed: "setting.png")
        setting.setScale(0.5)
        setting.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.20)
        setting.name = "setting"
        setting.zPosition = 1.0
        addChild(setting)
        
        let inventory = SKSpriteNode(imageNamed: "inventory.png")
        inventory.setScale(0.5)
        inventory.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        inventory.name = "inventory"
        inventory.zPosition = 10.0
        addChild(inventory)
        
        let shop = SKSpriteNode(imageNamed: "shop.png")
        shop.setScale(0.5)
        shop.position = CGPoint(x: frame.minX + UIScreen.main.bounds.width * 0.15 , y: frame.minY + UIScreen.main.bounds.width * 0.20)
        shop.name = "shop"
        addChild(shop)
        
    }
}

// MARK: Set first scene

extension CornerScene {
    
    func settamagotchi() {
        spawnCornerButtons()
        studio.size = CGSize(width: frame.width, height: frame.height)
        self.view?.presentScene(studio)
//        studio.zPosition = 0.0
    }
    
}


// MARK: Swipe Handler

extension CornerScene {
   
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
                let bathroomChange = SKTransition.push(with: SKTransitionDirection.left, duration: 0.6)
                bathroom.size = frame.size
                self.view?.presentScene(bathroom, transition:  bathroomChange)
                print("LEFT")
            case .down :
                print("DOWN")
            case .right :
                let bedroomChange = SKTransition.push(with: SKTransitionDirection.right, duration: 0.6)
                bedroom.size = frame.size
                self.view?.presentScene(bedroom, transition: bedroomChange)
                print("RIGHT")
            default :
                print("NOPE")
            }
        }
        
    }
}
