//
//  MultiSelectableCollectionViewCell.swift
//  TFT Asistant
//
//  Created by erdem on 8.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class MultiSelectableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    var selectedCount = 0{
        didSet{
            if selectedCount >= 3{
                selectedCount = 0
                updateView()
            }else{
                animate()
            }
            self.countLabel.text = String(selectedCount)
        }
    }

    var wasSelected: Bool{
        return selectedCount % 3 != 0
    }
    
    var viewModel: MultiSelectableCollectionViewModel?{
        didSet{
            if let viewModel = viewModel{
                initView(viewModel: viewModel)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    private func initView(){
        borderView.layer.borderColor = UIColor(named: "color_highlight")?.cgColor
        borderView.layer.borderWidth = 2.0
        
        countView.layer.borderColor = UIColor(named: "color_highlight")?.cgColor
        countView.layer.borderWidth = 2.0
        countView.layer.cornerRadius = countView.frame.width * 0.5
    }


    private func initView(viewModel: MultiSelectableCollectionViewModel){
        if let imageName = viewModel.imageName{
            self.imageView.image = UIImage(named: imageName)
        }
    }
    
    func didSelect() -> Bool{
        selectedCount = selectedCount + 1
        return wasSelected
    }
    
    func unSelect(){
        selectedCount = 3
    }
    
    private func animate(){
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            if let self = self{
                self.updateView()
            }
        })
    }
    
    private func updateView(){
        self.imageView.alpha = self.wasSelected ? 1.0 : 0.6
        self.borderView.alpha = self.wasSelected ? 1.0 : 0.0
        self.countView.alpha = self.wasSelected ? 1.0 : 0.0
    }
    
    
}
