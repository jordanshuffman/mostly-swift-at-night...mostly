//
//  GameViewController.swift
//  GKStateMachine-Part2-Project-Start
//
//  Created by Jordan Huffman on 2/13/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    lazy var gameView: SKView! = {
        let v = SKView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gameView)
        
        gameView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let scene = GameScene(size: gameView.bounds.size)
        scene.scaleMode = .fill
        scene.backgroundColor = .blue
        gameView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
