//
//  GameViewController.swift
//  GKStateMachine-Part1-Project-Start
//
//  Created by Jordan Huffman on 2/5/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let skView = view as? SKView {
             let scene = GameScene(size: skView.bounds.size)
             scene.scaleMode = .aspectFill
             scene.backgroundColor = .black                       
             skView.presentScene(scene)
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
