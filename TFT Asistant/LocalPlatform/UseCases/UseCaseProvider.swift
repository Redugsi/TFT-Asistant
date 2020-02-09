//
//  UseCaseProvider.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public final class UseCaseProvider: UseCaseProviderProtocol{
    
    public init() {}
    
    public func makeClassesUseCase() -> ClassesUseCaseProtocol {
        return ClassesUseCase()
    }
    
    public func makeOriginsUseCase() -> OriginsUseCaseProtocol{
        return OriginsUseCase()
    }
    
    public func makeChampionsUseCase() -> ChampionsUseCaseProtocol {
        return ChampionsUseCase()
    }
    
    public func makeItemsUseCase() -> ItemsUseCaseProtocol {
        return ItemsUseCase()
    }
}
