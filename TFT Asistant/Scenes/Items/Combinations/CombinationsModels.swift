//
//  CombinationsModels.swift
//  TFT Asistant
//
//  Created by erdem on 3.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Combinations
{
  // MARK: Use cases
  
    enum GetItems
    {
        struct Request
        {
            
        }
        
        struct Response
        {
            var items: [Item]?
        }
        
        struct ViewModel
        {
            
        }
    }
    
    enum GetItemByName
    {
        struct Request
        {
            var name: String
        }
        
        struct Response
        {
            var item: Item?
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
}
