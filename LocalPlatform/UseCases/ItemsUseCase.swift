//
//  ItemsUseCase.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation
import Domain

public class ItemsUseCase: Domain.ItemsUseCase{
    
    private let repository: Repository<Item>
    
    init() {
        self.repository = Repository(jsonUrl: Bundle.main.url(forResource: "items", withExtension: "json"))
    }
    
    public func getItems() -> [Item]? {
        return repository.queryAll()
    }
    
    public func getItem(byKey: String) -> Item? {
        return repository.takeFirst(key: byKey)
    }
    
    public func getItem(byName: String) -> Item? {
        return repository.takeFirst(name: byName)
    }
}
