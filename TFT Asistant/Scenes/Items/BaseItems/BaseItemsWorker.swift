//
//  BaseItemsWorker.swift
//  TFT Asistant
//
//  Created by erdem on 6.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Domain

class BaseItemsWorker
{
    let itemsUseCase: ItemsUseCase
    
    init(itemsUseCase: ItemsUseCase) {
        self.itemsUseCase = itemsUseCase
    }
    
    func getBaseItems() -> BaseItems.GetBaseItems.Response{
        var response = BaseItems.GetBaseItems.Response(items: nil)
        
        guard let baseItems = itemsUseCase.getItems() else{
            return response
        }
        
        response.items = baseItems.filter({
            $0.buildsFrom == nil
        })
        
        return response
    }
}