//
//  TitleDescriptionView.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation
import UIKit

class TitleDescriptionView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    var viewModel: TitleDescriptionViewModel?{
        didSet{
            if let viewModel = viewModel{
                initView(viewModel: viewModel)
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
        Bundle.main.loadNibNamed("TitleDescriptionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initView(viewModel: TitleDescriptionViewModel){
        title.text = viewModel.type ?? ""
        descrip.text = viewModel.desc ?? ""
    }
}
