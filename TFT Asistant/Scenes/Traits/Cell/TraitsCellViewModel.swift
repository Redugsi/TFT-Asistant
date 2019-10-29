//
//  TraitsCellViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import Domain

struct TraitsCellViewModel {
    var traitImageName: String?
    var traitName: String?
    var traitDescription: String?
    var bonuses: [Traits.BonusViewModel]?
    
    init(traitImageName: String? = nil,
         traitName: String? = nil,
         traitDescription: String? = nil,
         bonuses: [Traits.BonusViewModel]? = nil) {
        self.traitImageName = traitImageName
        self.traitName = traitName
        self.traitDescription = traitDescription
        self.bonuses = bonuses
    }
}
