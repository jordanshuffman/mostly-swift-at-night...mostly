//
//  ButtonNode.swift
//  GKStateMachine-Part1
//
//  Created by Jordan Huffman on 1/28/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import SpriteKit

typealias Action = () -> Void

class ButtonNode: SKNode {
    var button: SKShapeNode
    var title: SKLabelNode
    var action: Action
    
    init(withText text: String, andAction action: @escaping Action) {
        self.title = SKLabelNode(text: text)
        self.button = SKShapeNode(rectOf: CGSize(width: 150, height: 50), cornerRadius: 6)
        self.action = action
        super.init()
        
        self.title.verticalAlignmentMode = .center
        self.title.horizontalAlignmentMode = .center
        addChild(button)
        addChild(title)
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard containsTouches(touches: touches) else {
            return
        }
        
        action()
    }
    
    private func containsTouches(touches: Set<UITouch>) -> Bool {
        guard let scene = scene else { fatalError("Button must be used within a scene.") }
        
        return touches.contains { touch in
            let touchPoint = touch.location(in: scene)
            let touchedNode = scene.atPoint(touchPoint)
            return touchedNode === self || touchedNode.inParentHierarchy(self)
        }
    }
}
