//
//  HealthBar.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-24.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import Foundation
import SpriteKit


class HealthBar: SKSpriteNode {
    var healthBar : SKSpriteNode?
    var target: Character?
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadHealth(tracking: Character){
        
        target = tracking
        guard let barRef = childNode(withName: "Fill") as? SKSpriteNode else { print("Did not find Fill"); return }
        healthBar = barRef
    }
    
    func UpdateFill(){
        let health = target!.Health
        if (health)! <= 0 {
            
            let gameScene = MenuScene(fileNamed: "MenuScene")
            gameScene?.scaleMode = .aspectFill
            let scene = self.parent as? SKScene
            scene?.view?.presentScene(gameScene)
            return
        }
       healthBar?.size = CGSize(width: health!, height: 85)
    }
}
