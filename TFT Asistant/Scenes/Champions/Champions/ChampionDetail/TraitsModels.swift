//
//  TraitsModels.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Traits
{
    //MARK: View Models
        
    struct TraitViewModel
    {
        var key: String?
        var name: String?
        var description: String?
        var accentChampionImage: String?
        var bonuses: [BonusViewModel]?
        var champions: [ChampionViewModel]?
    }
    
    struct BonusViewModel
    {
        var needed: Int?
        var effect: String?
    }
    
    struct ChampionViewModel
    {
        var name: String?
        var cost: Int?
    }
    
    // MARK: Use cases
    enum GetAllTraits
    {
        struct Request
        {
            
        }
        
        struct Response
        {
            var traitViewModels: [TraitViewModel]?
        }
    }
}
