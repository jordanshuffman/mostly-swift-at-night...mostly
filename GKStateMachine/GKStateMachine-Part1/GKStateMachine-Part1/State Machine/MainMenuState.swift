//
//  MainMenuState.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/28/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class MainMenuState: GKState {
    var gameManager: GameManager
    
    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }
    
    override func didEnter(from previousState: GKState?) {
        print("Enter main menu state")
        gameManager.showMainMenuScene()
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is PlayState.Type
    }
}
