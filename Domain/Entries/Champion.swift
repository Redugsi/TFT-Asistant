//
//  Champion.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Champion: Searchable {
    public let id: String
    public var key: String
    public var name: String
    public let origin, championClass: [String]
    public let cost: Int
    public let ability: Ability
    public let stats: Stats
    public let items: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
        case origin
        case championClass = "class"
        case cost, ability, stats, items
    }
    
    public init(id: String,
                key: String,
                name: String,
                origin: [String],
                championClass: [String],
                cost: Int,
                ability: Ability,
                stats: Stats,
                items: [String]){
        self.id = id
        self.key = key
        self.name = name
        self.origin = origin
        self.championClass = championClass
        self.cost = cost
        self.ability = ability
        self.stats = stats
        self.items = items
    }
}
