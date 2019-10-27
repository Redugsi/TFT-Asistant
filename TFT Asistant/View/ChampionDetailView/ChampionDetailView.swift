//
//  ChampionDetailView.swift
//  TFT Asistant
//
//  Created by erdem on 27.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import UIKit

class ChampionDetailView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var abilityName: UILabel!
    @IBOutlet weak var abilityDesc: UILabel!
    
    
    @IBOutlet weak var originsAndClassesStack: UIStackView!
    @IBOutlet weak var abilityStack: UIStackView!
    @IBOutlet weak var itemsStack: UIStackView!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var damage: UILabel!
    @IBOutlet weak var attackSpeed: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var armor: UILabel!
    @IBOutlet weak var magicResist: UILabel!
    
    
    
    
    var viewModel: Champions.ChampionViewModel?{
        didSet{
            
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
        Bundle.main.loadNibNamed("ChampionDetailView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
