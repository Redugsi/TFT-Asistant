//
//  TitleDescriptionViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct TitleDescriptionViewModel {
    var type: String?
    var desc: String?
    
    init(type: String? = nil, desc: String? = nil) {
        self.type = type
        self.desc = desc
    }
}
