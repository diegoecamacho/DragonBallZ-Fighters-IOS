//
//  MainMenuScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    var menuController : ButtonController  = ButtonController()
    
    var playButton : MenuButton?
    var controlsMenuButton : MenuButton?
    
    fileprivate func InitializeButton() {
        guard let playTemp = childNode(withName: "PlayButton") as? MenuButton else { return }
        playButton = playTemp
        //playButton?.SetSelectionSprite(fileName: "PlayButtonActive")
        playButton?.AddCallback (callback:{
            let gameScene = DialogScene(fileNamed: "DialogScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        guard let controlMenuButton = childNode(withName: "ControlsButton") as? MenuButton else { return }
        controlsMenuButton = controlMenuButton
        //highScoreButton?.SetSelectionSprite(fileName: "HighButtonActive")
        controlsMenuButton?.AddCallback (callback:{
            let gameScene = ControlsScene(fileNamed: "ControlsScene")
            gameScene?.scaleMode = .aspectFill
            self.view!.presentScene(gameScene)
        })
        
        menuController.AddButton(menuButton: playButton!)
        menuController.AddButton(menuButton: controlsMenuButton!)
    }
    
  
    
    override func sceneDidLoad() {
        InitializeButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        menuController.handle(point: touch)
    }
}
