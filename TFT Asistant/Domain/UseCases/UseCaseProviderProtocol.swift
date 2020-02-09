//
//  File.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol UseCaseProviderProtocol{
    func makeClassesUseCase() -> ClassesUseCaseProtocol
    func makeOriginsUseCase() -> OriginsUseCaseProtocol
    func makeChampionsUseCase() -> ChampionsUseCaseProtocol
    func makeItemsUseCase() -> ItemsUseCaseProtocol
}
