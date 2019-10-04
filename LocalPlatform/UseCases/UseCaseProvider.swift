//
//  UseCaseProvider.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider{
    
    public init() {}
    
    public func makeClassesUseCase() -> Domain.ClassesUseCase {
        return ClassesUseCase()
    }
    
    public func makeOriginsUseCase() -> Domain.OriginsUseCase {
        return OriginsUseCase()
    }
    
    public func makeChampionsUseCase() -> Domain.ChampionsUseCase {
        return ChampionsUseCase()
    }
    
    public func makeItemsUseCase() -> Domain.ItemsUseCase {
        return ItemsUseCase()
    }
}
