//
//  PlayerClass.swift
//  manchkinApp
//
//  Created by Никита Хорошко on 29.08.22.
//

import UIKit

class Player {
    public var name: String
    public var level: Int = 0
    public var itemsBoost: Int = 0
    public var modificationPoins: Int = 0
    public let playerPicture: UIImage = UIImage(named: "viking" + String(Int.random(in: 1...5)))!
    
    init (name: String) {
        self.name = name
    }
    
    init (name: String, level: Int, itemsBoost: Int) {
        self.name = name
        self.level = level
        self.itemsBoost = itemsBoost
    }
    
    @objc public func plusPointToLevel() {
        self.level += 1
    }
    
    @objc public func minusPointToLevel() {
        self.level -= 1
    }
    
    @objc public func plusPointToItems() {
        self.itemsBoost += 1
    }
    
    @objc public func minusPointToItems() {
        self.itemsBoost -= 1
    }
}

