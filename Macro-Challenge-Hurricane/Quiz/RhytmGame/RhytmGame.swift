//
//  RhytmGame.swift
//  Macro-Challenge-Hurricane
//
//  Created by Giovanni Teresi on 20/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

class RhytmGame: SKScene {
    
    
    let upsx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let updx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let downsx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    let downdx = SKShapeNode(circleOfRadius: UIScreen.main.bounds.width * 0.1)
    
    private var note = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        setUpButtons()
//        setUpNotes()
                
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNodes = self.nodes(at: location)
            
            for node in touchedNodes {
                if node.name == "upsx" {
                    
                    setUpNotes(button : node as! SKShapeNode)
                    self.movenote(nota: note)
                    
                    
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


// MARK: Game Scene Set Up

extension RhytmGame {
    private func setUpScene() {
        
        
        
    }
    
    private func setUpButtons() {
        
        upsx.name = "upsx"
        upsx.position = CGPoint(x: frame.maxX * 0.25, y: frame.maxY * 0.65)
        upsx.fillColor = UIColor.blue
        upsx.strokeColor = UIColor.white
        upsx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        upsx.physicsBody?.categoryBitMask = PhysicsCategory.upsx
        upsx.physicsBody?.contactTestBitMask = PhysicsCategory.usnote
        upsx.physicsBody?.collisionBitMask = PhysicsCategory.usnote
        addChild(upsx)
        
        
        updx.name = "updx"
        updx.position = CGPoint(x: frame.maxX * 0.75, y: frame.maxY * 0.65)
        updx.fillColor = UIColor.blue
        updx.strokeColor = UIColor.white
        updx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        updx.physicsBody?.categoryBitMask = PhysicsCategory.updx
        addChild(updx)
        
        downsx.name = "downsx"
        downsx.position = CGPoint(x: frame.maxX * 0.25, y: frame.maxY * 0.25)
        downsx.fillColor = UIColor.blue
        downsx.strokeColor = UIColor.white
        downsx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        downsx.physicsBody?.categoryBitMask = PhysicsCategory.downsx
        addChild(downsx)
        
        downdx.name = "downdx"
        downdx.position = CGPoint(x: frame.maxX * 0.75, y: frame.maxY * 0.25)
        downdx.fillColor = UIColor.blue
        downdx.strokeColor = UIColor.white
        downdx.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        downdx.physicsBody?.categoryBitMask = PhysicsCategory.downdx
        addChild(downdx)
        
        
    }
    
    private func setUpNotes(button : SKShapeNode) {
        
        note.name = "note"
        let arcnote = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: UIScreen.main.bounds.width * 2, startAngle: CGFloat(0).degreesToRadians(), endAngle: CGFloat(360).degreesToRadians(), clockwise: true)
        note.strokeColor = UIColor.orange
        note.lineWidth = CGFloat(UIScreen.main.bounds.width * 0.01)
        note.path = arcnote.cgPath
        note.physicsBody?.categoryBitMask = PhysicsCategory.usnote
        note.physicsBody?.contactTestBitMask = PhysicsCategory.upsx
        note.physicsBody?.collisionBitMask = PhysicsCategory.upsx
        
        button.addChild(note)
        
    }
}


// MARK: Game Scene Animations

extension RhytmGame {
    
    private func movenote(nota : SKShapeNode){
        
        let restringi = SKAction.scale(to: 0, duration: 2.0)
        let elimina = SKAction.run { [self] in
            nota.removeFromParent()
        }
        
        let mossa = SKAction.sequence([restringi, elimina])
        
        nota.run(mossa)
        
        
    }
    
}

// MARK: Collision and Conacts

extension RhytmGame : SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let firstBody : SKPhysicsBody = contact.bodyA
        let secondBody : SKPhysicsBody = contact.bodyB
        
        if let node = firstBody.node, node.name == "upsx" {
            print("Toccato")
        }
        if let node = secondBody.node, node.name == "upsx" {
            print("Toccato")
        }
    }
    
}
