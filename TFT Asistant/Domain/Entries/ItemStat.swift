//
//  ItemStat.swift
//  TFT Asistant
//
//  Created by erdem on 22.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public struct ItemStat: Codable {
    public var name: String?
    public var title: String
    public var amount: String?
    
    public init(name: String?, title: String, amount: String?) {
        self.name = name
        self.title = title
        self.amount = amount
    }
}
