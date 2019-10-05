//
//  Optional+Ext.swift
//  TFT Asistant
//
//  Created by erdem on 5.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String{
    var stringValue: String{
        return self ?? ""
    }
}
