//
//  Defense.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Defense: Codable {
    public let health, armor, magicResist: Int
    
    public init(health: Int, armor: Int, magicResist: Int){
        self.health = health
        self.armor = armor
        self.magicResist = magicResist
    }
}
