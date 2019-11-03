//
//  TraitsTableViewCell.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class TraitsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageDescriptionView: ImageDescriptionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bonusStackView: UIStackView!
    @IBOutlet weak var championsCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    
    var viewModel: TraitsCellViewModel?{
        didSet{
            initView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupCellSize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCellSize()
        setCollectionHeight()
    }
    
    private func initView(){
        guard let viewModel = viewModel else{
            return
        }
        
        descriptionLabel.text = viewModel.traitDescription

        imageDescriptionView.viewModel = ImageDescriptionViewModel(imageName: viewModel.traitImageName, description: viewModel.traitName)
        
        viewModel.bonuses?.forEach { model in
            let bonusViewModel = BonusViewModel(count: model.needed, description: model.effect)
            let bonusView = BonusView()
            bonusView.viewModel = bonusViewModel
            bonusStackView.addArrangedSubview(bonusView)
        }
        
        setupCellSize()
        setCollectionHeight()
        championsCollectionView.reloadData()
    }
    
    private func setupCollectionView(){
        championsCollectionView.delegate = self
        championsCollectionView.dataSource = self
        
        let nibName = String(describing: ChampionCollectionViewCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        championsCollectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    private func setupCellSize(){
        let collectionFlowLayout = championsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let numberOfItemsInRow: CGFloat = 6
        let lineSpacing: CGFloat = 4
        let itemSpacing: CGFloat = 4
        
        let width = (self.championsCollectionView.frame.width -
            (numberOfItemsInRow - 1) * itemSpacing)
            / numberOfItemsInRow
        
        collectionFlowLayout.itemSize = CGSize(width: width, height: width)
        collectionFlowLayout.minimumLineSpacing = lineSpacing
        collectionFlowLayout.minimumInteritemSpacing = itemSpacing
    }
    
    private func setCollectionHeight(){
        
        let collectionFlowLayout = championsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout

        let numberOfItemsInRow: CGFloat = 6
        let itemSpacing: CGFloat = 4
        
        let width = collectionFlowLayout.itemSize.width
       
        if let championCount = viewModel?.champions?.count {
            let rowItemCount = Double(numberOfItemsInRow)
            let rowCount = (Double(championCount) / rowItemCount).rounded(.up)
            collectionHeightConstraint.constant = (CGFloat(rowCount) * width) + (CGFloat(rowCount) - 1) * itemSpacing
        }else{
            collectionHeightConstraint.constant = 0
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    private func clearCell(){
        imageDescriptionView.viewModel = nil
        descriptionLabel.text = nil
        bonusStackView.removeChildren()
    }
}

extension TraitsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.champions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ChampionCollectionViewCell.self), for: indexPath) as! ChampionCollectionViewCell
        
        if let model = viewModel?.champions?[indexPath.row] {
            cell.viewModel = ChampionCellViewModel(championName: model.name, championPrice: String(model.cost ?? 1), borderColorName: "tier_\(String(describing: model.cost!))")
        }
        
        return cell
    }
}
