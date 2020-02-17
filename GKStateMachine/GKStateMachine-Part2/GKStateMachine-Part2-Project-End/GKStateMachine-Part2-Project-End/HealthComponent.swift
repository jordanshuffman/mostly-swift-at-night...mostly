//
//  HealthComponent.swift
//  GKStateMachine-Part2-Project-End
//
//  Created by Jordan Huffman on 2/15/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit

class HealthComponent: GKComponent {
    let maxHealth = 100
    var currentHealth = 100
    var isEnraged: Bool = false
    
    var stateMachine: GKStateMachine!
    
    override init() {
        super.init()
        
        stateMachine = GKStateMachine(states: [
            HealthNormalState(withHealthComponent: self),
            HealthRageState(withHealthComponent: self)
        ])
        
        stateMachine.enter(HealthNormalState.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        stateMachine.update(deltaTime: seconds)
    }
}
