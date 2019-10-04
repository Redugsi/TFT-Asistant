//
//  OriginUseCase.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol OriginsUseCase {
    func getOrigins() -> [Origin]?
    func getOrigin(byKey: String) -> Origin?
    func getOrigin(byName: String) -> Origin?
}
