//
//  GameScene.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/27/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class GameScene: SKScene {
    var stateMachine: GKStateMachine!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .blue
        scaleMode = .aspectFill
        
        let button = ButtonNode(withText: "Pause") {
            self.stateMachine.enter(PauseState.self)
        }
        
        button.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(button)
    }
}
