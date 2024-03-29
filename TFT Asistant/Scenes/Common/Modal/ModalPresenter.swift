//
//  ModalPresenter.swift
//  TFT Asistant
//
//  Created by erdem on 26.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ModalPresentationLogic
{
    func presentSomething(response: Modal.Something.Response)
    func presentDetailView(detailView: UIView)
}

class ModalPresenter: ModalPresentationLogic
{
  weak var viewController: ModalDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Modal.Something.Response)
  {
    let viewModel = Modal.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
    
    func presentDetailView(detailView: UIView) {
        viewController?.displayDetailView(detailView: detailView)
    }
}
