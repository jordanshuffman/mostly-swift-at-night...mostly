//
//  GameScene.swift
//  GKStateMachine-Part1-Project-Start
//
//  Created by Jordan Huffman on 2/5/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var lastUpdateTime : TimeInterval = 0
    private var stateMachine: GKStateMachine!   // 1
    
    lazy var colorNameLabel: SKLabelNode! = {
        let node = SKLabelNode(text: "")
        node.fontColor = .white
        return node
    }()
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(colorNameLabel)

        let blackState = BlackState(label: colorNameLabel)
        let redState = RedState(label: colorNameLabel)
        let blueState = BlueState(label: colorNameLabel)
        
        stateMachine = GKStateMachine(states: [blackState, redState, blueState])   // 2
        stateMachine.enter(BlackState.self) // 3
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        let delta = currentTime - self.lastUpdateTime
        stateMachine.update(deltaTime: delta)   // 4
        
        self.lastUpdateTime = currentTime
    }
}
