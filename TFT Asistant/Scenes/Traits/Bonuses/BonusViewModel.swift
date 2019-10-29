//
//  BonusViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct BonusViewModel {
    var count: Int?
    var description: String?
    
    init(count: Int? = 0, description: String? = nil) {
        self.count = count
        self.description = description
    }
}
