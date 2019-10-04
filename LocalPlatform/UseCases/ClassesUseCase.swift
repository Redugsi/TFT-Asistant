//
//  ClassesUseCase.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation
import Domain

public class ClassesUseCase: Domain.ClassesUseCase{
    
    private let repository: Repository<Class>
    
    init() {
        self.repository = Repository(jsonUrl: Bundle.main.url(forResource: "classes", withExtension: "json"))
    }
    
    public func getClasses() -> [Class]?{
        return repository.queryAll()
    }
    
    public func getClass(byKey: String) -> Class? {
        return repository.takeFirst(key: byKey)
        
    }
    
    public func getClass(byName: String) -> Class? {
        return repository.takeFirst(name: byName)
    }
}
