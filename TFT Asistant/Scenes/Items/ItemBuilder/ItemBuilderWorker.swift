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
    
    func getBaseItems(request: ItemBuilder.GetBaseItems.Request) -> ItemBuilder.GetBaseItems.Response{
        let baseItems = itemsUseCase.getItems()?.filter({
            $0.buildsFrom == nil
        })
        
        return ItemBuilder.GetBaseItems.Response(items: baseItems)
    }
    
    func getCombinedItems(request: ItemBuilder.GetCombinedItems.Request) -> ItemBuilder.GetCombinedItems.Response{
        
        var responseItems: [Item]? = nil
        let response: ItemBuilder.GetCombinedItems.Response =
            ItemBuilder.GetCombinedItems.Response(items: responseItems)
        
        let combinations = request.combinations
        
        guard let combinedItems = itemsUseCase.getItems()?.filter({ $0.buildsFrom != nil }) else{
            return response
        }
        
        var availableItems: [Item]? = nil
        
        combinedLoop: for item in combinedItems{
            guard let buildsFrom = item.buildsFrom else{
                continue combinedLoop
            }
            
            print("Item : \(item)")
            
            buildsFromLoop: for key in buildsFrom{
                print("BuildsFrom : \(buildsFrom)")

                combinationsLoop: for combination in combinations{
                    print("combinations : \(combinations)")

                    var foundCount = 0
                    combinationKeyLoop: for combinationKey in combination{
                        print("combination : \(combination)")
                        if combinationKey == key{
                            foundCount = foundCount + 1
                        }
                        
                        if foundCount == buildsFrom.count{
                            availableItems?.append(item)
                            continue combinedLoop
                        }
                    }
                }
            }
        }
        
        return ItemBuilder.GetCombinedItems.Response(items: availableItems)
    }
}
