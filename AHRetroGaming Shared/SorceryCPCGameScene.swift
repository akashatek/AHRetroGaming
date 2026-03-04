//
//  SorceryCPCGameScene.swift
//  AHRetroGaming
//
//  Created by Alvin on 04/03/2026.
//

import SpriteKit

class SorceryCPCGameScene: SKScene {
    let tileset = AHTileSet()
    
    class func newGameScene() -> SorceryCPCGameScene {
        // Set the scale mode to scale to fit the window
        let scene = SorceryCPCGameScene(size: CGSize(width: 640, height: 289))
        scene.scaleMode = .aspectFit
        
        return scene
    }
    
    override func didMove(to view: SKView) {
        tileset.split(imageNamed: "sorcery-cpc-spritesheet", tilewidth: 48, tileheight: 48)
        let sprite = SKSpriteNode(texture: tileset[1])
        sprite.position = CGPoint(x: 0, y: 0)
        addChild(sprite)
        
        
    }
}


