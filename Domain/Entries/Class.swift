//
//  Class.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Class: Searchable {
    public var key: String
    public var name: String
    public let classDescription: String?
    public let accentChampionImage: String
    public let bonuses: [Bonus]
    
    public init(key: String,
                name: String,
                classDescription: String?,
                accentChampionImage: String,
                bonuses: [Bonus]){
        self.key = key
        self.name = name
        self.classDescription = classDescription
        self.accentChampionImage = accentChampionImage
        self.bonuses = bonuses
    }
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case classDescription = "description"
        case accentChampionImage, bonuses
    }
}
