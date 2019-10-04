//
//  ChampionUseCase.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol ChampionsUseCase{
    func getChampions() -> [Champion]?
    func getChampion(byKey: String) -> Champion?
    func getChampion(byName: String) -> Champion?
}
