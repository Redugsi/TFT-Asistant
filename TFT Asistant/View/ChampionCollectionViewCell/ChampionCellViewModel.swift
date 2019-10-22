//
//  ChampionCellViewModel.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 22.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct ChampionCellViewModel {
    var championName: String?
    var championPrice: String?
    var borderColorName: String
    
    init(championName: String?, championPrice: String?, borderColorName: String) {
        self.championName = championName
        self.championPrice = championPrice
        self.borderColorName = borderColorName
    }
}
