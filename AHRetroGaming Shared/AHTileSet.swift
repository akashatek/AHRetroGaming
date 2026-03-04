//
//  AHTileSet.swift
//  AHRetroGaming
//
//  Created by Alvin on 04/03/2026.
//

import SpriteKit

class AHTileSet {
    var image: CGImage? = nil
    var tilewidth: Int = 8
    var tileheight: Int = 8
    var rects = [CGRect]()
    
    subscript(index: Int) -> SKTexture {
        let id = index - 1
        if id < 0 || id > rects.count - 1 {
            return SKTexture()
        }
        guard let img = image else {
            return SKTexture()
        }
        guard let cg = img.cropping(to: rects[id]) else {
            return SKTexture()
        }
        let tex = SKTexture(cgImage: cg)
        tex.filteringMode = .nearest
        return tex
    }
    
    func split(imageNamed: String, tilewidth: Int, tileheight: Int) {
        let tex = SKTexture(imageNamed: imageNamed)
        self.image = tex.cgImage()
        self.tilewidth = tilewidth
        self.tileheight = tileheight
        self.rects = []
        
        let cols = Int(image!.width / tilewidth)
        let rows = Int(image!.height / tileheight)
        for row in 0...rows-1 {
            for col in 0...cols-1 {
                let rect = CGRect(x: col * tilewidth, y: row * tileheight, width: tilewidth, height: tileheight)
                self.rects.append(rect)
            }
        }
    }
}
