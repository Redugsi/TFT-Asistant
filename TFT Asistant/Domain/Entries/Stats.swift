//
//  Stats.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Stats: Codable {
    public let offense: Offense
    public let defense: Defense
    
    public init(offense: Offense,
                defense: Defense){
        self.offense = offense
        self.defense = defense
    }
}
