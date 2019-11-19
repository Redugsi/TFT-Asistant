//
//  TraitsPresenter.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright (c) 2019 Erdem Isguder. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TraitsPresentationLogic
{
    func presentTraits(response: Traits.GetAllTraits.Response)
}

class TraitsPresenter: TraitsPresentationLogic
{
  weak var viewController: TraitsDisplayLogic?
  
    // MARK: Displays
    func presentTraits(response: Traits.GetAllTraits.Response) {
        if let viewModel = response.traitViewModels {
            viewController?.displayTraits(viewModel: viewModel)
        }
    }
}