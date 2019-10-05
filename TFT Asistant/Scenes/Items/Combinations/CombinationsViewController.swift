//
//  CombinationsViewController.swift
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

protocol CombinationsDisplayLogic: class
{
    func displayItems(viewModel: Combinations.ItemsViewModel)
    func displaySelectedItemDetail(viewModel: ItemCombinationDetailViewModel)
}

class CombinationsViewController: UIViewController, CombinationsDisplayLogic
{
    var interactor: CombinationsBusinessLogic?
    var router: (NSObjectProtocol & CombinationsRoutingLogic & CombinationsDataPassing)?
    
    var viewModel: Combinations.ItemsViewModel?
    
    @IBOutlet weak var collectionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var detailView: ItemCombinationDetailView!
    // MARK: Object lifecycle
  
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
    let interactor = CombinationsInteractor()
    let presenter = CombinationsPresenter()
    let router = CombinationsRouter()
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
        setupCollectionView()
        interactor?.getItems(request: Combinations.GetItems.Request())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCellSize()
    }
    
    private func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let cellNib = UINib(nibName: "SquareCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: String(describing: SquareCollectionViewCell.self))
    }
    
    private func setupCellSize(){
        let collectionFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let numberOfItemsInRow: CGFloat = 6
        let lineSpacing: CGFloat = 15
        let itemSpacing: CGFloat = 15
        
        let width = (collectionView.frame.width - (numberOfItemsInRow - 1) * itemSpacing) / numberOfItemsInRow
        
        collectionFlowLayout.itemSize = CGSize(width: width, height: width)
        collectionFlowLayout.minimumLineSpacing = lineSpacing
        collectionFlowLayout.minimumInteritemSpacing = itemSpacing
    }
    
    // MARK: Display
    
    func displayItems(viewModel: Combinations.ItemsViewModel) {
        self.viewModel = viewModel
        self.collectionView.reloadData()
    }
    
    func displaySelectedItemDetail(viewModel: ItemCombinationDetailViewModel) {
        detailView.viewModel = viewModel
        collectionBottomConstraint.constant = detailView.frame.height
    }
}

extension CombinationsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.itemsViewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SquareCollectionViewCell.self), for: indexPath) as! SquareCollectionViewCell
        
        if let item = viewModel?.itemsViewModel?[indexPath.row], let key = item.key{
            cell.imageView.image = UIImage(named: key)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let itemKey = viewModel?.itemsViewModel?[indexPath.row].key{
            interactor?.getSelectedItemDetail(request: Combinations.GetItemByKey.Request(key: itemKey))
        }
    }
}
