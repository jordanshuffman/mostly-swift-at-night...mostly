//
//  GameScene.swift
//  GKStateMachine-Part2-Project-Start
//
//  Created by Jordan Huffman on 2/13/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }

        let dt = currentTime - self.lastUpdateTime

        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
