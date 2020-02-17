//
//  PlayerEntity.swift
//  GKStateMachine-Part2-Project-End
//
//  Created by Jordan Huffman on 2/15/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit

class PlayerEntity: GKEntity {
    override init() {
        super.init()
        
        let nodeComponent = NodeComponent()
        addComponent(nodeComponent)
        
        let healthComponent = HealthComponent()
        addComponent(healthComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
