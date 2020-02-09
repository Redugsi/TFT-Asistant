//
//  Offense.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Offense: Codable {
    public let damage: Int
    public let attackSpeed: Double
    public let dps, range: Int
    
    public init(damage: Int,
                attackSpeed: Double,
                dps: Int,
                range: Int){
        self.damage = damage
        self.attackSpeed = attackSpeed
        self.dps = dps
        self.range = range
    }
}
