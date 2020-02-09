//
//  BaseItemsModels.swift
//  TFT Asistant
//
//  Created by erdem on 6.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum BaseItems
{
  // MARK: Use cases
    
    enum GetBaseItems
    {
        struct Request
        {
            
        }
        
        struct Response
        {
            var items: [Item]?
        }
    }
    
    enum GetCombinedItems
    {
        struct Request
        {
            var key: String
        }
        
        struct Response
        {
            var items: [Item]?
        }
    }
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
}
