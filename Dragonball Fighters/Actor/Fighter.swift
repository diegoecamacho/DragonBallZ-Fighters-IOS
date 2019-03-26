//
//  Fighter.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-25.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import Foundation
import SpriteKit

class Fighter: Character {
    
    var spawnLocation: SKNode?
    
    override init(imageName: String) {
        super.init(imageName: imageName)
        Initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Initialize()
        
    }
    
    func Initialize(){
       
        print(spawnLocation?.position)
    }
    
    func SpawnBullet(scene : SKScene) -> Void {
        let bullet = Actor(imageName: "kiblast2")
        bullet.size = CGSize(width: 50, height: 50)
        
       
        var offsetX = self.position.x + CGFloat(Aimdir  * 150)
        let PlayerPosition = CGPoint(x: offsetX, y: self.position.y)
        bullet.position = PlayerPosition
        
        
        bullet.EnablePhysicsBody(category: PhysicsCategories.Bullets)
        
        let move = SKAction.moveBy(x: CGFloat(Aimdir * 1000), y: 0, duration: 1)
        bullet.run(move)
        
        scene.addChild(bullet)
    }
    
    
}
