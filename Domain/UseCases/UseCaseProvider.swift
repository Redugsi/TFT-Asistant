//
//  File.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol UseCaseProvider{
    
    func makeClassesUseCase() -> ClassesUseCase
    func makeOriginsUseCase() -> OriginsUseCase
    func makeChampionsUseCase() -> ChampionsUseCase
    func makeItemsUseCase() -> ItemsUseCase
}
