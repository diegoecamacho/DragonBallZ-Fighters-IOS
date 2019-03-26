//
//  DialogScene.swift
//  SlotBlocks
//
//  Created by Diego  Camacho  on 2019-03-11.
//  Copyright © 2019 TeamAppleTart. All rights reserved.
//

import SpriteKit
import GameplayKit

class DialogScene: SKScene {
    
    var dialogLines : [String] = ["Time To Die Vegeto" , "No You Die!", "No You!!!!", "FIGHT!"]
    var dialogText : SKLabelNode?
    
    var currentLine : Int = 0
    
    
    override func sceneDidLoad() {
        guard let labelRef = childNode(withName: "DialogText") as? SKLabelNode else { return }
        dialogText = labelRef
        
        UpdateUI()
        
    }
    
    func UpdateUI() -> Void {
        dialogText?.text = dialogLines[currentLine]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard (touches.first?.location(in: self)) != nil else { return }
        
        currentLine += 1
        if currentLine > (dialogLines.capacity - 1) {
            let gameScene = GameScene(fileNamed: "GameScene")
            gameScene?.scaleMode = .aspectFill
            view?.presentScene(gameScene)
        }
        else{
             UpdateUI()
        }
        
       
    }
    

}
