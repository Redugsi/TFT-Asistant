//
//  BonusView.swift
//  TFT Asistant
//
//  Created by erdem on 28.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import UIKit

class BonusView: UIView{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countView: UIView!
    
    var viewModel: BonusViewModel?{
        didSet{
            if let viewModel = viewModel{
                self.initView(with: viewModel)
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
        Bundle.main.loadNibNamed("BonusView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //setupCountView()
    }
    
    private func setupCountView(){
        countView.layer.cornerRadius = countView.frame.width * 0.5
        countView.layer.borderWidth = 2
        if let color = UIColor(named: "color_divider") {
            countView.layer.borderColor = color.cgColor
        }
    }
    
    private func initView(with viewModel: BonusViewModel){
        if let count = viewModel.count {
            countLabel.text = String(count)
        }
        descriptionLabel.text = viewModel.description
    }
}
