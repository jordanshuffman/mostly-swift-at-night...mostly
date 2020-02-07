//
//  States.swift
//  GKStateMachine-Part1-Project-Start
//
//  Created by Jordan Huffman on 2/5/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit

class BlackState: GKState {
    var labelNode: SKLabelNode          // 1
    var elapsedTime: TimeInterval = 0   // 2
    
    init(label: SKLabelNode) {  // 3
        labelNode = label
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        elapsedTime += seconds  // 4
        
        if elapsedTime >= 5 {
            stateMachine?.enter(RedState.self)  // 5
        }
    }
    
    override func didEnter(from previousState: GKState?) {
        elapsedTime = 0  // 6
        labelNode.text = "Black" // 7
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is RedState.Type  // 8
    }
}

class RedState: GKState {
    var labelNode: SKLabelNode
    var elapsedTime: TimeInterval = 0
    
    init(label: SKLabelNode) {
        labelNode = label
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        elapsedTime += seconds
        
        if elapsedTime >= 5 {
            stateMachine?.enter(BlueState.self)
        }
    }
    
    override func didEnter(from previousState: GKState?) {
        elapsedTime = 0
        labelNode.text = "Red"
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is BlueState.Type
    }
}

class BlueState: GKState {
    var labelNode: SKLabelNode
    var elapsedTime: TimeInterval = 0
    
    init(label: SKLabelNode) {
        labelNode = label
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        elapsedTime += seconds
        
        if elapsedTime >= 5 {
            stateMachine?.enter(BlackState.self)
        }
    }
    
    override func didEnter(from previousState: GKState?) {
        elapsedTime = 0
        labelNode.text = "Blue"
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is BlackState.Type
    }
}

