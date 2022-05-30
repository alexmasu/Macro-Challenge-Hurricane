//
//  ShopScene.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 30/05/22.
//

import Foundation
import SpriteKit

class ShopScene : SKScene {
    
    
    override func didMove(to view: SKView) {
        <#code#>
    }
    
    override func update(_ currentTime: TimeInterval) {
        <#code#>
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    
}
