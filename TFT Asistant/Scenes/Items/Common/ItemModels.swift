//
//  ItemModels.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 7.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation


enum ItemModels{
    public struct ItemViewModel{
        var name: String?
        var key: String?
        var stats: [ItemStatViewModel]?
        var kind: String?
        var buildsInto: [String]?
        var buildsFrom: [String]?
        var champs: [String]?
        var bonus: String?
    }
    
    public struct ItemsViewModel{
        var itemsViewModel: [ItemViewModel]?
    }
    
    struct BaseItemViewModel {
        var key: String?
        var name: String?
        var bonus: String?
    }
    
    struct BaseItemsViewModel {
        var viewModels: [BaseItemViewModel]?
    }
}
