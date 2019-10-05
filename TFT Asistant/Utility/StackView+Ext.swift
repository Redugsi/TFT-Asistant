//
//  StackView+Ext.swift
//  TFT Asistant
//
//  Created by erdem on 5.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView{
    func removeChildren(){
        subviews.forEach{ view in
            view.removeFromSuperview()
        }
    }
}
