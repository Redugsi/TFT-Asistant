//
//  ChampionsInteractor.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 22.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChampionsBusinessLogic
{
  func doSomething(request: Champions.Something.Request)
}

protocol ChampionsDataStore
{
  //var name: String { get set }
}

class ChampionsInteractor: ChampionsBusinessLogic, ChampionsDataStore
{
  var presenter: ChampionsPresentationLogic?
  var worker: ChampionsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Champions.Something.Request)
  {
    worker = ChampionsWorker()
    worker?.doSomeWork()
    
    let response = Champions.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
