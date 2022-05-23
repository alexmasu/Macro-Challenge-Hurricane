//
//  TamagotchiMainScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 23/05/22.
//

import Foundation
import SpriteKit

class TamagotchiMainScene :  SKScene {
    
    let square = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.2)
    let setting = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.width * 0.15))
    
    
    func colorChange(cosino : SKShapeNode) {
        cosino.fillColor = UIColor.blue
        cosino.strokeColor = UIColor.blue
    }
    
    override func didMove(to view: SKView) {
        square.fillColor = UIColor.red
        square.strokeColor = UIColor.red
        square.position = CGPoint(x: frame.midX, y: frame.midY)
        square.name = "ometto"
        addChild(square)
        
        setting.fillColor = UIColor.blue
        setting.strokeColor = UIColor.white
        setting.position = CGPoint(x: frame.maxX - UIScreen.main.bounds.width * 0.15 , y: frame.maxY - UIScreen.main.bounds.width * 0.15)
        addChild(setting)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                if node.name == "ometto" {
                    colorChange(cosino: (node as! SKShapeNode ))
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
