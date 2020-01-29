//
//  MainMenuScene.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/28/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class MainMenuScene: SKScene {
    var stateMachine: GKStateMachine!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .red
        scaleMode = .aspectFill
        
        let button = ButtonNode(withText: "Play") {
            self.stateMachine.enter(PlayState.self)
        }
        
        button.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(button)
    }
}
