//
//  OriginsUseCase.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation
import Domain

public class OriginsUseCase: Domain.OriginsUseCase{
    
    private let repository: Repository<Origin>
    
    init() {
        self.repository = Repository(jsonUrl: Bundle.main.url(forResource: "origins", withExtension: "json"))
    }
    
    public func getOrigins() -> [Origin]? {
        return repository.queryAll()
    }
    
    public func getOrigin(byKey: String) -> Origin? {
        return repository.takeFirst(key: byKey)
    }
    
    public func getOrigin(byName: String) -> Origin? {
        return repository.takeFirst(name: byName)
    }
}
