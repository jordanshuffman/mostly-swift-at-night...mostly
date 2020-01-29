//
//  GameManager.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/28/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class GameManager {
    var view: SKView
    var stateMachine: GKStateMachine!
    
    var playScene: GameScene?
    var pauseScene: PauseScene?
    var mainMenuScene: MainMenuScene?
    
    init(withView view: SKView) {
        self.view = view
        
        self.stateMachine = GKStateMachine(states: [
            PlayState(gameManager: self),
            PauseState(gameManager: self),
            MainMenuState(gameManager: self)
        ])
        
        self.stateMachine.enter(MainMenuState.self)
    }
    
    // MARK: Methods for the different states
    func showPauseScene() {
        if let scene = pauseScene {
            view.presentScene(scene)
        } else {
            pauseScene = PauseScene(size: view.bounds.size)
            pauseScene?.stateMachine = stateMachine
            view.presentScene(pauseScene!)
        }
    }
    
    func showMainMenuScene() {
        if let scene = mainMenuScene {
            view.presentScene(scene)
        } else {
            mainMenuScene = MainMenuScene(size: view.bounds.size)
            mainMenuScene?.stateMachine = stateMachine
            view.presentScene(mainMenuScene)
        }
    }
    
    func showPlayScene() {
        if let scene = playScene {
            view.presentScene(scene)
        } else {
            playScene = GameScene(size: view.bounds.size)
            playScene?.stateMachine = stateMachine
            view.presentScene(playScene!)
        }
    }
}
