//
//  Item.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation


public struct Item: Searchable {
    public var key: String
    public var name: String
    public let type: String
    public let bonus: String
    public let tier, depth: Int
    public let stats: [ItemStat]?
    public let kind: String
    public let buildsInto: [String]?
    public let champs: [String]
    public let buildsFrom: [String]?
    
    public init(key: String,
                name: String,
                type: String,
                bonus: String,
                tier: Int,
                depth: Int,
                stats: [ItemStat]?,
                kind: String,
                buildsInto: [String]?,
                champs: [String],
                buildsFrom: [String]?){
        self.key = key
        self.name = name
        self.type = type
        self.bonus = bonus
        self.tier = tier
        self.depth = depth
        self.stats = stats
        self.kind = kind
        self.buildsInto = buildsInto
        self.champs = champs
        self.buildsFrom = buildsFrom
    }
}
