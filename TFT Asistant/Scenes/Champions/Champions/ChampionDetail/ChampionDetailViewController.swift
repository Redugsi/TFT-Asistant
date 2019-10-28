//
//  ChampionDetailViewController.swift
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

protocol ChampionDetailDisplayLogic: class
{
    func displayChampionDetail(championViewModel: Champions.ChampionViewModel)
}

class ChampionDetailViewController: UIViewController, ChampionDetailDisplayLogic
{
  var interactor: ChampionDetailBusinessLogic?
  var router: (NSObjectProtocol & ChampionDetailRoutingLogic & ChampionDetailDataPassing)?

  // MARK: Object lifecycle
  

    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var championDetailView: ChampionDetailView!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ChampionDetailInteractor()
    let presenter = ChampionDetailPresenter()
    let router = ChampionDetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    interactor?.getChampionDetail()
  }
    
    func displayChampionDetail(championViewModel: Champions.ChampionViewModel) {
        championDetailView.viewModel = championViewModel
        print(championDetailView.frame)
    }
        
    private func calculateHeight(){
        print(scrollView.contentSize)
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        
        scrollView.contentSize = contentRect.size
        
        print(scrollView.contentSize)
    }
}