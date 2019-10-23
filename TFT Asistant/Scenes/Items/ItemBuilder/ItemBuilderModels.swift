//
//  ItemBuilderModels.swift
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

enum ItemBuilder
{
  // MARK: Use cases
    enum GetBaseItems
    {
        struct Request
        {
    
        }
        
        struct Response
        {
            let items: [Item]?
        }
    }
    
    enum GetCombinedItems
    {
        struct Request
        {
            let combinations: [[String]]
        }
        
        struct Response
        {
            let items: [Item]?
        }
    }
    
    enum GetItemByKey
    {
        struct Request
        {
            var key: String
        }
        
        struct Response
        {
            var item: Item?
        }
    }
    
    public struct CollectionAndDetailViewModel:  CollectionAndDetailDisplayable{
        var collectionViewModel: ItemModels.ItemsViewModel?
        var detailViewModel: ItemCombinationDetailViewModel?
    }
}

public protocol CollectionAndDetailDisplayable {
    var collectionViewModel: ItemModels.ItemsViewModel? { get set }
    var detailViewModel: ItemCombinationDetailViewModel? { get set }
}