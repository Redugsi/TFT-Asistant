//
//  ChampionsUseCase.swift
//  LocalPlatform
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public class ChampionsUseCase: ChampionsUseCaseProtocol{
    
    private let repository: Repository<Champion>
    
    init() {
        self.repository = Repository(jsonUrl: Bundle.main.url(forResource: "champions", withExtension: "json"))
    }
    
    public func getChampions() -> [Champion]? {
        return repository.queryAll()
    }
    
    public func getChampion(byKey: String) -> Champion? {
        return repository.takeFirst(key: byKey)
    }
    
    public func getChampion(byName: String) -> Champion? {
        return repository.takeFirst(name: byName)
    }
}
