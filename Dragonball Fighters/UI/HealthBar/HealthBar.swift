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
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadHealth(){
        guard let barRef = childNode(withName: "Fill") as? SKSpriteNode else { print("Did not find Fill"); return }
        healthBar = barRef
    }
    
    func UpdateFill(health: CGFloat){
        print("Update")
       healthBar?.scale(to: CGSize(width: (health / 100), height: 1))
    }
}
