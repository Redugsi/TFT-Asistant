//
//  ImageDescriptionView.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class ImageDescriptionView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var viewModel: ImageDescriptionViewModel?{
        didSet{
            if let viewModel = viewModel{
                initView(with: viewModel)
            }else{
                clearView()
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
        Bundle.main.loadNibNamed("ImageDescriptionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initView(with viewModel: ImageDescriptionViewModel){
        label.text = viewModel.description ?? ""
        image.image = UIImage(named: viewModel.imageName ?? "")
    }
    
    private func clearView(){
        image.image = nil
        label.text = ""
    }
}
