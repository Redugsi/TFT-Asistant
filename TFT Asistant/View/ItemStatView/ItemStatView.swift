//
//  ItemStatView.swift
//  TFT Asistant
//
//  Created by erdem on 4.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class ItemStatView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    
    var viewModel: ItemStatViewModel?{
        didSet{
            if let viewModel = viewModel{
                initView(with: viewModel)
            }
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
        Bundle.main.loadNibNamed("ItemStatView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initView(with viewModel: ItemStatViewModel){
        if let imageName = viewModel.imageName{
            iconImageView.image = UIImage(named: imageName)
        }
        
        guard let amount = viewModel.amount else{
            return
        }
        amountLabel.text = amount
        
        if let textColorName = viewModel.colorName{
            amountLabel.textColor = UIColor(named: textColorName)
        }
    }
}
