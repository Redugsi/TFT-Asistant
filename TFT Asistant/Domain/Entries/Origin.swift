//
//  Origin.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Origin: Searchable {
    public var key: String
    public var name: String
    public let originDescription: String?
    public let accentChampionImage: String?
    public let bonuses: [Bonus]
    
    public init(key:String,
                name: String,
                originDescription: String?,
                accentChampionImage: String?,
                bonuses: [Bonus]){
        self.key = key
        self.name = name
        self.originDescription = originDescription
        self.accentChampionImage = accentChampionImage
        self.bonuses = bonuses
    }
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case originDescription = "description"
        case accentChampionImage, bonuses
    }
}
