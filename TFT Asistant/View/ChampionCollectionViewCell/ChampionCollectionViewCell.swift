//
//  ChampionCollectionViewCell.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 22.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class ChampionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var coinView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinLabel: UILabel!
    
    var viewModel: ChampionCellViewModel?{
        didSet{
            if let viewModel = viewModel{
                self.initView(with: viewModel)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isHidden = true
        // Initialization code
    }
    
    private func initView(with viewModel: ChampionCellViewModel){
        self.isHidden = false
        
        if let championName = viewModel.championName{
            imageView.image = UIImage(named: championName)
        }
        
        if let championPrice = viewModel.championPrice{
            coinLabel.text = championPrice
        }
        
        if let bgColor = UIColor(named: viewModel.borderColorName){
            setColors(bgColor: bgColor)
        }
    }
    
    private func setColors(bgColor: UIColor){
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = bgColor.cgColor
        coinView.backgroundColor = bgColor
    }
}
