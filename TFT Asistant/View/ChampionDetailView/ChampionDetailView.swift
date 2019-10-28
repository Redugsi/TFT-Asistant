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
        self.isHidden = true
        Bundle.main.loadNibNamed("ChampionDetailView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func initView(with viewModel: Champions.ChampionViewModel){
        self.isHidden = false
        initNameAvatar(with: viewModel)
        initOriginsAndClasses(with: viewModel)
        initStats(with: viewModel)
        initAbilityTitleDesc(with: viewModel)
        initAbilityStats(with: viewModel)
        initItems(with: viewModel)
        initCost(with: viewModel)
    }
    
    private func initNameAvatar(with viewModel: Champions.ChampionViewModel){
        name.text = viewModel.name
        avatar.image = UIImage(named: viewModel.name)
    }
    
    private func initOriginsAndClasses(with viewModel: Champions.ChampionViewModel){
        let originAndClasses = viewModel.championClass + viewModel.origin
        originAndClasses.forEach{ value in
            let imageDescView = ImageDescriptionView()
            let imageDescViewModel = ImageDescriptionViewModel(imageName: value, description: value)
            imageDescView.viewModel = imageDescViewModel
            
            originsAndClassesStack.addArrangedSubview(imageDescView)
        }
    }
    
    private func initStats(with viewModel: Champions.ChampionViewModel){
        damage.text = String(viewModel.stats.offense.damage)
        attackSpeed.text = String(viewModel.stats.offense.attackSpeed)
        health.text = String(viewModel.stats.defense.health)
        armor.text = String(viewModel.stats.defense.armor)
        magicResist.text = String(viewModel.stats.defense.magicResist)
    }
    
    private func initAbilityTitleDesc(with viewModel: Champions.ChampionViewModel){
        abilityName.text = viewModel.ability.name
        abilityDesc.text = viewModel.ability.abilityDescription
    }
    
    private func initAbilityStats(with viewModel: Champions.ChampionViewModel){
        viewModel.ability.stats.forEach{ stat in
            let statView = TitleDescriptionView()
            let statViewModel = TitleDescriptionViewModel(type: stat.type, desc: stat.value)
            statView.viewModel = statViewModel
            abilityStack.addArrangedSubview(statView)
        }
    }
    
    private func initItems(with viewModel: Champions.ChampionViewModel){
        viewModel.items.forEach { name in
            let itemImageView = UIImageView()
            let itemImage = UIImage(named: name)
            itemImageView.image = itemImage
            
            itemImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
            itemImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
            
            itemsStack.addArrangedSubview(itemImageView)
        }
    }
    
    private func initCost(with viewModel: Champions.ChampionViewModel){
        cost.text = String(viewModel.cost)
    }
}
