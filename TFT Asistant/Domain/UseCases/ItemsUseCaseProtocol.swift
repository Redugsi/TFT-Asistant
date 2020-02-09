//
//  ItemUseCase.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol ItemsUseCaseProtocol{
    func getItems() -> [Item]?
    func getItem(byKey: String) -> Item?
    func getItem(byName: String) -> Item?
}
