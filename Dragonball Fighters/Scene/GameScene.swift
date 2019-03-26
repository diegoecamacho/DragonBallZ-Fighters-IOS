//
//  GameScene.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-24.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var gameController : GameController = GameController()
    
    var playerA : Fighter?
    var playerB : Character?
    
    var Healthbar1 : HealthBar?
    var Healthbar2 : HealthBar?
    
    var JoystickSprite  = SKLabelNode()
    var JoystickBackground  = SKLabelNode()
    
    let joystick = TLAnalogJoystick(withDiameter: 300)
    
 
    
    fileprivate func Initialize() {
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        guard let playerTempA = childNode(withName: "PlayerA") as? Fighter else { return }
        playerA = playerTempA
        
        playerA?.Initialize()
        
        let anologbackground = UIImage(named: "jSubstrate")
        joystick.baseImage = anologbackground
        let analogForeground = UIImage(named: "jStick")
        joystick.handleImage = analogForeground
        joystick.position = CGPoint(x: -675, y: -250)
        
        addChild(joystick)
        
        joystick.on(.move) { [unowned self] joystick in
            let pVelocity = joystick.velocity;
            print(pVelocity.x)
            self.playerA?.Move(x: pVelocity.x, y: pVelocity.y)
            
        }
        
        playerA?.EnablePhysicsBody(category: PhysicsCategories.Player)
        
        guard let playerTempB = childNode(withName: "PlayerB") as? Character else { return }
        playerB = playerTempB
        
        playerB?.EnablePhysicsBody(category: PhysicsCategories.Enemy)
        
        guard let health1 = childNode(withName: "HealthBar1") as? HealthBar else { return }
        health1.loadHealth(tracking: playerA!)
        Healthbar1 = health1
        
        guard let health2 = childNode(withName: "HealthBar2") as? HealthBar else { return }
        health2.loadHealth(tracking: playerB!)
        Healthbar2 = health2
        
        guard let AButton = childNode(withName: "Hitbutton") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .AButton, node: AButton, callback: Hit)
        

    }
 
    override func didMove(to view: SKView) {
         physicsWorld.contactDelegate = self
        
        
        
        Initialize()
        
        
    }
    
    func Hit() -> Void {
        if (playerA?.hitValid)! {
            playerB!.Health? -=  10
            
            UpdateHealth()
        }
        
    }
    
    func UpdateHealth(){
        Healthbar1?.UpdateFill()
        Healthbar2?.UpdateFill()
    }
    
    override func update(_ currentTime: TimeInterval) {
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        
        if gameController.handle(point: touch)  {
            return
        }
        
        playerA?.SpawnBullet(scene: self)
    }
    
    fileprivate func BulletCollisionHandle(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == PhysicsCategories.Bullets || contact.bodyB.categoryBitMask == PhysicsCategories.Bullets {
            var character: Character?
            if let body = contact.bodyA.node! as? Character {
                character = body
                contact.bodyB.node?.removeFromParent()
            }
            else {
                if let body = contact.bodyB.node! as? Character{
                    character = body
                    contact.bodyA.node?.removeFromParent()
                }
                else{
                    return
                }
            }
            character?.TakeDamage(damage: 5)
            UpdateHealth()
            
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        BulletCollisionHandle(contact)
        
        
        
        if contact.bodyA.categoryBitMask == PhysicsCategories.Player || contact.bodyB.categoryBitMask == PhysicsCategories.Player{
            if contact.bodyA.categoryBitMask == PhysicsCategories.Enemy {
                playerA?.hitValid = true
            }
            else {
                if contact.bodyB.categoryBitMask == PhysicsCategories.Enemy {
                    playerA?.hitValid = true
                }
                else{
                    return
                }
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == PhysicsCategories.Player || contact.bodyB.categoryBitMask == PhysicsCategories.Player{
            if contact.bodyA.categoryBitMask == PhysicsCategories.Enemy {
                playerA?.hitValid = false
            }
            else {
                if contact.bodyB.categoryBitMask == PhysicsCategories.Enemy {
                    playerA?.hitValid = false
                }
                else{
                    return
                }
            }
        }
    
    }
}
