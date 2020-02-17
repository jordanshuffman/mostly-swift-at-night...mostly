//
//  NodeComponent.swift
//  GKStateMachine-Part2-Project-End
//
//  Created by Jordan Huffman on 2/15/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import GameplayKit
import SpriteKit

class NodeComponent: GKComponent {
    var healthComponent: HealthComponent {
        guard let component = entity?.component(ofType: HealthComponent.self) else {
            fatalError("Must have health component")
        }
        
        return component
    }
    
    var playingDefaultAnimation = false
    var playingRageAnimation = false
    var node: SKSpriteNode?
    
    override init() {
        super.init()
        node = SKSpriteNode(imageNamed: "cat-default")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playDefaultAnimation() {
        guard !playingDefaultAnimation else {
            return
        }
        
        print("Playing default animation")
        
        node?.removeAllActions()
        
        playingDefaultAnimation = true
        playingRageAnimation = false
        let textureAtlas = SKTextureAtlas(named: "shoot-no-fire")
        let textures = textureAtlas.textureNames.map({ textureAtlas.textureNamed($0) })
        let defaultAnimation = SKAction.animate(with: textures, timePerFrame: 0.2)
        
        node?.run(SKAction.repeatForever(defaultAnimation))
    }
    
    func playRageAnimation() {
        guard !playingRageAnimation else {
            return
        }
        
        print("Playing rage animation")
        
        node?.removeAllActions()
        
        playingDefaultAnimation = false
        playingRageAnimation = true
        let textureAtlas = SKTextureAtlas(named: "shoot-fire")
        let textures = textureAtlas.textureNames.map({ textureAtlas.textureNamed($0) })
        let rageAnimation = SKAction.animate(with: textures, timePerFrame: 0.2)
        
        node?.run(SKAction.repeatForever(rageAnimation))
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if healthComponent.isEnraged {
            playRageAnimation()
        } else {
            playDefaultAnimation()
        }
    }
}
