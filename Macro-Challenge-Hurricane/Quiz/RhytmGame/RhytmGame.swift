//
//  RhytmGame.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 20/05/22.
//

import Foundation
import SpriteKit

class RhytmGame: SKScene {
    
    
    let upsx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let updx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let downsx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let downdx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    
    override func didMove(to view: SKView) {
        
        upsx.name = "upsx"
        upsx.position = CGPoint(x: frame.maxX * 0.25, y: frame.maxY * 0.65)
        upsx.fillColor = UIColor.blue
        upsx.strokeColor = UIColor.white
        upsx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        addChild(upsx)
        
        
        updx.name = "updx"
        updx.position = CGPoint(x: frame.maxX * 0.75, y: frame.maxY * 0.65)
        updx.fillColor = UIColor.blue
        updx.strokeColor = UIColor.white
        updx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        addChild(updx)
        
        downsx.name = "downsx"
        downsx.position = CGPoint(x: frame.maxX * 0.25, y: frame.maxY * 0.25)
        downsx.fillColor = UIColor.blue
        downsx.strokeColor = UIColor.white
        downsx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        addChild(downsx)
        
        downdx.name = "downdx"
        downdx.position = CGPoint(x: frame.maxX * 0.75, y: frame.maxY * 0.25)
        downdx.fillColor = UIColor.blue
        downdx.strokeColor = UIColor.white
        downdx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        addChild(downdx)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
