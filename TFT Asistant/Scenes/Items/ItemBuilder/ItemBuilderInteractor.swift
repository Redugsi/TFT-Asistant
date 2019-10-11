//
//  ItemBuilderInteractor.swift
//  TFT Asistant
//
//  Created by erdem on 7.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import LocalPlatform
import Domain

protocol ItemBuilderBusinessLogic
{
    func getBaseItems(request: ItemBuilder.GetBaseItems.Request)
    func chooseItem(isSelected: Bool, key: String)
}

protocol ItemBuilderDataStore
{
    var baseItems: [Item]? { get set }
    var combinedItems: [Item]? { get set }
    var choosedKeys: [String] { get set }
    var baseCombinations: [[String]] { get set }
}

class ItemBuilderInteractor: ItemBuilderBusinessLogic, ItemBuilderDataStore
{
    
  var presenter: ItemBuilderPresentationLogic?
  let worker: ItemBuilderWorker = ItemBuilderWorker(itemsUseCase: LocalPlatform.UseCaseProvider().makeItemsUseCase())

    var baseItems: [Item]?
    var combinedItems: [Item]?
    var choosedKeys: [String] = [String]()
    var baseCombinations: [[String]] = [[String]]()
  // MARK: Do something
  
    func getBaseItems(request: ItemBuilder.GetBaseItems.Request) {
        let response = worker.getBaseItems(request: request)
        
        if response.items != nil{
            presenter?.presentBaseItems(response: response)
        }
    }
    
    func chooseItem(isSelected: Bool, key: String) {
        if isSelected{ selectItem(key: key) } else { deSelectItem(key: key) }
        createCombinations()
    }
    
    private func selectItem(key: String){
        choosedKeys.append(key)
    }
    
    private func deSelectItem(key: String){
        choosedKeys.removeAll(where: { $0 == key })
    }
    
    private func createCombinations(){
        if choosedKeys.count < 0 {
            return
        }
        
        var combinations = [[String]]()

        if choosedKeys.count == 1{
            combinations.append([choosedKeys[0]])
        }
        
        for x in 0 ..< choosedKeys.count - 1{
            for y in x + 1 ..< choosedKeys.count{
                combinations.append([choosedKeys[x], choosedKeys[y]])
            }
        }
        
        getCombinedItems(combinations: combinations)
    }
    
    private func getCombinedItems(combinations: [[String]]){
        let request = ItemBuilder.GetCombinedItems.Request(combinations: combinations)
        let response = worker.getCombinedItems(request: request)
        
        if let items = response.items{
            print(items.map({"\($0.name) - "}))
        }
    }
}

extension ItemBuilderInteractor{
    func printChoosedKeys() {
        print(choosedKeys)
    }
}
