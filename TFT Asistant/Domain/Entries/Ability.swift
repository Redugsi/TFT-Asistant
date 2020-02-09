//
//  Ability.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Ability: Codable {
    public let name, abilityDescription: String
    public let type: String
    public let manaCost, manaStart: Int?
    public let stats: [Stat]
    
    enum CodingKeys: String, CodingKey {
        case name
        case abilityDescription = "description"
        case type, manaCost, manaStart, stats
    }
    
    public init(name: String, abilityDescription: String,
                type: String,
                manaCost: Int?,
                manaStart: Int?,
                stats: [Stat]){
        self.name = name
        self.abilityDescription = abilityDescription
        self.type = type
        self.manaCost = manaCost
        self.manaStart = manaStart
        self.stats = stats
    }
}
