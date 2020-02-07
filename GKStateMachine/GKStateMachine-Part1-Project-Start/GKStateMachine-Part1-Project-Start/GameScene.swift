//
//  GameScene.swift
//  GKStateMachine-Part1-Project-Completed
//
//  Created by Jordan Huffman on 2/5/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var lastUpdateTime : TimeInterval = 0
    
    lazy var colorNameLabel: SKLabelNode! = {
        let node = SKLabelNode(text: "Black")
        node.fontColor = .white
        return node
    }()
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(colorNameLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        self.lastUpdateTime = currentTime
    }
}
