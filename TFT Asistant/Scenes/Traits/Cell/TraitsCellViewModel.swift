//
//  TraitsCellViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct TraitsCellViewModel {
    var traitImageName: String?
    var traitName: String?
    var traitDescription: String?
    var bonuses: [Traits.BonusViewModel]?
    var champions: [Traits.ChampionViewModel]?
    
    init(traitImageName: String? = nil,
         traitName: String? = nil,
         traitDescription: String? = nil,
         bonuses: [Traits.BonusViewModel]? = nil,
         champions: [Traits.ChampionViewModel]? = nil) {
        self.traitImageName = traitImageName
        self.traitName = traitName
        self.traitDescription = traitDescription
        self.bonuses = bonuses
        self.champions = champions
    }
}
