//
//  Character.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-24.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import Foundation
import SpriteKit

class Character: Actor {
    
    var Health : Int = 100
    
    
    func MoveUp() -> Void {
        
        let moveAction = SKAction.moveBy(x: 0, y: 10 * speed, duration: 0.1)
        self.run(moveAction)
    }
    
    func MoveDown() -> Void {
        let moveAction = SKAction.moveBy(x: 0, y: -10 * speed, duration: 0.1)
        self.run(moveAction)
    }
    
    func MoveLeft() -> Void {
                print("A")
        let moveAction = SKAction.moveBy(x: -10 * speed, y: 0, duration: 0.1)
        self.run(moveAction)
    }
    func MoveRight() -> Void {
                print("A")
        let moveAction = SKAction.moveBy(x: 10 * speed, y: 0, duration: 0.1)
        self.run(moveAction)
        
    }
}
