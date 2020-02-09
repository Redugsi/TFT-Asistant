//
//  Bonus.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct Bonus: Codable {
    public let needed: Int
    public let effect: String
    
    public init(needed: Int,
                effect: String){
        self.needed = needed
        self.effect = effect
    }
}
