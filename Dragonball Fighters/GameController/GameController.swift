//
//  GameController.swift
//  Dragonball Fighters
//
//  Created by Diego Camacho on 2019-03-24.
//  Copyright © 2019 Diego Camacho. All rights reserved.
//

import Foundation
import SpriteKit


class GameController{
    
    enum Key {
        case UpArrow
        case DownArrow
        case LeftArrow
        case RightArrow
        case AButton
        case BButton
    }
    
    struct Button{
        var Key : Key?
        var CallBack: (() -> Void)?
        var spriteNode : SKSpriteNode?
        
        init(keyEnum : Key, Node: SKSpriteNode, callback: @escaping () -> Void) {
            Key = keyEnum
            spriteNode  = Node
            CallBack = callback
        }
    }
    
    var ButtonsList : [Button] = []
  
    public func AddCallback(CallbackEnum: Key , node :SKSpriteNode ,callback: @escaping () -> Void){
        let handled = false
        
        let size = ButtonsList.capacity
        
        print(size)
        
      //FIXME: Handle What happens when key added again.
      //if ButtonsList.capacity != 0 {
      //    for i in 0..<size {
      //        if ButtonsList[i].Key == CallbackEnum{
      //            ButtonsList[i].CallBack = callback
      //            ButtonsList[i].spriteNode = node
      //            handled = true
      //        }
      //    }
      //}
      //
        
      if !handled {
        let tempButton = Button(keyEnum: CallbackEnum, Node: node, callback: callback)
          ButtonsList.append(tempButton)
      }
    }
    
    public func handle(point : CGPoint) -> Bool{
        for button in ButtonsList{
            if button.spriteNode!.contains(point){
                button.CallBack?()
                return true
            }
        }
        return false
    }
}
