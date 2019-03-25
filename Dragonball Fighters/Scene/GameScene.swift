//
//  GameScene.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-24.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var gameController : GameController = GameController()
    
    var player : Character?
    
    var Healthbar1 : HealthBar?
    
    
    fileprivate func InitializeButton() {
        
        guard let playerTemp = childNode(withName: "PlayerA") as? Character else { return }
        player = playerTemp
        
        guard let upArrowButton = childNode(withName: "UpArrow") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .UpArrow, node: upArrowButton, callback: MoveUp)
        
        guard let downArrowButton = childNode(withName: "DownArrow") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .DownArrow, node: downArrowButton, callback: MoveDown)
        
        guard let leftArrowButton = childNode(withName: "LeftArrow") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .LeftArrow, node: leftArrowButton, callback: MoveLeft)
        
        guard let rightArrowButton = childNode(withName: "RightArrow") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .RightArrow, node: rightArrowButton, callback: MoveRight)
        
        guard let AButton = childNode(withName: "AButton") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .AButton, node: AButton, callback: Hit)
        
        guard let BButton = childNode(withName: "BButton") as? MenuButton else { return }
        gameController.AddCallback(CallbackEnum: .BButton, node: BButton, callback: Hit)
    }
    
    override func sceneDidLoad() {
        InitializeButton()
        
        guard let health = childNode(withName: "HealthBar") as? HealthBar else { return }
        health.loadHealth()
        
    }
    
    func MoveUp() -> Void {
        player!.MoveUp()
    }
    
    func MoveDown() -> Void {
        player!.MoveDown()
    }
    
    func MoveLeft() -> Void {
        player!.MoveLeft()
    }
    
    func MoveRight() -> Void {
        player!.MoveRight()
    }
    
    func Hit() -> Void {
      player!.Health = player!.Health - 10
        print(player!.Health)
        Healthbar1?.UpdateFill(health: CGFloat(player!.Health))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        WorldBounds()
        Healthbar1!.UpdateFill(health: CGFloat((player!.Health)))
    }
    
    func WorldBounds(){
        BoundsCheck(node: player!)
    }
    
    func BoundsCheck(node: SKSpriteNode){
        let  screenSize = view!.bounds
        let  screenHeight = screenSize.height + 100
        let  screenWidth = screenSize.width + 200
        
        if node.position.x < -screenWidth{
            node.position.x = -screenWidth
        }
        else if node.position.x > screenWidth{
            node.position.x = screenWidth
        }
        
        if node.position.y < -screenHeight{
            node.position.y = -screenHeight
        }
        else if node.position.y > screenHeight{
            node.position.y = screenHeight
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        gameController.handle(point: touch)
    }
    
}
