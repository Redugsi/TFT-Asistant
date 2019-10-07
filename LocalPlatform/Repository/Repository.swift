//
//  Repository.swift
//  TFT Asistant
//
//  Created by erdem on 28.09.2019.
//  Copyright © 2019 redugsi. All rights reserved.
//

import Foundation
import Domain

protocol AbstractRepository {
    associatedtype T
    func queryAll() -> [T]?
    func takeFirst(key: String) -> T?
    func takeFirst(name: String) -> T?
}

final class Repository<T: Domain.Searchable>: AbstractRepository{
    var jsonUrl: URL?
    
    init(jsonUrl: URL?) {
        self.jsonUrl = jsonUrl
    }
    
    private func getAll() -> [T]?{
        do{
            if let path = self.jsonUrl{
                let data = try Data(contentsOf: path)
                let result = try! JSONDecoder().decode([T].self, from: data)
                return result
            }else{
                print("Parse result = Path not found")
                return nil
            }
        }catch{
            print("Parse error = \(error.localizedDescription)")
            return nil
        }
        
    }
    
    func queryAll() -> [T]? {
        return getAll()
    }
    
    func takeFirst(key: String) -> T? {
        let objects = getAll()
        let result = objects?.first(where: { $0.key == key })
        return result
    }
    
    func takeFirst(name: String) -> T? {
        let objects = getAll()
        let result = objects?.first(where: { $0.name == name })
        return result
    }
    
}
