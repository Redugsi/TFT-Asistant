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
}
