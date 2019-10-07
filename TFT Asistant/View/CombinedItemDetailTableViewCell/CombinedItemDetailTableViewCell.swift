//
//  CombinedItemDetailTableViewCell.swift
//  TFT Asistant
//
//  Created by erdem on 6.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class CombinedItemDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var itemDetailView: ItemCombinationDetailView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(viewModel: ItemCombinationDetailViewModel?){
        itemDetailView.viewModel = viewModel
    }
    
}
