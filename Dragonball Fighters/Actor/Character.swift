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
    
    var Health : CGFloat?
    var hitValid: Bool = false
    
    var Aimdir : Int = 1
    
    override init(imageName: String) {
        super.init(imageName: imageName)
        Health = CGFloat(size.width)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Health = CGFloat(size.width)
        speed = 1
    }
    
    

    func TakeDamage(damage: Int){
        Health? -= CGFloat(damage)
    }
    
    
    func Move(x: CGFloat, y:CGFloat){
        if x > 0{
            Aimdir = 1
        }
        else if x < 0{
            Aimdir = -1
        }
        
        self.xScale = abs(self.xScale) * CGFloat(-Aimdir)
        
        let moveAction = SKAction.moveBy(x: x * speed, y: y * speed, duration: 0.1)
        
        self.run(moveAction)
    }
    
    func MoveUp() -> Void {
        let moveAction = SKAction.moveBy(x: 0, y: 10 * speed, duration: 0.1)
        self.run(moveAction)
    }
    
    func MoveDown() -> Void {
        let moveAction = SKAction.moveBy(x: 0, y: -10 * speed, duration: 0.1)
        self.run(moveAction)
    }
    
    func MoveLeft() -> Void {
        let moveAction = SKAction.moveBy(x: -10 * speed, y: 0, duration: 0.1)
        self.run(moveAction)
    }
    func MoveRight() -> Void {
        let moveAction = SKAction.moveBy(x: 10 * speed, y: 0, duration: 0.1)
        self.run(moveAction)
        
    }
}
