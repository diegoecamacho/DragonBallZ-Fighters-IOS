//
//  Actor.swift
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import Foundation
import SpriteKit

class Actor: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(imageName: String) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    func EnablePhysicsBody(category : UInt32){
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width, height: size.height))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        
        if category == PhysicsCategories.Player {
            self.physicsBody?.categoryBitMask = PhysicsCategories.Player
            self.physicsBody?.contactTestBitMask = PhysicsCategories.Bullets | PhysicsCategories.Enemy
            self.physicsBody?.collisionBitMask = PhysicsCategories.Enemy
        }
        
        if category == PhysicsCategories.Enemy {
            self.physicsBody?.categoryBitMask = PhysicsCategories.Enemy
            self.physicsBody?.contactTestBitMask = PhysicsCategories.Bullets | PhysicsCategories.Player
            self.physicsBody?.collisionBitMask = PhysicsCategories.Player
        }
        
        if category == PhysicsCategories.Bullets {
            self.physicsBody?.categoryBitMask = PhysicsCategories.Bullets
            self.physicsBody?.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Enemy
           
        }
        
        
    }
    
    
    func update() -> Void {
        return
    }
}
