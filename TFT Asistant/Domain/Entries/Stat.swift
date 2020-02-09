//
//  Stat.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Stat: Codable {
    public let type, value: String
    
    public init(type: String,
                value: String){
        self.type = type
        self.value = value
    }
}
