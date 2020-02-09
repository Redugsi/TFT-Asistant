//
//  ClassUseCase.swift
//  Domain
//
//  Created by erdem on 25.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation

public protocol ClassesUseCaseProtocol{
    func getClasses() -> [Class]?
    func getClass(byKey: String) -> Class?
    func getClass(byName: String) -> Class?
}
