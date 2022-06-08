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
    
    let blur = CIFilter(name:"CIGaussianBlur",parameters: ["inputRadius": 10.0])
    let background = SKSpriteNode(imageNamed: "background.png")
//
//    func omettoMaxStats(){
//
//    }
//
//    func barsPosition() {
//
//    var health = CGFloat(ometto.omettoMaxStats)
//    var stamina = CGFloat(ometto.omettoMaxStats)
//    var cleanliness = CGFloat(ometto.omettoMaxStats)
//    var hunger = CGFloat(ometto.omettoMaxStats)
//    var thirst = CGFloat(ometto.omettoMaxStats)
//    var happiness = CGFloat(ometto.omettoMaxStats)
//
//    let barwidth = omettoHealthBar.size.width * 0.98 * 0.16
//    let barheight = omettoHealthBar.size.height * 0.8 * 0.16(activeRoom as! SimpleEncounter).enemyBar_Fill = SKShapeNode(rectOf: CGSize(width: barwidth, height: barheight), cornerRadius: 3)
//    var barpath = UIBezierPath(roundedRect: CGRect(x : (frame.midX * 0.505) - (barwidth / 2), y :  (frame.midY * 1.794) - (barheight / 2), width: (barwidth * (health / health)), height: barheight), cornerRadius: 3)(activeRoom as! SimpleEncounter).omettoBar_Fill!.path = barpath.cgPath
////    (activeRoom as! SimpleEncounter).omettoBar_Fill!.fillColor = UIColor(Color("HpBar"))
////    (activeRoom as! SimpleEncounter).omettoBar_Fill!.strokeColor = UIColor(Color("HpBar"))
//    addChild((activeRoom as! SimpleEncounter).omettoBar_Fill!)
//    }
//
//
//    override func didMove(to view: SKView) {
//
//    }
//
//    override func update(_ currentTime: TimeInterval) {
//
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let location = touch.location(in: self)
//            let touchedNodes = self.nodes(at: location)
//
//            for node in touchedNodes {
//
//            }
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//

    func blurScreen() {
                let effectsNode = SKEffectNode()
                filter!.setValue(blur, forKey: kCIInputRadiusKey)
                effectsNode.filter = filter
                effectsNode.position = self.view!.center
                effectsNode.blendMode = .alpha
                // Add the effects node to the scene
                self.addChild(background)
                self.addChild(effectsNode)
                
            }
    
    
    
}


