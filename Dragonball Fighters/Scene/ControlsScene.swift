//
//  DialogScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class ControlsScene: SKScene {
    var menuController : ButtonController  = ButtonController()
    
    var backButton : MenuButton?
    
    fileprivate func InitializeButton() {
        guard let backButtontemp = childNode(withName: "BackButton") as? MenuButton else { return }
        backButton = backButtontemp
        //backButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        backButton?.AddCallback (callback:{
            let gameScene = MenuScene(fileNamed: "MenuScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        menuController.AddButton(menuButton: backButton!)
    }
    
    override func sceneDidLoad() {
        InitializeButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
}
