//
//  HealthStates.swift
//  GKStateMachine-Part2-Project-End
//
//  Created by Jordan Huffman on 2/15/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit

class HealthNormalState: GKState {
    var healthComponent: HealthComponent
    var lastUpdateTime: Double = 0
    
    init(withHealthComponent component: HealthComponent) {
        healthComponent = component
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        lastUpdateTime = 0
        healthComponent.isEnraged = false
        healthComponent.currentHealth = healthComponent.maxHealth
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is HealthRageState.Type
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        lastUpdateTime += seconds
        
        if lastUpdateTime > 1 { // 1
            lastUpdateTime = 0 // 2
            healthComponent.currentHealth -= 10 // 3
        }
        
        if healthComponent.currentHealth <= 50 { // 4
            stateMachine?.enter(HealthRageState.self) // 5
        }
    }
}

class HealthRageState: GKState {
    var healthComponent: HealthComponent
    var lastUpdateTime: Double = 0
    
    init(withHealthComponent component: HealthComponent) {
        healthComponent = component
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        lastUpdateTime = 0
        healthComponent.isEnraged = true
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is HealthNormalState.Type
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        lastUpdateTime += seconds
        
        if lastUpdateTime > 1 { // 1
            lastUpdateTime = 0 // 2
            healthComponent.currentHealth -= 10 // 3
        }
        
        if healthComponent.currentHealth <= 0 { // 4
            stateMachine?.enter(HealthNormalState.self) // 5
        }
    }
}
