//
//  ChampionsModels.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 22.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Domain

enum Champions
{
  // MARK: Use cases
  
  enum GetChampionsOrderedByTier
  {
    struct Request
    {
    }
    struct Response
    {
        var champions: [Champion]?
    }
    struct ViewModel
    {
        var championViewModels: [ChampionViewModel]?
    }
    struct ChampionViewModel{
        var name: String
        var origin: [String]
        var championClass: [String]
        var cost: Int
        var ability: Ability
        var items: [String]
        var stats: Stats
    }
  }
}
