//
//  ItemBuilderWorker.swift
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
import Domain

class ItemBuilderWorker
{
    let itemsUseCase: ItemsUseCase
    
    init(itemsUseCase: ItemsUseCase) {
        self.itemsUseCase = itemsUseCase
    }
    
    func getAllItems() -> [Item]?{
        return itemsUseCase.getItems()
    }
    
    func getBaseItems(request: ItemBuilder.GetBaseItems.Request) -> ItemBuilder.GetBaseItems.Response{
        let baseItems = itemsUseCase.getItems()?.filter({
            $0.buildsFrom == nil
        })
        
        return ItemBuilder.GetBaseItems.Response(items: baseItems)
    }
    
    func getCombinedItems(request: ItemBuilder.GetCombinedItems.Request) -> ItemBuilder.GetCombinedItems.Response{
        
        var combinations = request.combinations
        
        guard let combinedItems = itemsUseCase.getItems()?.filter({ $0.buildsFrom != nil }) else{
            return ItemBuilder.GetCombinedItems.Response(items: nil)
        }
        
        var availableItems: [Item] = [Item]()
        
        combinedLoop: for item in combinedItems{
            guard let buildsFrom = item.buildsFrom else{
                continue combinedLoop
            }
            
            combinationsLoop: for x in 0..<combinations.count{
                
                let combination = combinations[x]
                var foundCount = 0
                
                var buildFromDic: [(String, Bool)]
                buildFromDic = buildsFrom.map({($0, false)})
                
                var combinationDic: [(String, Bool)]
                combinationDic = combination.map({($0, false)})
                
                buildsFromLoop: for y in 0..<buildsFrom.count{
                    
                    for i in 0..<combinationDic.count{
                        if (!combinationDic[i].1 && !buildFromDic[y].1) && combinationDic[i].0 == buildFromDic[y].0{
                            combinationDic[i].1 = true
                            buildFromDic[y].1 = true
                            foundCount = foundCount + 1
                            if foundCount == combinationDic.count{
                                availableItems.append(item)
                                continue combinedLoop
                            }else{
                                continue buildsFromLoop
                            }
                        }
                    }
                }
            }
        }
        
        return ItemBuilder.GetCombinedItems.Response(items: availableItems)
    }
}
