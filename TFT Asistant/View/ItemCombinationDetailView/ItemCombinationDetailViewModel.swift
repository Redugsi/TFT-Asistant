//
//  ItemCombinationDetailViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 5.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct ItemCombinationDetailViewModel{
    var name: String?
    var combinedImageName: String?
    var firstImageName: String?
    var secondImageName: String?
    var bonus: String?
    var statViewModels: [ItemStatViewModel?]?
    var showSeparator: Bool
    
    init(name: String?,
         combinedImageName: String?,
         firstImageName: String?,
         secondImageName: String?,
         bonus: String?,
         statViewModels: [ItemStatViewModel?]?,
         showSeparator: Bool = true) {
        
        self.name = name
        self.combinedImageName = combinedImageName
        self.firstImageName = firstImageName
        self.secondImageName = secondImageName
        self.bonus = bonus
        self.statViewModels = statViewModels
        self.showSeparator = showSeparator
    }
}
