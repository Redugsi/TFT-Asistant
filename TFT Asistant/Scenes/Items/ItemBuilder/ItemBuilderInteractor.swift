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


protocol ItemBuilderBusinessLogic
{
    func getBaseItems(request: ItemBuilder.GetBaseItems.Request)
    func chooseItem(isSelected: Bool, key: String)
    func getSelectedItemDetail(request: Combinations.GetItemByKey.Request)
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
    let worker: ItemBuilderWorker = ItemBuilderWorker(itemsUseCase: UseCaseProvider().makeItemsUseCase() as! ItemsUseCase)

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
    
    func getSelectedItemDetail(request: Combinations.GetItemByKey.Request) {
        guard let itemList = worker.getAllItems() else{
            return
        }
        
        let choosed = itemList.first{
            $0.key == request.key
        }
        
        guard var choosedItem = choosed else{
            return
        }
        
        let itemStats = getStats(keys: choosedItem.buildsFrom, items: itemList)
        
        choosedItem.stats = itemStats
        
        presenter?.presentSelectedItemDetail(response: ItemBuilder.GetItemByKey.Response(item: choosedItem))
    }
    
    private func getStats(keys: [String]?, items: [Item]?) -> [ItemStat]?{
        guard let itemKeys = keys else{
            return nil
        }
        
        var itemStats = [ItemStat]()
        
        items?.forEach({ item in
            itemKeys.forEach({ x in
                if item.key == x {
                    if let stats = item.stats{
                        itemStats += stats
                    }
                }
            })
        })
        
        return itemStats
    }
    
    private func selectItem(key: String){
        choosedKeys.append(key)
    }
    
    private func deSelectItem(key: String){
        choosedKeys.removeAll(where: { $0 == key})
    }
    
    private func createCombinations(){
        var combinations = [[String]]()

        if choosedKeys.count <= 0 {
            getCombinedItems(combinations: combinations)
            return
        }
        

        if choosedKeys.count == 1{
            combinations.append([choosedKeys[0]])
            getCombinedItems(combinations: combinations)
            return
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
        presenter?.presentCombinedItems(response: response)
    }
}

extension ItemBuilderInteractor{
    func printChoosedKeys() {
        print(choosedKeys)
    }
}
