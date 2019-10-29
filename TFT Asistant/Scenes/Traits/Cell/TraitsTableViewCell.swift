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
    
    var viewModel: TraitsCellViewModel?{
        didSet{
            initView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initView(){
        clearCell()

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
    }
    
    private func clearCell(){
        imageDescriptionView.viewModel = nil
        descriptionLabel.text = nil
        bonusStackView.removeChildren()
    }
    
}
