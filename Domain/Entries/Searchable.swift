//
//  Searchable.swift
//  Domain
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol Searchable: Codable {
    var key: String { get set }
    var name: String { get set }
}
