//
//  ItemBuilderRouter.swift
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

@objc protocol ItemBuilderRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ItemBuilderDataPassing
{
  var dataStore: ItemBuilderDataStore? { get }
}

class ItemBuilderRouter: NSObject, ItemBuilderRoutingLogic, ItemBuilderDataPassing
{
  weak var viewController: ItemBuilderViewController?
  var dataStore: ItemBuilderDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ItemBuilderViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ItemBuilderDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
