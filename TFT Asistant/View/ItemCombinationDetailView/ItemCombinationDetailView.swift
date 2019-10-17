//
//  ItemCombinationDetailView.swift
//  TFT Asistant
//
//  Created by erdem on 4.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class ItemCombinationDetailView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statsStackView: UIStackView!
    
    @IBOutlet weak var combinedImageView: UIImageView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    
    var viewModel: ItemCombinationDetailViewModel?{
        didSet{
            guard let viewModel = viewModel else{
                self.isHidden = true
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ItemCombinationDetailView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initView(viewModel: ItemCombinationDetailViewModel){
        self.isHidden = false
        nameLabel.text = viewModel.name.stringValue
        combinedImageView.image = UIImage(named: viewModel.combinedImageName.stringValue)
        firstImageView.image = UIImage(named: viewModel.firstImageName.stringValue)
        secondImageView.image = UIImage(named: viewModel.secondImageName.stringValue)
        bonusLabel.text = viewModel.bonus.stringValue
        separator.isHidden = !viewModel.showSeparator
        statsStackView.removeChildren()

        if let itemStatViewModels = viewModel.statViewModels{
            initStackView(statViewModels: itemStatViewModels)
        }
    }
    
    private func initStackView(statViewModels: [ItemStatViewModel?]){
        statViewModels.forEach{ vm in
            if let viewModel = vm{
                let statView = ItemStatView()
                statsStackView.addArrangedSubview(statView)
                statView.viewModel = viewModel
            }
        }
    }
}
