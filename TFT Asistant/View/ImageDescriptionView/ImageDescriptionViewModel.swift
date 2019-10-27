//
//  ImageDescriptionViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct ImageDescriptionViewModel {
    var imageName: String?
    var description: String?
    
    init(imageName: String? = nil, description: String? = nil) {
        self.imageName = imageName
        self.description = description
    }
}
