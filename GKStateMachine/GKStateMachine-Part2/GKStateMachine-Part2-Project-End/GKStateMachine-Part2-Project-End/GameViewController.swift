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
    override func loadView() {
        super.loadView()
        view = SKView(frame: view.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gameView = view as? SKView {
            let scene = GameScene(size: view.frame.size)
            scene.scaleMode = .fill
            scene.backgroundColor = .black
            gameView.presentScene(scene)
        }
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
