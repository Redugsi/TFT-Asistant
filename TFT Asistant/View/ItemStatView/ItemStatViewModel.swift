//
//  ItemStatViewModel.swift
//  TFT Asistant
//
//  Created by erdem on 5.10.2019.
//  Copyright © 2019 Erdem Isguder. All rights reserved.
//

import Foundation

struct ItemStatViewModel{
    var imageName: String?
    var amount: String?
    var colorName: String?
}

public enum ItemStatType{
    case attackDamage(amount: String?)
    case abilityPower(amount: String?)
    case mana(amount: String?)
    case armor(amount: String?)
    case magicResist(amount: String?)
    case health(amount: String?)
    case attackSpeed(amount: String?)
    case critChance(amount: String?)
    case dodge(amount: String?)
    
    init?(type: String?, amount: String?){
        switch type {
        case "attackDamage":
            self = .attackDamage(amount: amount)
        case "abilityPower":
            self = .abilityPower(amount: amount)
        case "mana":
            self = .mana(amount: amount)
        case "armor":
            self = .armor(amount: amount)
        case "magicResist":
            self = .magicResist(amount: amount)
        case "health":
            self = .health(amount: amount)
        case "attackSpeed":
            self = .attackSpeed(amount: amount)
        case "critChance":
            self = .critChance(amount: amount)
        case "dodge":
            self = .dodge(amount: amount)
        default:
            return nil
        }
    }
    
    func builder() -> ItemStatViewModel?{
        switch self {
        case let .attackDamage(amount: amount):
            return ItemStatViewModel(imageName: "icon_dmg", amount: amount, colorName: "color_dmg")
        case let .abilityPower(amount: amount):
            return ItemStatViewModel(imageName: "icon_ap", amount: amount, colorName: "color_ap")
        case let .mana(amount: amount):
            return ItemStatViewModel(imageName: "icon_mana", amount: amount, colorName: "color_mana")
        case let .armor(amount: amount):
            return ItemStatViewModel(imageName: "icon_armor", amount: amount, colorName: "color_armor")
        case let .magicResist(amount: amount):
            return ItemStatViewModel(imageName: "icon_mr", amount: amount, colorName: "color_mr")
        case let .health(amount: amount):
            return ItemStatViewModel(imageName: "icon_hp", amount: amount, colorName: "color_hp")
        case let .attackSpeed(amount: amount):
            return ItemStatViewModel(imageName: "icon_as", amount: amount, colorName: "color_as")
        case let .critChance(amount: amount):
            return ItemStatViewModel(imageName: "icon_cc", amount: amount, colorName: "color_cc")
        case let .dodge(amount: amount):
            return ItemStatViewModel(imageName: "icon_dodge", amount: amount, colorName: "color_dodge")
        }
    }
}
