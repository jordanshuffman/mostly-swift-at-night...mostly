//
//  PauseState.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/28/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class PauseState: GKState {
    var gameManager: GameManager
    
    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Enter pause state")
        gameManager.showPauseScene()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is PlayState.Type || stateClass is MainMenuState.Type
    }
}
