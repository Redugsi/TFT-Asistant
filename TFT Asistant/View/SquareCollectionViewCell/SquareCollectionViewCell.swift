//
//  SquareCollectionViewCell.swift
//  TFT Asistant
//
//  Created by Erdem Isguder on 4.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.3, animations: {[weak self] in
                if let self = self{
                    self.imageView.alpha = self.isSelected ? 1.0 : 0.6
                    self.borderView.alpha = self.isSelected ? 1.0 : 0.0
                }
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    private func initView(){
        borderView.layer.borderColor = UIColor(named: "color_pink")?.cgColor
        borderView.layer.borderWidth = 2.0
    }

}
